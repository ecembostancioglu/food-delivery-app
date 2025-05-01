
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/app_color_extensions.dart';
import '../../../domain/models/restaurant_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.restaurant,
    required this.appColors,
  });

  final Restaurant restaurant;
  final AppColorsExtensions appColors;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.r)),
            child: Image.network(
              restaurant.imageUrl,
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: appColors.textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star,
                        color: appColors.primary,
                        size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      restaurant.rating.toString(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: appColors.textColor
                            .withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}