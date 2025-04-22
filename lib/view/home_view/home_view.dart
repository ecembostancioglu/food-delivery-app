import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/view/home_view/home_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../core/extensions/app_color_extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorsExtensions>()!;
    return Scaffold(
        body: ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.location_pin,
                                color: appColors.textColor),
                            Text(
                              'Your Location',
                              style: TextStyle(color: appColors.textColor),
                            )
                          ],
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_sharp))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: viewModel.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search food...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: appColors.background,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: appColors.blurColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: appColors.blurColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: appColors.blurColor)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                      itemCount: viewModel.restaurantNames.length,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final restaurantNames = viewModel.restaurantNames[index];
                        final images= viewModel.restaurants[index].imageUrl;
                        return MenuListViewWidget(
                            image:images, title: restaurantNames);
                      }),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 1.sh,
                  child: GridView.builder(
                      itemCount: viewModel.restaurants.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final restaurant = viewModel.restaurants[index];
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
                                            color: Colors.amber, size: 16.sp),
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
                      }),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}

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
