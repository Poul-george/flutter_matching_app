import 'package:flutter/material.dart';
import 'package:flutter_matching_app/services/googlelogin/auth_service.dart';
import 'package:flutter_matching_app/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginApp extends StatelessWidget {
  const MyLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.trainOneTextTheme(),
        primarySwatch: const MaterialColor(
          0xB98181FF,
          colorTheme,
        ),
      ),
      home: const MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: const SignInScreen(),
    );
  }
}
