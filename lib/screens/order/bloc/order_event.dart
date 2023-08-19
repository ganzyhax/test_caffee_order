part of 'order_bloc.dart';

@immutable
class OrderEvent {}

class OrderLoad extends OrderEvent {}

class OrderAdd extends OrderEvent {
  var table;
  var price;
  var list;

  OrderAdd(this.table, this.price, this.list);
  List<Object> get props => [table, price, list];
}
