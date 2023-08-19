import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_caffee_orders/services/service.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    List<String> tabs = [];
    String dropVal = '';
    var products = [];
    var index = 0;
    var orders = [];
    var type = 'VIP';
    var room = 'VIP1';
    num allPrice = 0;

    on<MenuEvent>((event, emit) async {
      if (event is MenuLoad) {
        var data = await Services().initDb();

        for (var i = 0; i < data[0].length; i++) {
          var name = data[0][i]['name'];
          dropVal = name.toString();

          tabs.add(name);
          products.add(data[0][i]['subFoods']);
        }

        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuChangeIndex) {
        dropVal = event.index;
        for (var i = 0; i < tabs.length; i++) {
          if (dropVal == tabs[i]) {
            index = i;
          }
        }
        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuAddCount) {
        var check = 0;
        for (var i = 0; i < orders.length; i++) {
          allPrice = allPrice + orders[i]['price'];

          if (event.name == orders[i]['name']) {
            orders[i]['count'] = orders[i]['count'] + 1;
          }
        }

        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuDeleteCount) {
        var check = 0;
        for (var i = 0; i < orders.length; i++) {
          if (event.name == orders[i]['name']) {
            if (orders[i]['count'] != 0) {
              allPrice = allPrice - orders[i]['price'];
              orders[i]['count'] = orders[i]['count'] - 1;
            }
            if (orders[i]['count'] == 0) {
              allPrice = 0;
              orders.removeAt(index);
            }
          }
        }

        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuAddOrder) {
        var check = 0;

        for (var i = 0; i < orders.length; i++) {
          if (event.name == orders[i]['name']) {
            check = 1;
          }
        }
        allPrice = allPrice + event.price;
        if (check == 0) {
          orders.add(
              {'name': event.name, 'price': event.price, 'count': event.count});
        }

        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuChooseType) {
        type = event.name;
        if (type == 'VIP') {
          room = 'VIP1';
        } else {
          room = 'TABLE 1';
        }
        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuChooseRoom) {
        room = event.name;

        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
      if (event is MenuClear) {
        type = 'VIP';
        room = 'VIP1';
        orders = [];
        allPrice = 0;
        emit(MenuLoaded(
            tabs, products, index, dropVal, orders, type, room, allPrice));
      }
    });
  }
}
