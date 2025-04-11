import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/routes/app_router.dart';
import 'core/enums/local_manager_keys.dart';
import 'services/local_manager.dart';
import 'view/base_view/base_view.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();  
await LocalManager.preferencesInit();
runApp(BaseView());
}

