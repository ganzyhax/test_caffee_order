part of 'bottom_tab_bloc.dart';

@immutable
class BottomTabEvent {}

class BottomTabLoad extends BottomTabEvent {}

class BottomTabChange extends BottomTabEvent {
  var index;

  BottomTabChange(this.index);
  @override
  List<Object> get props => [index];
}
