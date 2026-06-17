import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductsListState extends Equatable {
  const ProductsListState();

  @override
  List<Object?> get props => [];
}

class ProductsListInitial extends ProductsListState {
  const ProductsListInitial();
}

class ProductsListLoading extends ProductsListState {
  const ProductsListLoading();
}

class ProductsListLoaded extends ProductsListState {
  final List<Product> products;
  final bool hasReachedEnd;

  const ProductsListLoaded({
    required this.products,
    required this.hasReachedEnd,
  });

  @override
  List<Object?> get props => [products, hasReachedEnd];
}

class ProductsListError extends ProductsListState {
  final String message;

  const ProductsListError({required this.message});

  @override
  List<Object?> get props => [message];
}
