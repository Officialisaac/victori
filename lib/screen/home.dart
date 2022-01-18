import 'package:flutter/material.dart';
import 'package:victoria/screen/homevideoinfo.dart';

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
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Display Vidoes of Tourist site',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomAppBar(),
        floatingActionButton: Container(
          padding: const EdgeInsets.only(
            top: 50.0,
          ),
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0x00000000),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeVidInfo()),
                );
              },
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
