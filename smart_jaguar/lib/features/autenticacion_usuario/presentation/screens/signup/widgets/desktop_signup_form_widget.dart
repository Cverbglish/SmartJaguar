import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/signup/widgets/signup_card_widget.dart';

class DesktopSignUpForm extends StatelessWidget {
  const DesktopSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color.fromARGB(255, 38, 195, 235)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logoSmart_white_fnd.png',
                  width: 300,
                  height: 200,
                ),
                const SizedBox(height: 5),
                Image.asset(
                  'assets/jag_m.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 5),
                const Text(
                  '¡Be funny, be intelligent, be a jaguar!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),

        // Login Form
        const Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignUpCard(),
            ],
          ),
        ),
      ],
    );
  }
}
