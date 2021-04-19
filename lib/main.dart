import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './screens/about_us_screen.dart';
import './screens/auth_screen.dart';
import './screens/contact_us_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(Studio20Two());
}

class Studio20Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Studio20Two',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color.fromARGB(255, 175, 4, 4),
            backgroundColor: Color.fromARGB(255, 37, 37, 37),
            primaryColorDark: Color.fromARGB(255, 255, 0, 0),
            primaryColorLight: Color.fromARGB(255, 65, 65, 65),
            textTheme: TextTheme(
                headline6: TextStyle(
                    fontFamily: 'MonumentExtended',
                    fontWeight: FontWeight.bold))),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
          AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
          ContactUsScreen.routeName: (ctx) => ContactUsScreen(),
        },
      ),
    );
  }
}
