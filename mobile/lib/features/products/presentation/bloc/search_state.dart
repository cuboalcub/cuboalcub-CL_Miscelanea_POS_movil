import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {
  final String query;

  const SearchLoading({required this.query});

  @override
  List<Object?> get props => [query];
}

class SearchSuccess extends SearchState {
  final List<Product> products;
  final String query;

  const SearchSuccess({required this.products, required this.query});

  @override
  List<Object?> get props => [products, query];
}

class SearchEmpty extends SearchState {
  final String query;

  const SearchEmpty({required this.query});

  @override
  List<Object?> get props => [query];
}

class SearchError extends SearchState {
  final String message;
  final String query;

  const SearchError({required this.message, required this.query});

  @override
  List<Object?> get props => [message, query];
}
