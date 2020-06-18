import 'package:flutter/material.dart';

class EscalaBottomNavigation extends StatefulWidget {
  final ValueChanged<int> refreshBottomNavigation;

  const EscalaBottomNavigation({Key key, this.refreshBottomNavigation})
      : super(key: key);

  @override
  _EscalaBottomNavigationState createState() =>
      _EscalaBottomNavigationState(this.refreshBottomNavigation);
}

class _EscalaBottomNavigationState extends State<EscalaBottomNavigation> {
  int _selectedIndex = 0;
  ValueChanged<int> refreshBottomNavigation;

  _EscalaBottomNavigationState(this.refreshBottomNavigation);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          title: Text('Escala'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text('Horários'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
        refreshBottomNavigation(index);
      });
}
