part of 'menu_bloc.dart';

@immutable
class MenuEvent {}

class MenuLoad extends MenuEvent {}

class MenuChangeIndex extends MenuEvent {
  String index;
  MenuChangeIndex(this.index);
  @override
  List<Object> get props => [index];
}

class MenuAddOrder extends MenuEvent {
  var name;
  var price;
  var count;
  MenuAddOrder(this.name, this.price, this.count);
  List<Object> get props => [name, price, count];
}

class MenuAddCount extends MenuEvent {
  var name;
  MenuAddCount(
    this.name,
  );
  List<Object> get props => [name];
}

class MenuDeleteCount extends MenuEvent {
  var name;
  MenuDeleteCount(
    this.name,
  );
  List<Object> get props => [name];
}

class MenuClear extends MenuEvent {}

class MenuChooseType extends MenuEvent {
  var name;
  MenuChooseType(this.name);
  List<Object> get props => [name];
}

class MenuChooseRoom extends MenuEvent {
  var name;
  MenuChooseRoom(this.name);
  List<Object> get props => [name];
}
