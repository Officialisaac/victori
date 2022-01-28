import 'package:flutter/material.dart';
import 'package:victoria/page/bloom.dart';
import 'package:victoria/widget/background_img.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedItemIndex = 0;

  final _introScreen = [
    const VictoriaPage(),
    const DiscoverPage(),
    const ExplorePage(),
    const SharePage()
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PageController controller = PageController(initialPage: 0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: _introScreen,
        controller: controller,
        pageSnapping: true,
        allowImplicitScrolling: true,
        onPageChanged: (page) {
          // ignore: avoid_print
          print(page);
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 14,
              maxWidth: MediaQuery.of(context).size.width / 2,
              minWidth: MediaQuery.of(context).size.width / 4),
          alignment: Alignment.bottomLeft,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNavbarItem(Icons.circle_rounded, 0),
              buildNavbarItem(Icons.circle_rounded, 1),
              buildNavbarItem(Icons.circle_rounded, 2),
            ],
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.orangeAccent,
            textStyle: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          child: const Text(
            'skip',
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePages()),
            );
          },
        )
      ]),
    );
  }

  GestureDetector buildNavbarItem(IconData icon, int index) {
    return GestureDetector(
      child: IconButton(
        onPressed: () {
          setState(() {
            _selectedItemIndex = index;
          });
        },
        icon: Icon(icon),
        iconSize: 25,
        color: index == _selectedItemIndex ? Colors.orange[900] : Colors.white,
        disabledColor: Colors.white,
      ),
      onDoubleTap: () {
        setState(() {
          _selectedItemIndex = 0;
        });
      },
    );
  }
}
