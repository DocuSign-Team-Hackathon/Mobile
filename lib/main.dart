import 'package:docusign/provider.dart';
import 'package:docusign/screens/pre_application.dart';
import 'package:docusign/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => PowerFormProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  HomePage(),
    );
  }
}
