import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/products_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductsRepository _productsRepository;
  final Duration _debounceDuration;
  Timer? _debounceTimer;

  SearchBloc({
    required ProductsRepository productsRepository,
    Duration debounceDuration = const Duration(milliseconds: 275),
  })  : _productsRepository = productsRepository,
        _debounceDuration = debounceDuration,
        super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchCleared>(_onSearchCleared);
    on<SearchQueryExecute>(_onSearchQueryExecute);
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }

  void _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) {
    final query = event.query.trim();
    print('[SEARCH BLOC] Event received: SearchQueryChanged');
    print('[SEARCH] Query changed: "$query"');

    if (query.isEmpty) {
      _debounceTimer?.cancel();
      emit(SearchInitial());
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      print('[SEARCH] Debounce fired');
      add(SearchQueryExecute(query: query));
    });
  }

  Future<void> _onSearchCleared(
    SearchCleared event,
    Emitter<SearchState> emit,
  ) async {
    _debounceTimer?.cancel();
    emit(SearchInitial());
  }

  Future<void> _onSearchQueryExecute(
    SearchQueryExecute event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query;
    print('[SEARCH] Executing query: "$query"');

    emit(SearchLoading(query: query));
    try {
      final results = await _productsRepository.searchProducts(query);
      print('[SEARCH] Results count: ${results.length}');
      if (results.isEmpty) {
        emit(SearchEmpty(query: query));
      } else {
        emit(SearchSuccess(products: results, query: query));
      }
    } catch (e) {
      emit(SearchError(
        message: e.toString(),
        query: query,
      ));
    }
  }
}
