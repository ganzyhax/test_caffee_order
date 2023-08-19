// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_caffee_orders/screens/menu/bloc/menu_bloc.dart';

class ProductCard extends StatelessWidget {
  final data;
  const ProductCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 2.5),
      itemCount: data.length,
      itemBuilder: ((context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ignore: avoid_unnecessary_containers
              SizedBox(
                height: 130,
                child: Image.network(
                  data[index]['image'],
                ),
              ),
              Text(data[index]['name']),
              Text(data[index]['price'].toString()),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.read<MenuBloc>().add(MenuAddOrder(
                      data[index]['name'], data[index]['price'], 1));
                },
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      'Добавить',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
        );
      }),
    );
  }
}
