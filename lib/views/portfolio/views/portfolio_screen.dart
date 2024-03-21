import 'package:flutter/material.dart';
import 'package:trader_simulator/consts/app_colors.dart';

import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';
import '../../app/widgets/cash_rect_widget.dart';
import '../../app/widgets/stock_widget.dart';
import '../../stock/views/event_details_screen.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  void _navigateToStockDetail(StockModel stock) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EventDetailScreen(
                stock: stock,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
        ),
        body: Container(
          color: AppColors.blackColor,
          child: Column(
            children: [
              Text('Investment portfolio'),
              CashRectWidget(),
              Text('Shares purchased'),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: portfolio.length,
                  itemBuilder: (context, index) {
                    StockModel stock = portfolio[index];
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
        ));
  }
}
