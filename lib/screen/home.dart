import 'package:flutter/material.dart';
import 'package:victoria/page/bloom.dart';
import 'package:victoria/screen/homevideoinfo.dart';
import 'search.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Victoria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'a million+ sites'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: HomePages(),
      // Center(
      //   child: SingleChildScrollView(
      //     reverse: true,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text(
      //           'Display Vidoes of Tourist site',
      //           style: Theme.of(context).textTheme.headline6,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: bottomBarItem(context),
    );
  }

  Container bottomBarItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 5.0,
          color: Colors.transparent,
        ),
      ),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 14,
          maxWidth: MediaQuery.of(context).size.width / 2,
          minWidth: MediaQuery.of(context).size.width / 2),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
            iconSize: 40,
            highlightColor: Colors.orange,
            focusColor: Colors.orange,
            disabledColor: Colors.grey,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(Icons.search),
            iconSize: 40,
            highlightColor: Colors.orange,
            focusColor: Colors.orange,
            disabledColor: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            iconSize: 40,
            highlightColor: Colors.orange,
            focusColor: Colors.orange,
            disabledColor: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            iconSize: 40,
            highlightColor: Colors.orange,
            focusColor: Colors.orange,
            disabledColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
