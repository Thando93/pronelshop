import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ProNelShopApp());
}

class ProNelShopApp extends StatelessWidget {
  const ProNelShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProNelShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE65100)), // orange
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3
