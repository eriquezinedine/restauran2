import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/model/carro_model.dart';
import 'package:restaurapp2/model/search_model.dart';
import 'package:restaurapp2/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarroModel(),),
        ChangeNotifierProvider(
          create: (context) => SearchModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
