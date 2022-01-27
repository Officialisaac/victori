import 'package:flutter/material.dart';
import 'package:victoria/widget/background_img.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PageController controller = PageController(initialPage: 0);

    List<Widget> reel = [
      const DiscoverPage(),
      const ExplorePage(),
      const SharePage()
    ];
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: reel,
        controller: controller,
        pageSnapping: true,
        allowImplicitScrolling: true,
        onPageChanged: (page) {
          // ignore: avoid_print
          print(page);
        },
      ),
    );
  }
}
