import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/services/sync_status_service.dart';
import '../../../../core/widgets/sync_status_indicator.dart';
import '../../../products/domain/entities/product.dart';
import '../../../products/presentation/bloc/products_list_bloc.dart';
import '../../../products/presentation/bloc/products_list_event.dart';
import '../../../products/presentation/bloc/products_list_state.dart';
import '../../../products/presentation/bloc/search_bloc.dart';
import '../../../products/presentation/bloc/search_event.dart';
import '../../../products/presentation/bloc/search_state.dart';
import '../../../ventas/data/models/create_venta_request.dart';
import '../../../ventas/presentation/bloc/venta_bloc.dart';
import '../../../ventas/presentation/bloc/venta_event.dart';
import '../../../ventas/presentation/bloc/venta_state.dart';
import 'venta_success_page.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class POSPage extends StatefulWidget {
  const POSPage({super.key});

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {
  final _searchController = TextEditingController();
  String _currentQuery = '';

  static const _formasPago = [
    {'codigo': '01', 'nombre': 'Efectivo'},
    {'codigo': '03', 'nombre': 'Tarjeta de crédito'},
    {'codigo': '04', 'nombre': 'Tarjeta de débito'},
    {'codigo': '05', 'nombre': 'Monedero electrónico'},
    {'codigo': '28', 'nombre': 'Transferencia'},
  ];

  static const _usosCfdi = [
    {'codigo': 'G01', 'nombre': 'Adquisición de mercancías'},
    {'codigo': 'G02', 'nombre': 'Gastos en general'},
    {'codigo': 'G03', 'nombre': 'Gastos en combustibles'},
    {'codigo': 'D01', 'nombre': 'Equipos de cómputo'},
    {'codigo': 'I01', 'nombre': 'Construcciones'},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsListBloc>().add(const ProductsListStarted());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    final query = value.trim();
    _currentQuery = query;
    if (query.isEmpty) {
      context.read<SearchBloc>().add(const SearchCleared());
    } else {
      context.read<SearchBloc>().add(SearchQueryChanged(query: value));
    }
  }

  void _onSearchCleared() {
    _searchController.clear();
    _currentQuery = '';
    context.read<SearchBloc>().add(const SearchCleared());
  }

  void _addToCart(Product product) {
    context.read<CartBloc>().add(CartProductAdded(product: product));
  }

  void _incrementQuantity(String productId) {
    context.read<CartBloc>().add(CartQuantityIncremented(productId: productId));
  }

  void _decrementQuantity(String productId) {
    context.read<CartBloc>().add(CartQuantityDecremented(productId: productId));
  }

  void _removeFromCart(String productId) {
    context.read<CartBloc>().add(CartProductRemoved(productId: productId));
  }

  void _onCheckout() {
    final cartState = context.read<CartBloc>().state;
    if (cartState.items.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<CartBloc>()),
          BlocProvider.value(value: context.read<VentaBloc>()),
        ],
        child: _CheckoutModal(
          formasPago: _formasPago,
          usosCfdi: _usosCfdi,
        ),
      ),
    );
  }

  void _showCartSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<CartBloc>(),
        child: Builder(
          builder: (sheetContext) => _buildCartBottomSheet(sheetContext),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VentaBloc, VentaState>(
      listener: (context, state) {
        if (state is VentaError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Punto de Venta'),
          actions: [
            SyncStatusIndicator(syncStatusService: sl<SyncStatusService>()),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Buscar producto',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                  suffixIcon: _currentQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: _onSearchCleared,
                        )
                      : null,
                ),
                onChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: _currentQuery.isEmpty
                  ? _buildProductList()
                  : _buildSearchResults(),
            ),
          ],
        ),
        bottomNavigationBar: _buildCartSummaryBar(),
      ),
    );
  }

  Widget _buildProductList() {
    return BlocBuilder<ProductsListBloc, ProductsListState>(
      builder: (context, state) {
        if (state is ProductsListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductsListError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductsListBloc>().add(const ProductsListRefresh());
                  },
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          );
        }

        if (state is ProductsListLoaded) {
          if (state.products.isEmpty) {
            return const Center(
              child: Text('No hay productos disponibles'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProductsListBloc>().add(const ProductsListRefresh());
            },
            child: ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return _buildProductTile(product);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: Text('Escribe para buscar productos'),
          );
        }

        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchEmpty) {
          return Center(
            child: Text('No se encontraron resultados para "${state.query}"'),
          );
        }

        if (state is SearchError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return _buildProductTile(product);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildProductTile(Product product) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        title: Text(
          product.nombre,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '\$${product.precioVenta.toStringAsFixed(2)}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () => _addToCart(product),
        ),
        onTap: () => _addToCart(product),
      ),
    );
  }

  Widget _buildCartSummaryBar() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.items.isNotEmpty)
                  GestureDetector(
                    onTap: _showCartSheet,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${state.totalItems} producto${state.totalItems == 1 ? '' : 's'} '
                            '- \$${state.subtotal.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Ver carrito',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Icon(Icons.chevron_right, size: 20),
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: state.items.isEmpty ? null : _onCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Cobrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCartBottomSheet(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Text(
                          'Carrito',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        if (state.items.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              context.read<CartBloc>().add(const CartCleared());
                              Navigator.pop(context);
                            },
                            child: const Text('Vaciar'),
                          ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: state.items.isEmpty
                        ? const Center(child: Text('El carrito está vacío'))
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              final item = state.items[index];
                              return Dismissible(
                                key: ValueKey(item.product.id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  color: Colors.red,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                confirmDismiss: (_) async {
                                  return await showDialog<bool>(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text('Eliminar producto'),
                                      content: Text(
                                          '¿Eliminar "${item.product.nombre}" del carrito?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(ctx, false),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(ctx, true),
                                          child: const Text('Eliminar',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                onDismissed: (_) {
                                  _removeFromCart(item.product.id);
                                },
                                child: ListTile(
                                  title: Text(item.product.nombre),
                                  subtitle: Text(
                                    '\$${item.product.precioVenta.toStringAsFixed(2)} x ${item.quantity}',
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                        onPressed: () => _decrementQuantity(
                                            item.product.id),
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        onPressed: () => _incrementQuantity(
                                            item.product.id),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        ),
                                        onPressed: () =>
                                            _removeFromCart(item.product.id),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Productos:'),
                            Text('${state.totalItems}'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${state.subtotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: state.items.isEmpty
                                ? null
                                : () {
                                    Navigator.pop(context);
                                    _onCheckout();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Cobrar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _CheckoutModal extends StatefulWidget {
  final List<Map<String, String>> formasPago;
  final List<Map<String, String>> usosCfdi;

  const _CheckoutModal({
    required this.formasPago,
    required this.usosCfdi,
  });

  @override
  State<_CheckoutModal> createState() => _CheckoutModalState();
}

class _CheckoutModalState extends State<_CheckoutModal> {
  String _selectedFormaPago = '01';
  String _selectedUsoCfdi = 'G01';

  @override
  Widget build(BuildContext context) {
    return BlocListener<VentaBloc, VentaState>(
      listener: (context, state) {
        if (state is VentaSuccess) {
          final ventaBloc = context.read<VentaBloc>();
          final cartBloc = context.read<CartBloc>();
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => VentaSuccessPage(
                total: state.total,
                formaPago: state.formaPago,
                ventaId: state.ventaId,
                ventaBloc: ventaBloc,
                cartBloc: cartBloc,
              ),
            ),
          );
        } else if (state is VentaError) {
          Navigator.pop(context);
        }
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Confirmar venta',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(16),
                        children: [
                          const Text(
                            'Forma de pago',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...widget.formasPago.map((fp) => RadioListTile<String>(
                                title: Text(fp['nombre']!),
                                value: fp['codigo']!,
                                groupValue: _selectedFormaPago,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() => _selectedFormaPago = value);
                                  }
                                },
                              )),
                          const SizedBox(height: 16),
                          const Text(
                            'Uso de CFDI',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...widget.usosCfdi.map((uc) => RadioListTile<String>(
                                title: Text(uc['nombre']!),
                                value: uc['codigo']!,
                                groupValue: _selectedUsoCfdi,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() => _selectedUsoCfdi = value);
                                  }
                                },
                              )),
                          const Divider(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Productos:'),
                              Text('${cartState.totalItems}'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${cartState.subtotal.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: BlocBuilder<VentaBloc, VentaState>(
                        builder: (context, ventaState) {
                          final isLoading = ventaState is VentaLoading;
                          return SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: isLoading || cartState.items.isEmpty
                                  ? null
                                  : () => _confirmarVenta(context, cartState),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'Confirmar venta',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _confirmarVenta(BuildContext context, CartState cartState) {
    final bloc = context.read<VentaBloc>();
    final sessionManager = sl<SessionManager>();
    final session = sessionManager.session;

    final items = cartState.items.map((item) {
      return CreateVentaItemRequest(
        productoId: item.product.id,
        cantidad: item.quantity,
        precioUnitario: item.product.precioVenta,
      );
    }).toList();

    final subtotal = cartState.subtotal;
    final iva = 0.0;
    final total = subtotal + iva;

    bloc.add(VentaConfirmar(
      empresaId: session?.empresaId ?? '',
      usuarioId: session?.usuarioId ?? '',
      sucursalId: session?.activeSucursalId,
      formaPago: _selectedFormaPago,
      metodoPago: 'PUE',
      usoCfdi: _selectedUsoCfdi,
      items: items,
      subtotal: subtotal,
      iva: iva,
      total: total,
    ));
  }
}
