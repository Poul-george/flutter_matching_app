import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  static const MaterialAccentColor _accent = Colors.amberAccent;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Hot Line'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Center(
            child: ElevatedButton(
          child: const Text('Drawerを開く'),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print("pull up")},
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
