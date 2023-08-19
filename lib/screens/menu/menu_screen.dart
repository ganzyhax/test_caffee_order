import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_caffee_orders/screens/menu/bloc/menu_bloc.dart';
import 'package:test_caffee_orders/screens/order/bloc/order_bloc.dart';
import 'package:test_caffee_orders/screens/widgets/nowOrder_card.dart';
import 'package:test_caffee_orders/screens/widgets/product_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var l1 = ['VIP', 'Standart'];
    var l2 = [
      ['VIP1', 'VIP2'],
      ['TABLE 1', 'TABLE 2', 'TABLE 3']
    ];

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuLoaded) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Меню'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton(
                          value: state.type,
                          items: l1.map((tab) {
                            return DropdownMenuItem(
                              child: Text(tab),
                              value: tab,
                            );
                          }).toList(),
                          onChanged: (tab) {
                            context
                                .read<MenuBloc>()
                                .add(MenuChooseType(tab.toString()));
                          },
                        ),
                        DropdownButton(
                          value: state.room,
                          items: (state.type == l1[0])
                              ? l2[0].map((tab) {
                                  return DropdownMenuItem(
                                    child: Text(tab.toString()),
                                    value: tab,
                                  );
                                }).toList()
                              : l2[1].map((tab) {
                                  return DropdownMenuItem(
                                    child: Text(tab.toString()),
                                    value: tab,
                                  );
                                }).toList(),
                          onChanged: (tab) {
                            context
                                .read<MenuBloc>()
                                .add(MenuChooseRoom(tab.toString()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NowOrderCard(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (state.orders.length > 0) {
                          context.read<OrderBloc>().add(OrderAdd(
                              state.room, state.allPrice, state.orders));
                          context.read<MenuBloc>().add(MenuClear());
                          const snackBar = SnackBar(
                            content: Text('Успешно добавлено!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                            color: (state.orders.length > 0)
                                ? Colors.green
                                : Colors.green[200],
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Добавить заказ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    DropdownButton(
                      value: state.dropVal,
                      items: state.tabs.map((tab) {
                        return DropdownMenuItem(
                          child: Text(tab),
                          value: tab,
                        );
                      }).toList(),
                      onChanged: (tab) {
                        context.read<MenuBloc>().add(MenuChangeIndex(tab!));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProductCard(
                      data: state.products[state.index],
                    )
                  ],
                ),
              ));
        }
        return Container();
      },
    );
  }
}
