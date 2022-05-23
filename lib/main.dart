// import 'package:flutter/material.dart';
// import 'package:victoria/screen/home.dart';
// // import 'package:victoria/screen/welcome.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Victoria',
//       theme: ThemeData(
//           primarySwatch: Colors.orange,
//           primaryColor: Colors.deepOrangeAccent,
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       home: const MyHomePage(title: 'Home',),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:victoria/page/bloom.dart';
import 'package:victoria/screen/msgpage.dart';
import 'package:victoria/screen/profile.dart';
import 'package:victoria/screen/search.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Bottom Navigation Bar',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var currentIndex = 0;
  final screens = [
    const HomePages(),
    const SearchPage(),
    const MessagePage(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 0.50),
        height: screenWidth * .150,
        width: screenWidth - 45,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
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
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .12 : 0,
                      width: index == currentIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.orangeAccent.withOpacity(.2)
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
                    color:
                        index == currentIndex ? Colors.orange : Colors.black26,
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
    Icons.search_rounded,
    Icons.message_rounded,
    Icons.person_rounded,
  ];
}
