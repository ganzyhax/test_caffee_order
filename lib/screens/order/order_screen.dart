import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_caffee_orders/screens/order/bloc/order_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказы'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoaded) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.orders.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Посетитель'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(state.orders[index]['name'])
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Номер: ' + (index + 1).toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(state.orders[index]['price'].toString())
                                ],
                              ),
                            ],
                          ),
                          ExpansionTile(title: Text('Детали'), children: [
                            ListView.builder(
                              itemCount: state.orders[index]['list'].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index2) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(state.orders[index]['list']
                                              [index2]['name']),
                                          Text(state.orders[index]['list']
                                                      [index2]['price']
                                                  .toString() +
                                              ' руб')
                                        ],
                                      ),
                                      Text(state.orders[index]['list'][index2]
                                                  ['count']
                                              .toString() +
                                          ' шт'),
                                    ],
                                  ),
                                );
                              },
                            )
                          ] // Add all items you wish to show when the tile is expanded
                              )
                        ],
                      ),
                    );
                  }));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
