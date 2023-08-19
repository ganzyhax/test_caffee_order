import 'dart:convert';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Services {
  Future<dynamic> initDb() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = [];
    var orders = [];

    list.add({
      'name': 'Бургер',
      'subFoods': [
        {
          'name': 'Стандарт Бургер',
          'price': 290,
          'image':
              'https://w7.pngwing.com/pngs/369/24/png-transparent-hamburger-chicken-sandwich-veggie-burger-fast-food-burger-king-food-recipe-fast-food-restaurant.png'
        },
        {
          'name': 'Бургер Большой',
          'price': 360,
          'image':
              'https://w7.pngwing.com/pngs/369/24/png-transparent-hamburger-chicken-sandwich-veggie-burger-fast-food-burger-king-food-recipe-fast-food-restaurant.png'
        }
      ]
    });
    list.add({
      'name': 'Пицца',
      'subFoods': [
        {
          'name': 'Маргарита',
          'price': 490,
          'image':
              'https://thumbs.dreamstime.com/b/sliced-pizza-margherita-cheese-tomatoes-mozzarella-basil-crumpled-paper-margarita-thin-dough-top-view-one-134579007.jpg'
        },
        {
          'name': '4 сезона',
          'price': 560,
          'image':
              'https://www.nicepng.com/png/detail/776-7761209_four-seasons-pizza-png.png'
        }
      ]
    });
    list.add({
      'name': 'Напитки',
      'subFoods': [
        {
          'name': 'Coca Cola',
          'price': 190,
          'image':
              'https://w1.pngwing.com/pngs/940/1013/png-transparent-coca-cola-fizzy-drinks-cocacola-diet-coke-cocacola-zero-sugar-cocacola-life-coca-cola-drink-supermarket.png'
        },
        {
          'name': 'Gorilla Energy',
          'price': 160,
          'image':
              'https://vodovoz.ru/upload/iblock/022/ohagdg8pp3hmezpy1t92xj6wr272gvqi.jpeg'
        }
      ]
    });

    if (prefs.getString("localOrders") == null) {
    } else {
      final List list1 = jsonDecode(prefs.getString("localOrders").toString());
      orders = list1;
    }
    return [list, orders];
  }

  Future<dynamic> addOrder(stol, price, lists) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = [];
    list.add({'name': stol, 'price': price, 'list': lists});
    if (prefs.getString("localOrders") == null) {
      final jsonData = jsonEncode(list);
      prefs.setString("localOrders", jsonData);
    }
  }
}
