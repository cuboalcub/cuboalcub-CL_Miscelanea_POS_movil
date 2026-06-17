import 'package:equatable/equatable.dart';

import '../../../products/domain/entities/product.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded({required this.product});

  @override
  List<Object?> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final String productId;

  const CartProductRemoved({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CartQuantityIncremented extends CartEvent {
  final String productId;

  const CartQuantityIncremented({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CartQuantityDecremented extends CartEvent {
  final String productId;

  const CartQuantityDecremented({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CartCleared extends CartEvent {
  const CartCleared();
}
