import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_caffee_orders/screens/bottom_tab/bloc/bottom_tab_bloc.dart';

class BottomPage extends StatelessWidget {
  const BottomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomTabBloc, BottomTabState>(
      builder: (context, state) {
        if (state is BottomTabLoaded) {
          return Scaffold(
              body: Center(child: state.pages[state.index]),
              bottomNavigationBar: CustomNavigationBar(
                  currentIndex: state.index,
                  onTap: (index) {
                    BlocProvider.of<BottomTabBloc>(context)
                      ..add(BottomTabChange(index));
                  },
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.grey[400],
                  backgroundColor: Colors.blue,
                  items: [
                    CustomNavigationBarItem(icon: Icon(Icons.menu_book_sharp)),
                    CustomNavigationBarItem(
                        icon: Icon(Icons.money_off_csred_rounded)),
                  ]));
        }
        return Container();
      },
    );
  }
}
