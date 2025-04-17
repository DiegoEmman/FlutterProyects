import 'package:flutter/material.dart';
import 'package:contador_clicks/visuales/screens/counter_function_screen.dart';

// import 'package:flutter_application_1/visuales/screens/counter_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
      ),
      home: const CounterFunctionsScreen()
    );
  }
  
}

