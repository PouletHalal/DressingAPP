import 'package:dressingapp/globals/colors.dart';
import 'package:flutter/material.dart';
import 'pages/clothepage.dart';

void main() {
  runApp(const MyApp());
}

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int currentPageIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: false,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          const Clothepage(),
          Container(
            color: tempColor,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: Durations.extralong4,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        backgroundColor: navbarColors[currentPageIndex],
        indicatorColor: indicateColors[currentPageIndex],
        destinations: [
          NavigationDestination(
            icon: ImageIcon(
              const AssetImage("assets/images/icons/dressing.png"),
              color: indicateColors[currentPageIndex],
            ),
            selectedIcon: ImageIcon(
              const AssetImage("assets/images/icons/dressing.png"),
              color: navbarColors[currentPageIndex],
            ),
            label: "Dressing",
          ),
          NavigationDestination(
            icon: ImageIcon(
              const AssetImage("assets/images/icons/outfit.png"),
              color: indicateColors[currentPageIndex],
            ),
            selectedIcon: ImageIcon(
              const AssetImage("assets/images/icons/outfit.png"),
              color: navbarColors[currentPageIndex],
            ),
            label: "Outfits",
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Pages());
  }
}
