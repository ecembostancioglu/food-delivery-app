import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/login_view/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Center(
            child: Text('Login'),
          );
        },
      ),
    );
  }
}
