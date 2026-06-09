import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/src/core/style/app_lotties.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class ProccesScreen extends StatelessWidget {
  const ProccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(145, 22, 138, 11),
              Color(0xFF81D4FA),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppLotties.motobike,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Курер в пути',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Matn rangini oq rangga o'zgartirish
                  ),
                ),
                const SizedBox(height: 12),
                const CircularProgressIndicator(
                  color: Colors.white, // Indicator rangi oq rangda
                  strokeWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
