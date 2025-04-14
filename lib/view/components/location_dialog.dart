import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/injections/locator.dart';
import 'package:food_delivery_app/services/firebase_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/enums/local_manager_keys.dart';
import '../../services/local_manager.dart';

class LocationPermissionDialog extends StatelessWidget {
  const LocationPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/location.png', height: 120),
          const SizedBox(height: 16),
          const Text(
            'NomNow will access your location only while using the app.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  locator<FirebaseService>().locationPermission();
                  Get.back();
                },
                child: const Text('Allow'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Don\'t allow'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
