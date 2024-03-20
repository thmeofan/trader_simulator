import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/widgets/chosen_action_button_widget.dart';

class BannerWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onButtonPressed;

  const BannerWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                imagePath,
                height: 48.0,
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ChosenActionButton(
            onTap: onButtonPressed,
            text: 'Generate',
          ),
        ],
      ),
    );
  }
}
