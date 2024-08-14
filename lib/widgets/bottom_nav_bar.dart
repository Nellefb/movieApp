import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/pages/home/home_page.dart';
import 'package:movie_app/pages/search/search_page.dart';
import 'package:movie_app/pages/top_rated/top_rated_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //pageview já se atualiza, e da o efeito scroll
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          SearchPage(),
          TopRatedPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //em padrão vem seleciondo o 1, esse altera
        currentIndex: currentPage,
        iconSize: 30.0,
        selectedItemColor: Colors.red,
        onTap: (int index){
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
          setState(() {
          currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Top Rated'),
        ],
      ),
    );
  }
}
