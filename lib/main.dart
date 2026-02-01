import 'package:flutter/material.dart';
import 'package:natours_application/core/Routing/app_router.dart';
import 'package:natours_application/core/di/dependency_injection.dart';
import 'package:natours_application/natours_app.dart';

void main() {
  setupGetIt();
  runApp(NatoursApp(router: AppRouter()));
}
