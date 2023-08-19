import 'package:bloc/bloc.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:test_caffee_orders/screens/menu/menu_screen.dart';
import 'package:test_caffee_orders/screens/order/order_screen.dart';
import 'package:test_caffee_orders/services/service.dart';

part 'bottom_tab_event.dart';
part 'bottom_tab_state.dart';

class BottomTabBloc extends Bloc<BottomTabEvent, BottomTabState> {
  BottomTabBloc() : super(BottomTabInitial()) {
    var pages = [MenuPage(), OrderPage()];

    var index = 0;
    on<BottomTabEvent>((event, emit) {
      if (event is BottomTabLoad) {
        emit(BottomTabLoaded(index, pages));
      }
      if (event is BottomTabChange) {
        index = event.index;
        emit(BottomTabLoaded(index, pages));
      }
    });
  }
}
