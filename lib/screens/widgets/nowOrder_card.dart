import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_caffee_orders/screens/menu/bloc/menu_bloc.dart';

class NowOrderCard extends StatelessWidget {
  const NowOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuLoaded) {
          return ListView.builder(
            itemCount: state.orders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(state.orders[index]['name']),
                        Text(state.orders[index]['price'].toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<MenuBloc>()
                                .add(MenuAddCount(state.orders[index]['name']));
                          },
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(state.orders[index]['count'].toString()),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<MenuBloc>().add(
                                MenuDeleteCount(state.orders[index]['name']));
                          },
                          child: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
