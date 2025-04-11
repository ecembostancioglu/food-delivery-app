import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'services/local_manager.dart';
import 'view/base_view/base_view.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();  
await LocalManager.preferencesInit();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

runApp(ChangeNotifierProvider(
  create: (_) => AppTheme(),
  child: BaseView()));
}

