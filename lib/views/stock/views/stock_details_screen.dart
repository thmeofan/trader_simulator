import 'package:flutter/material.dart';

import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';

class StockDetailScreen extends StatefulWidget {
  final StockModel stock;

  StockDetailScreen({required this.stock});

  @override
  _StockDetailScreenState createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  void _handleBuyStock() {
    setState(() {
      buyStock(widget.stock);
      // Update UI after buying stock
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stock.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Price: \$${widget.stock.price.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: _handleBuyStock,
              child: Text('Buy Stock'),
            ),
          ],
        ),
      ),
    );
  }
}
