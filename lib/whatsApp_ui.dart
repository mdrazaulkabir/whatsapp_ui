import 'package:flutter/material.dart';
import 'package:whatsapp_ui/splash_screen.dart';

class WhatsAppUi extends StatelessWidget {
  const WhatsAppUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
