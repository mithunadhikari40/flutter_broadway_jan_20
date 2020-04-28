import 'dart:math' as Math;
import 'package:animation/src/widgets/cat_image.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catAnimationController;

  Animation<double> flapAnimation;
  AnimationController flapAnimationController;

  @override
  void initState() {
    catAnimationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    flapAnimationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    catAnimation = Tween(begin: -33.0, end: -78.0).animate(
      CurvedAnimation(
        parent: catAnimationController,
        curve: Curves.easeIn,
      ),
    );

    flapAnimation = Tween(begin: Math.pi / 8, end: Math.pi / 6).animate(
      CurvedAnimation(parent: flapAnimationController, curve: Curves.linear),
    );
 flapAnimationController.forward();
    flapAnimationController.addStatusListener(flapAnimationListener);
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
          centerTitle: true,
        ),
        body: InkWell(
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                buildAnimation(),
                buildBox(context),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            ),
          ),
          onTap: _onTap,
        ),
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      child: CatImage(),
      builder: (BuildContext context, Widget child) {
        return Positioned(
          top: catAnimation.value,
          left: 0.0,
          right: 0.0,
          child: child,
        );
      },
    );
  }

  Widget buildBox(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // print("device size $size");
    return Container(
      color: Colors.brown[500],
      height: 200,
      width: 200,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 3,
      child: AnimatedBuilder(
        animation: flapAnimation,
        child: Container(
          width: 10,
          height: 110,
          color: Colors.brown[500],
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: flapAnimation.value,
            child: child,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 3,
      child: AnimatedBuilder(
        animation: flapAnimation,
        child: Container(
          width: 10,
          height: 110,
          color: Colors.brown[500],
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -flapAnimation.value,
            child: child,
          );
        },
      ),
    );
  }

  void _onTap() {
    var status = catAnimationController.status;
    if (status == AnimationStatus.dismissed ||
        status == AnimationStatus.reverse) {
      flapAnimationController.reset();
      catAnimationController.forward();
    } else if (status == AnimationStatus.completed ||
        status == AnimationStatus.forward) {
      flapAnimationController.forward();
      catAnimationController.reverse();
    }
  }

  void flapAnimationListener(AnimationStatus status) {
    status == AnimationStatus.completed
        ? flapAnimationController.reverse()
        : flapAnimationController.forward();
  }
}
