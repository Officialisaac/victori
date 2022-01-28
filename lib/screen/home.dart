import 'package:flutter/material.dart';
import 'package:victoria/page/bloom.dart';
import 'package:victoria/screen/homevideoinfo.dart';
import 'package:victoria/screen/msgpage.dart';
import 'package:victoria/screen/profile.dart';
import 'search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectItemIndex = 0;

  final screens = [
    const HomePages(),
    const SearchPage(),
    const MessagePage(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Container(
            color: Colors.transparent,
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: const Color(0x00000000),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoInfo()),
                  );
                },
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      // ignore: prefer_const_constructors
      body: screens[_selectItemIndex],
      bottomNavigationBar: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 14,
            maxWidth: MediaQuery.of(context).size.width / 2,
            minWidth: MediaQuery.of(context).size.width / 2),
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildNbarItem(Icons.home, 0),
            buildNbarItem(Icons.search, 1),
            buildNbarItem(Icons.message, 2),
            buildNbarItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  GestureDetector buildNbarItem(IconData icon, int index) {
    return GestureDetector(
      child: IconButton(
        onPressed: () {
          setState(() {
            _selectItemIndex = index;
          });
        },
        icon: Icon(icon),
        iconSize: 40,
        color: index == _selectItemIndex ? Colors.black : Colors.grey,
        disabledColor: Colors.grey,
      ),
      onDoubleTap: () {
        setState(() {
          _selectItemIndex = 0;
        });
      },
    );
  }
}
