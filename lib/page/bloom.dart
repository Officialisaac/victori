import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PageController controller = PageController(initialPage: 0);

    List<Widget> reel = [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      ),
    ];
    return Scaffold(
      // body: Builder(builder: (context) {
      //   return LiquidSwipe(
      //     pages: reel,
      //     fullTransitionValue: 200,
      //     waveType: WaveType.liquidReveal,
      //     // ignore: prefer_const_constructors
      //     slideIconWidget: Icon(Icons.compare_arrows),
      //     positionSlideIcon: 0.8,
      //     onPageChangeCallback: (page) {
      //       // ignore: avoid_print
      //       print(page);
      //     },
      //     liquidController: LiquidController(),
      //   );
      // }),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: reel,
        controller: controller,
        pageSnapping: true,
        onPageChanged: (page) {
          // ignore: avoid_print
          print(page);
        },
      ),
    );
  }
}
