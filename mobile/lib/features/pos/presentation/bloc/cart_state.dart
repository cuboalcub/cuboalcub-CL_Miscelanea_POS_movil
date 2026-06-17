import 'package:equatable/equatable.dart';

import '../../../products/domain/entities/product.dart';

class CartItem extends Equatable {
  final Product product;
  final int quantity;

  const CartItem({required this.product, this.quantity = 1});

  double get subtotal => product.precioVenta * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}

class CartState extends Equatable {
  final List<CartItem> items;
  final int totalItems;
  final double subtotal;

  const CartState({
    this.items = const [],
    this.totalItems = 0,
    this.subtotal = 0.0,
  });

  @override
  List<Object?> get props => [items, totalItems, subtotal];
}
