import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';
import '../bloc/products_list_bloc.dart';
import '../bloc/products_list_event.dart';
import '../bloc/products_list_state.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      print('[PRODUCTS LIST] Scroll near end - dispatching LoadMore');
      context.read<ProductsListBloc>().add(const ProductsListLoadMore());
    }
  }

  void _onSearchChanged(String value) {
    final query = value.trim();
    _currentQuery = query;
    print('[SEARCH UI] Dispatching SearchQueryChanged');
    context.read<SearchBloc>().add(SearchQueryChanged(query: value));
  }

  void _onSearchCleared() {
    _searchController.clear();
    _currentQuery = '';
    context.read<SearchBloc>().add(const SearchCleared());
  }

  @override
  Widget build(BuildContext context) {
    print('[PRODUCTS LIST] ===== ProductsPage build called =====');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            print('[SEARCH UI] SearchBloc create called');
            return sl<SearchBloc>();
          },
        ),
        BlocProvider(
          create: (_) {
            print('[PRODUCTS LIST] ProductsListBloc create called');
            return sl<ProductsListBloc>()..add(const ProductsListStarted());
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Productos'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Buscar productos',
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
                      ? _buildCatalog(context)
                      : _buildSearchResults(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCatalog(BuildContext context) {
    return BlocBuilder<ProductsListBloc, ProductsListState>(
      builder: (context, state) {
        print('[PRODUCTS LIST] State changed: ${state.runtimeType}');

        if (state is ProductsListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductsListError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error: ${state.message}'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ProductsListBloc>()
                        .add(const ProductsListStarted());
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
              print('[PRODUCTS LIST] Pull-to-refresh triggered');
              context
                  .read<ProductsListBloc>()
                  .add(const ProductsListRefresh());
            },
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: state.hasReachedEnd
                  ? state.products.length
                  : state.products.length + 1,
              itemBuilder: (context, index) {
                if (index == state.products.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final product = state.products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: ListTile(
                    title: Text(
                      product.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '\$${product.precioVenta.toStringAsFixed(2)}',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        print('[SEARCH UI] State changed: ${state.runtimeType}');

        if (state is SearchInitial) {
          return const Center(
            child: Text('Escribe para buscar productos'),
          );
        }

        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchEmpty) {
          return Center(
            child: Text(
                'No se encontraron resultados para "${state.query}"'),
          );
        }

        if (state is SearchError) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        }

        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: ListTile(
                  title: Text(
                    product.nombre,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '\$${product.precioVenta.toStringAsFixed(2)}',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
