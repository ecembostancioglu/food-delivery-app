import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/home_view/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Column(
          children: [
            
          ],
        );
      },
    ));
  }
}
