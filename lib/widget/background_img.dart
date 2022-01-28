import 'package:flutter/material.dart';

class OnboardBgImg extends StatelessWidget {
  const OnboardBgImg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const WelcomePage()),
        // );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img/asset1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    // ShaderMask(
    //   shaderCallback: (bounds) => const LinearGradient(
    //           colors: [Colors.black54, Colors.black12],
    //           begin: Alignment.bottomCenter,
    //           end: Alignment.center)
    //       .createShader(bounds),
    //   blendMode: BlendMode.darken,
    //   child: Container(
    //     alignment: Alignment.center,
    //     decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('asset/img/asset1.png'),
    //         fit: BoxFit.cover,
    //         colorFilter: ColorFilter.mode(Colors.black45, BlendMode.overlay),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class VictoriaPage extends StatelessWidget {
  const VictoriaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/img/asset1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('asset/img/asset1.png'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Discover',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 35.0,
                fontWeight: FontWeight.bold),
          ),
          Text('Browse through videos of\nrich African tourist site')
        ],
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('asset/img/asset1.png'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Explore',
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold)),
          Text('Visit tourist sites for an\nexperience of a lifetime')
        ],
      ),
    );
  }
}

class SharePage extends StatelessWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('asset/img/asset1.png'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Share',
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold)),
          Text('Share experiences of your visit\nwith your friends and family')
        ],
      ),
    );
  }
}
