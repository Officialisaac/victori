// import 'package:flutter/material.dart';
// import 'package:victoria/page/bloom.dart';
// import 'package:victoria/screen/msgpage.dart';
// import 'package:victoria/screen/profile.dart';
// import 'search.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectItemIndex = 0;

//   final screens = [
//     const HomePages(),
//     const SearchPage(),
//     const MessagePage(),
//     const MyProfile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       // ignore: prefer_const_constructors
//       body: screens[_selectItemIndex],
//       bottomNavigationBar: Container(
//         constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height / 14,
//             maxWidth: MediaQuery.of(context).size.width / 2,
//             minWidth: MediaQuery.of(context).size.width / 2),
//         alignment: Alignment.bottomCenter,
//         color: Colors.transparent,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             buildNbarItem(Icons.home, 0),
//             buildNbarItem(Icons.search, 1),
//             buildNbarItem(Icons.message, 2),
//             buildNbarItem(Icons.person, 3),
//           ],
//         ),
//       ),
//     );
//   }

//   GestureDetector buildNbarItem(IconData icon, int index) {
//     return GestureDetector(
//       child: IconButton(
//         onPressed: () {
//           setState(() {
//             _selectItemIndex = index;
//           });
//         },
//         icon: Icon(icon),
//         iconSize: 40,
//         color: index == _selectItemIndex ? Colors.black : Colors.grey,
//         disabledColor: Colors.grey,

//       ),
//       onDoubleTap: () {
//         setState(() {
//           _selectItemIndex = 0;
//         });
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bottom Navigation Bar',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .12 : 0,
                      width: index == currentIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: screenWidth * .076,
                    color: index == currentIndex
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}
