import 'package:flutter/material.dart';

import 'package:meals/screens/categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(_screens[_selectedScreenIndex]['title']),
          ),
//          bottom: TabBar(
//            tabs: [
//              Tab(
//                icon: Icon(Icons.category),
//                text: 'Categorias',
//              ),
//              Tab(
//                icon: Icon(Icons.favorite),
//                text: 'Favoritos',
//              )
//            ],
//          ),
        ),
//        body: TabBarView(
//          children: [
//            CategoriesScreen(),
//            FavoriteScreen(),
//          ],
//        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex]['screen'],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedScreenIndex,
//          type: BottomNavigationBarType.shifting,
          onTap: _selectScreen,
          items: [
            BottomNavigationBarItem(
//              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categorias'),
            ),
            BottomNavigationBarItem(
//              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}
