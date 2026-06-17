import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/domain/entities/product.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartProductAdded>(_onProductAdded);
    on<CartProductRemoved>(_onProductRemoved);
    on<CartQuantityIncremented>(_onQuantityIncremented);
    on<CartQuantityDecremented>(_onQuantityDecremented);
    on<CartCleared>(_onCartCleared);
  }

  void _onProductAdded(CartProductAdded event, Emitter<CartState> emit) {
    final product = event.product;
    print('[CART BLOC] Adding product: ${product.nombre}');

    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );

    List<CartItem> updatedItems;
    if (existingIndex >= 0) {
      updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );
      print('[CART BLOC] Incremented quantity for ${product.nombre}');
    } else {
      updatedItems = [
        ...state.items,
        CartItem(product: product),
      ];
      print('[CART BLOC] Added new item: ${product.nombre}');
    }

    emit(_buildState(updatedItems));
  }

  void _onProductRemoved(CartProductRemoved event, Emitter<CartState> emit) {
    print('[CART BLOC] Removing product: ${event.productId}');
    final updatedItems = state.items
        .where((item) => item.product.id != event.productId)
        .toList();
    emit(_buildState(updatedItems));
  }

  void _onQuantityIncremented(
    CartQuantityIncremented event,
    Emitter<CartState> emit,
  ) {
    print('[CART BLOC] Incrementing quantity: ${event.productId}');
    final updatedItems = state.items.map((item) {
      if (item.product.id == event.productId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
    emit(_buildState(updatedItems));
  }

  void _onQuantityDecremented(
    CartQuantityDecremented event,
    Emitter<CartState> emit,
  ) {
    print('[CART BLOC] Decrementing quantity: ${event.productId}');
    final existingItem = state.items.firstWhere(
      (item) => item.product.id == event.productId,
      orElse: () => CartItem(
        product: Product(
          id: '',
          nombre: '',
          precioVenta: 0,
          precioCompra: 0,
          ivaIncluido: false,
          activo: false,
          empresaId: '',
          createdAt: DateTime(2024),
          updatedAt: DateTime(2024),
        ),
      ),
    );

    List<CartItem> updatedItems;
    if (existingItem.quantity <= 1) {
      updatedItems = state.items
          .where((item) => item.product.id != event.productId)
          .toList();
    } else {
      updatedItems = state.items.map((item) {
        if (item.product.id == event.productId) {
          return item.copyWith(quantity: item.quantity - 1);
        }
        return item;
      }).toList();
    }
    emit(_buildState(updatedItems));
  }

  void _onCartCleared(CartCleared event, Emitter<CartState> emit) {
    print('[CART BLOC] Cart cleared');
    emit(const CartState());
  }

  CartState _buildState(List<CartItem> items) {
    final totalItems = items.fold<int>(0, (sum, item) => sum + item.quantity);
    final subtotal = items.fold<double>(0, (sum, item) => sum + item.subtotal);
    return CartState(
      items: items,
      totalItems: totalItems,
      subtotal: subtotal,
    );
  }
}
