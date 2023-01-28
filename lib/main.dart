import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nexus_alpha/screens/login_screen.dart';
import 'screens/screens.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nexus MSRIT',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
      },
    );
  }
}
