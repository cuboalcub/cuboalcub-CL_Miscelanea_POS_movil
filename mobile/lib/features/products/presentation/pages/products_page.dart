import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[SEARCH UI] ===== ProductsPage build called =====');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('[SEARCH UI] ProductsPage loaded')),
      );
    });
    return BlocProvider(
      create: (_) {
        print('[SEARCH UI] BlocProvider create called');
        return sl<SearchBloc>();
      },
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
                    decoration: const InputDecoration(
                      labelText: 'Buscar productos',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      print('[SEARCH UI] ===== Text changed: "$value" =====');
                      print('[SEARCH UI] Dispatching SearchQueryChanged');
                      context.read<SearchBloc>().add(
                            SearchQueryChanged(query: value),
                          );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
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
                            return ListTile(
                              title: Text(product.nombre),
                              subtitle: Text('\$${product.precioVenta}'),
                            );
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
