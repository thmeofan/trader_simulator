import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/consts/app_colors.dart';

import '../../../data/models/stock_model.dart';

class StockWidget extends StatelessWidget {
  final StockModel stock;

  StockWidget(this.stock);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.15,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  stock.icon,
                  width: 24,
                ),
                SizedBox(width: 8.0),
                Text(stock.name),
              ],
            ),
            Spacer(),
            Text('Stocks'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${stock.price.toStringAsFixed(2)}'),
                Text('${stock.interest}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
