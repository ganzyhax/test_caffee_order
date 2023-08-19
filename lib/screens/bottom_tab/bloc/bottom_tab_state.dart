part of 'bottom_tab_bloc.dart';

@immutable
class BottomTabState {}

class BottomTabInitial extends BottomTabState {}

class BottomTabLoaded extends BottomTabState {
  var index;
  var pages;

  BottomTabLoaded(
    this.index,
    this.pages,
  );
  @override
  List<Object> get props => [
        index,
        pages,
      ];
}
