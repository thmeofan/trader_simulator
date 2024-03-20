import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/consts/app_colors.dart';
import 'package:trader_simulator/views/app/widgets/stock_widget.dart';
import 'package:trader_simulator/views/stock/widgets/banner_widget.dart';

import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';
import 'stock_details_screen.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  void _handleEventGeneration() {
    setState(() {
      generateRandomEvent();
    });
  }

  void _navigateToStockDetail(StockModel stock) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StockDetailScreen(stock: stock)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stocks'),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            BannerWidget(
                imagePath: 'assets/images/star.svg',
                title: 'Events of the day',
                subtitle:
                    'Generate stock events to practice buying and selling stocks.',
                onButtonPressed: _handleEventGeneration),
            Expanded(
              child: ListView.builder(
                itemCount: stockModelList.length,
                itemBuilder: (context, index) {
                  StockModel stock = stockModelList[index];
                  return GestureDetector(
                    onTap: () {
                      _navigateToStockDetail(stock);
                    },
                    child: StockWidget(stock),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
