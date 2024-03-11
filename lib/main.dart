import 'package:flutter/material.dart';
import 'package:flutter_deep_link/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await dotenv.load();
  runApp(const ProviderScope(child: MyApp()));
}
