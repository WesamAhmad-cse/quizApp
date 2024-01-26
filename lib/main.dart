import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Quiz App',
        home: const MyHomePage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors
                .deepPurple, //ال color هون بتغير في كل الثيم الي حنعملهم مفش داعي نضل نغير في كل صفحة
            foregroundColor: Colors
                .white, //هون الايقونات والعنوان الي ع ال AppBar بكون لونهم ابيض
          ),
        ));
  }
}
