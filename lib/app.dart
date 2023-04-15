import 'package:flutter/material.dart';
import 'package:flutter_matching_app/services/googlelogin/logout.dart';
import 'package:flutter_matching_app/component/bottom/navigation_bar.dart';
import 'package:flutter_matching_app/theme/color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xB98181FF,
          colorTheme,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: const <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.pink,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.message),
      //         title: Text('Messages'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_circle),
      //         title: Text('Profile'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Settings'),
      //       ),
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   title: const Text('Hot Line'),
      // ),
      body: const MyStatefulWidget(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 65),
        child: FloatingActionButton(
          // ここにtestでログアウト処理を入れているが、本実装ではログアウト処理は実装しない
          onPressed: () => {
            print("ログアウトします"),
            completeLogout(context),
          },
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
