import 'package:flutter/material.dart';
import 'screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: todo
  // TODO: implement createStat
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help!',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      /*initialRoute: SplashScreen.routeName,
      routes: routes,*/
    );
  }
}
