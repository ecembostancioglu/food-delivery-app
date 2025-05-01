import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/app_color_extensions.dart';

class MenuListViewWidget extends StatelessWidget {
  final String image;
  final String title;
  const MenuListViewWidget(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorsExtensions>()!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r))),
            child: Image.network(image),
          ),
          Text(
            title,
            style: TextStyle(
                color: appColors.textColor, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
