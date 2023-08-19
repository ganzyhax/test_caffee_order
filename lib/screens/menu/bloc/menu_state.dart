part of 'menu_bloc.dart';

@immutable
class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoaded extends MenuState {
  List<String> tabs;
  var products;
  var index;
  var orders = [];
  var type;
  var room;
  var allPrice;
  String dropVal;
  MenuLoaded(this.tabs, this.products, this.index, this.dropVal, this.orders,
      this.type, this.room, this.allPrice);
  @override
  List<Object> get props =>
      [tabs, products, index, dropVal, orders, type, room, allPrice];
}
