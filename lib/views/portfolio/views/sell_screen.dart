import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';
import '../../app/widgets/cash_sq_widget.dart';
import '../../app/widgets/sell_button_widget.dart';
import '../../app/widgets/stock_widget.dart';

class SellScreen extends StatefulWidget {
  final StockModel stock;

  SellScreen({
    required this.stock,
  });

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  void _handleSellStock() {
    setState(() {
      sellStock(widget.stock);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        titleSpacing: -5,
        title: const Text(
          'back',
          style: SynopsisTextStyle.back,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
            width: size.width * 0.04,
            height: size.width * 0.04,
            // color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.stock.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CashSqWidget(), StockWidget(widget.stock)],
            ),
            SellButtonWidget(onTap: () {
              _handleSellStock;
            }),
          ],
        ),
      ),
    );
  }
}
