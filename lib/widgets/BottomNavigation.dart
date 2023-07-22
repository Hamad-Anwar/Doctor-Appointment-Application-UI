import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items:const  [
        BottomNavigationBarItem(
            label: "HH",
            icon: Icon(Icons.home_filled,color: Colors.blue,)),
        BottomNavigationBarItem(
            label: "HH",icon: Icon(Icons.calendar_month_rounded,color: Colors.black,)),
        BottomNavigationBarItem(
            label: "HH",icon: Icon(Icons.whatshot_outlined,color: Colors.black,)),
        BottomNavigationBarItem(
            label: "HH",icon: Icon(Icons.account_circle_outlined,color: Colors.black,)),
      ]),
    );
  }
  
}
