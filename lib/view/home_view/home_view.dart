import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/view/home_view/home_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../core/extensions/app_color_extensions.dart';
import '_components/card_widget.dart';
import '_components/menu_listview_widget.dart';

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
                      itemCount: viewModel.categories.length,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = viewModel.categories[index].name;
                        final images = viewModel.categories[index].imageUrl;
                        return MenuListViewWidget(
                            image: images, title: category);
                      }),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 1.sh,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.restaurants.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final restaurant = viewModel.restaurants[index];
                        return CardWidget(restaurant: restaurant, appColors: appColors);
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

