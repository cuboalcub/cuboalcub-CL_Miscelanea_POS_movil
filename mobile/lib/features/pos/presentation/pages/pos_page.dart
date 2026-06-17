import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../products/domain/entities/product.dart';
import '../../../products/presentation/bloc/search_bloc.dart';
import '../../../products/presentation/bloc/search_event.dart';
import '../../../products/presentation/bloc/search_state.dart';
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    final query = value.trim();
    _currentQuery = query;
    print('[POS UI] Dispatching SearchQueryChanged');
    context.read<SearchBloc>().add(SearchQueryChanged(query: value));
  }

  void _onSearchCleared() {
    _searchController.clear();
    _currentQuery = '';
    context.read<SearchBloc>().add(const SearchCleared());
  }

  void _addToCart(Product product) {
    print('[POS UI] Adding to cart: ${product.nombre}');
    context.read<CartBloc>().add(CartProductAdded(product: product));
  }

  void _incrementQuantity(String productId) {
    context.read<CartBloc>().add(CartQuantityIncremented(productId: productId));
  }

  void _decrementQuantity(String productId) {
    context.read<CartBloc>().add(CartQuantityDecremented(productId: productId));
  }

  void _onCheckout() {
    print('[POS UI] Checkout tapped');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidad pendiente'),
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
    print('[POS UI] POSPage build called');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            print('[POS UI] SearchBloc create called');
            return sl<SearchBloc>();
          },
        ),
        BlocProvider(
          create: (_) {
            print('[POS UI] CartBloc create called');
            return sl<CartBloc>();
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Punto de Venta'),
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
                      ? _buildEmptySearch()
                      : _buildSearchResults(),
                ),
              ],
            ),
            bottomNavigationBar: _buildCartSummaryBar(),
          );
        },
      ),
    );
  }

  Widget _buildEmptySearch() {
    return const Center(
      child: Text('Busca un producto para agregar al carrito'),
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        print('[POS UI] State changed: ${state.runtimeType}');

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
            },
          );
        }

        return const SizedBox.shrink();
      },
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
                              return ListTile(
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
                                  ],
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
