import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/stock_model.dart';

class StockWidget extends StatelessWidget {
  final StockModel stock;

  StockWidget(this.stock);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                stock.icon,
                width: 40,
                height: 40,
              ),
              SizedBox(width: 8.0),
              Text(stock.name),
            ],
          ),
          SizedBox(height: 8.0),
          Text('Stocks'),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price: \$${stock.price.toStringAsFixed(2)}'),
              Text('Interest: ${stock.interest}%'),
            ],
          ),
        ],
      ),
    );
  }
}
