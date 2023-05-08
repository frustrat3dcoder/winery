import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:winery/ui/home_view.dart';

import 'widgets/home_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _page = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white.withOpacity(0.8),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: <Widget>[
          HomeWidget(),
          HomeWidget(),
          HomeWidget(),
          HomeWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: cameraWidget(),
      bottomNavigationBar: bottomNavWidget(),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _page = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  ClipRRect bottomNavWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      child: BottomAppBar(
          clipBehavior: Clip.none,
          elevation: 5,
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      bottomTapped(0);
                    }),
                IconButton(
                    icon: const Icon(Icons.favorite_outline),
                    onPressed: () {
                      bottomTapped(1);
                    }),
                const SizedBox(width: 40), // The dummy child
                IconButton(
                    icon: const Icon(Icons.history),
                    onPressed: () {
                      bottomTapped(2);
                    }),
                IconButton(
                    icon: const Icon(Icons.person_2_outlined),
                    onPressed: () {
                      bottomTapped(3);
                    }),
              ],
            ),
          )),
    );
  }

  FloatingActionButton cameraWidget() => FloatingActionButton(
        onPressed: () => openCamera(),
        backgroundColor: Colors.black,
        child: Image.asset(
          'assets/scan.png',
          width: 30,
          height: 20,
        ),
      );

  void openCamera() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeView()));
  }
}
