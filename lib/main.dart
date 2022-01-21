import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet_up_app/internal/app.dart';
import 'package:meet_up_app/services/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferencesService.init();
  runApp(const App());
}