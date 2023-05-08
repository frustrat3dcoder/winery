import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:winery/ui/home_view.dart';
import 'package:winery/ui/landing/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..animateTo(1.0).then((value) => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LandingScreen())));

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash.png'), fit: BoxFit.fitWidth)),
        child: Center(
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(_animation),
            child: Image.asset(
              'assets/mixmaster.png',
              width: size.width,
            ),
          ),
        ),
      ),
    );
  }
}
