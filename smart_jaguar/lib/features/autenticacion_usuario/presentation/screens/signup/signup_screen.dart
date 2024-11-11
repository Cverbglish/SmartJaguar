import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/signup/widgets/desktop_signup_form_widget.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/signup/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: isMobile
              ? Colors.white
              : const Color.fromARGB(255, 38, 195, 235)),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: isMobile
                ? const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0)
                : const EdgeInsets.all(16.0),
            child: isMobile ? const SignUpForm() : const DesktopSignUpForm(),
          ),
        ),
      ),
    );
  }
}
