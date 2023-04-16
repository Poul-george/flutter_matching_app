import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';

Widget userInfoDrawer(BuildContext context) {
  //仮
  const List<String> items = [
    'User Settings',
    'App Settings',
    'Message Settings'
  ];

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: mainColor,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(children: const [
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                'Various Settings',
                style: TextStyle(
                  color: white,
                  fontSize: 24,
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              // print("items: $index $items");
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index],
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Icon(Icons.arrow_forward,
                        size: 26, color: Color.fromRGBO(150, 150, 150, 1)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
