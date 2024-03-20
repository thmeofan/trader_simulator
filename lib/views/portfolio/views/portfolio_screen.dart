import 'package:flutter/material.dart';

import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: ListView.builder(
        itemCount: portfolio.length,
        itemBuilder: (context, index) {
          StockModel stock = portfolio[index];
          return ListTile(
            title: Text(stock.name),
            subtitle: Text('Price: \$${stock.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
