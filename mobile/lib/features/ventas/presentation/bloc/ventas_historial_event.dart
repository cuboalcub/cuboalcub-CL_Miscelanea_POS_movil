import 'package:equatable/equatable.dart';

abstract class VentasHistorialEvent extends Equatable {
  const VentasHistorialEvent();

  @override
  List<Object?> get props => [];
}

class VentasHistorialStarted extends VentasHistorialEvent {
  const VentasHistorialStarted();
}
