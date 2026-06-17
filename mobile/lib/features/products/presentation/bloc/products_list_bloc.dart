import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/products_repository.dart';
import 'products_list_event.dart';
import 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final ProductsRepository _productsRepository;
  static const int _pageSize = 20;

  ProductsListBloc({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(const ProductsListInitial()) {
    on<ProductsListStarted>(_onStarted);
    on<ProductsListLoadMore>(_onLoadMore);
    on<ProductsListRefresh>(_onRefresh);
  }

  Future<void> _onStarted(
    ProductsListStarted event,
    Emitter<ProductsListState> emit,
  ) async {
    print('[PRODUCTS LIST] Started - loading first page');
    emit(const ProductsListLoading());
    try {
      final products = await _productsRepository.getProducts(
        limit: _pageSize,
        offset: 0,
      );
      print('[PRODUCTS LIST] Loaded ${products.length} products (offset: 0)');
      final hasReachedEnd = products.length < _pageSize;
      print('[PRODUCTS LIST] hasReachedEnd: $hasReachedEnd');
      emit(ProductsListLoaded(
        products: products,
        hasReachedEnd: hasReachedEnd,
      ));
    } catch (e) {
      print('[PRODUCTS LIST] Error on start: $e');
      emit(ProductsListError(message: e.toString()));
    }
  }

  Future<void> _onLoadMore(
    ProductsListLoadMore event,
    Emitter<ProductsListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ProductsListLoaded) return;
    if (currentState.hasReachedEnd) return;

    final offset = currentState.products.length;
    print('[PRODUCTS LIST] LoadMore - offset: $offset');

    try {
      final newProducts = await _productsRepository.getProducts(
        limit: _pageSize,
        offset: offset,
      );
      print('[PRODUCTS LIST] Loaded ${newProducts.length} products (offset: $offset)');
      final hasReachedEnd = newProducts.length < _pageSize;
      print('[PRODUCTS LIST] hasReachedEnd: $hasReachedEnd');
      emit(ProductsListLoaded(
        products: [...currentState.products, ...newProducts],
        hasReachedEnd: hasReachedEnd,
      ));
    } catch (e) {
      print('[PRODUCTS LIST] Error loading more: $e');
      emit(ProductsListError(message: e.toString()));
    }
  }

  Future<void> _onRefresh(
    ProductsListRefresh event,
    Emitter<ProductsListState> emit,
  ) async {
    print('[PRODUCTS LIST] Refresh - reloading from offset 0');
    try {
      final products = await _productsRepository.getProducts(
        limit: _pageSize,
        offset: 0,
      );
      print('[PRODUCTS LIST] Refreshed ${products.length} products');
      final hasReachedEnd = products.length < _pageSize;
      print('[PRODUCTS LIST] hasReachedEnd: $hasReachedEnd');
      emit(ProductsListLoaded(
        products: products,
        hasReachedEnd: hasReachedEnd,
      ));
    } catch (e) {
      print('[PRODUCTS LIST] Error refreshing: $e');
      emit(ProductsListError(message: e.toString()));
    }
  }
}
