import 'package:flutter/material.dart';
import 'package:zakazpro/screens/create_order/create_order_screen.dart';
import 'package:zakazpro/screens/home/home_screen.dart';
import 'package:zakazpro/screens/my_orders/my_orders_screen.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
    
  var currentIndex = 0;  
  var screens = [
    HomeScreen(),
    MyOrdersScreen(),
    CreatOrderScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "главная",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "мои заказы",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Создать заказ",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "chat",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "person",
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
