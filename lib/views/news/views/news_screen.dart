import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/news_model.dart';
import '../../../util/app_routes.dart';
import '../widgets/news_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.newsModel});

  final List<NewsModel> newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.profile);
              },
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                color: Colors.white,
              ),
            )
          ],
          title: const Text(
            'News',
            style: SynopsisTextStyle.appbar,
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          color: AppColors.blackColor,
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: newsModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsWidget(newsModel: newsModel[index]);
                },
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
          ]),
        ));
  }
}
