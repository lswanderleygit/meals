import 'package:flutter/material.dart';

import 'screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settinigs_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        accentColor: Colors.amber,
        primaryColor: Colors.pinkAccent,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoryMealsScreen(),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/alguma-coisa') {
          return null;
        } else {
          return MaterialPageRoute(
            builder: (_) {
              return CategoriesScreen();
            },
          );
        }
      },
      onUnknownRoute: (settings) {
        // go to initial screen when unknown route
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
