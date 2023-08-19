import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_caffee_orders/screens/bottom_tab/bloc/bottom_tab_bloc.dart';
import 'package:test_caffee_orders/screens/bottom_tab/bottom_tab.dart';
import 'package:test_caffee_orders/screens/menu/bloc/menu_bloc.dart';
import 'package:test_caffee_orders/screens/order/bloc/order_bloc.dart';
import 'package:test_caffee_orders/services/service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              BottomTabBloc()..add(BottomTabLoad()),
        ),
        BlocProvider(
          create: (BuildContext context) => MenuBloc()..add(MenuLoad()),
        ),
        BlocProvider(
          create: (BuildContext context) => OrderBloc()..add(OrderLoad()),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BottomPage()),
    );
  }
}
