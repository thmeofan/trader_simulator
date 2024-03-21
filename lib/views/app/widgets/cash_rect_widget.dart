import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/data/repository/game_logic_repo.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';

class CashRectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.075,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('You have'),
            Spacer(),
            SvgPicture.asset('assets/icons/portfolio.svg'),
            Text(portfolio.length.toString()),
            Text(
              cash.toString(),
              style: FinanceTextStyle.output,
            ),
          ],
        ),
      ),
    );
  }
}
