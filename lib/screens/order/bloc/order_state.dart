part of 'order_bloc.dart';

@immutable
class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoaded extends OrderState {
  var orders;
  OrderLoaded(this.orders);
  @override
  List<Object> get props => [orders];
}
