import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trader_simulator/views/portfolio/views/portfolio_screen.dart';
import 'package:trader_simulator/views/settings/views/settings_screen.dart';
import 'package:trader_simulator/views/stock/views/stock_screen.dart';

import '../../../consts/app_colors.dart';
import '../../../data/models/news_model.dart';
import '../../news/views/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    StockScreen(),
    NewsScreen(
      newsModel: news,
    ),
    PortfolioScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/stock.svg',
              width: size.height * 0.045,
              height: size.height * 0.045,
              color: currentIndex == 0 ? AppColors.purpleColor : Colors.white,
            ),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/portfolio.svg',
              width: size.height * 0.045,
              height: size.height * 0.045,
              color: currentIndex == 1 ? AppColors.purpleColor : Colors.white,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/news.svg',
                width: size.height * 0.045,
                height: size.height * 0.045,
                color: currentIndex == 2 ? AppColors.purpleColor : Colors.white,
              ),
              label: 'Currency'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: size.height * 0.045,
                height: size.height * 0.045,
                color: currentIndex == 2 ? AppColors.purpleColor : Colors.white,
              ),
              label: 'Currency'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blackColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: AppColors.purpleColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
