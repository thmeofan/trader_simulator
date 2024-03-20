import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/news_text_style.dart';
import '../../../data/models/news_model.dart';
import '../../../util/app_routes.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.article, arguments: newsModel);
        },
        child: Container(
          height: screenSize.height * 0.3,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: screenSize.width * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.darkGreyColor,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          newsModel.title,
                          maxLines: 2,
                          style: NewsTextStyle.title,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.005,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            newsModel.text,
                            style: NewsTextStyle.preview,
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.015,
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FancyShimmerImage(
                  width: screenSize.width * 0.89,
                  height: screenSize.height * 0.15,
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
