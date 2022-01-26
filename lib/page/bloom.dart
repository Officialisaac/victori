import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late VideoPlayerController _controller;
  final asset = 'asset/source/testing.mp4';
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    //     "https://www.youtube.com/watch?v=1SNQcMPYVHg");
    _controller = VideoPlayerController.asset(asset);
    _initializeVideoPlayerFuture =
        _controller.initialize().then((value) => _controller.play());
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PageController controller = PageController(initialPage: 0);

    List<Widget> reel = [
      FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Center(child: VideoPlayer(_controller)));
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              );
            }
          }),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Center(child: VideoPlayer(_controller))),
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
      body: PageView(
        scrollDirection: Axis.vertical,
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
