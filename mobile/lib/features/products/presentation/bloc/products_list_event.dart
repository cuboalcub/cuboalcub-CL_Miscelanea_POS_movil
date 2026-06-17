import 'package:equatable/equatable.dart';

abstract class ProductsListEvent extends Equatable {
  const ProductsListEvent();

  @override
  List<Object?> get props => [];
}

class ProductsListStarted extends ProductsListEvent {
  const ProductsListStarted();
}

class ProductsListLoadMore extends ProductsListEvent {
  const ProductsListLoadMore();
}

class ProductsListRefresh extends ProductsListEvent {
  const ProductsListRefresh();
}
