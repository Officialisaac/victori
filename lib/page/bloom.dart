import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late VideoPlayerController _controller;
  final asset = 'asset/source/testing.mp4';
  final asset1 = 'asset/source/testing1.mp4';
  final asset2 = 'asset/source/testing2.mp4';
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

    Future<void> _refresh(){
      _controller.initialize();
      return _controller.play();
    }

    List<Widget> reel = [
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.done) {
                  return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Center(
                          child: Stack(
                            children: [
                              VideoPlayer(_controller),
                              Padding(
                                padding: const EdgeInsets.only(left: 200.0,bottom: 80.0),
                                child: Row(
                                    children:[ Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        IconButton(
                                          padding: EdgeInsets.only(left: 145),
                                            alignment: Alignment.bottomRight,
                                              icon: Icon(Icons.favorite,
                                              color: Colors.white,
                                              ),
                                              iconSize: 45,
                                              onPressed: null),
                                        Text("Kumasi National Zoo",style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                        Text("Ghana",style: TextStyle(color: Colors.white),)
                                      ],
                                    ),]
                                ),
                              ),
                            ],
                          )));
                } else {
                  return Container(
                    alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 50),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: const Text('Try Again'),
                  );
                }
              }),),
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


    List<Widget> reels = [
      RefreshIndicator(
        onRefresh: _refresh,
        color: Colors.white,
        backgroundColor: Colors.black12,
        strokeWidth: 4,
        displacement: 100,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          controller: controller,
          slivers : [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      color: Colors.white,
                      child: FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: Center(
                                      child: Stack(
                                    children: [
                                      VideoPlayer(_controller),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 200.0,bottom: 80.0),
                                        child: Row(
                                          children:[ Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text("Kumasi National Zoo",style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                              Text("Ghana",style: TextStyle(color: Colors.white),)
                                            ],
                                          ),]
                                        ),
                                      ),
                                    ],
                                  )));
                            } else {
                              return Container(
                                alignment: AlignmentGeometry.lerp(Alignment.center, Alignment.center, 50),
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: const Text('Try Again'),
                              );
                            }
                          }),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height);
                },
              ),
            ),
          ],
        ),
      )
    ];

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: Colors.white,
        backgroundColor: Colors.black12,
        strokeWidth: 4,
        displacement: 100,
        child: PageView(
          scrollDirection: Axis.vertical,
          children: reel,
          controller: controller,
          pageSnapping: true,
          allowImplicitScrolling: false,
          clipBehavior: Clip.hardEdge,
          onPageChanged: (page) {
            _initializeVideoPlayerFuture =
                _controller.initialize().then((value) => _controller.pause());
          },
        ),
      ),
    );
  }
}
