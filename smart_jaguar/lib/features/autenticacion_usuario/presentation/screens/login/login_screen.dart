import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/login/widgets/desktop_login_form_widget.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/login/widgets/login_card_widget.dart';
// import 'package:smart_jaguar/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            padding: const EdgeInsets.all(16.0),
            child: isMobile ? const LoginForm() : const DesktopLoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo
        Image.asset(
          'assets/LogoSmartJaguar_Fnd.png',
          width: 300,
          height: 130,
        ),
        const SizedBox(height: 20),

        // Login Form
        const LoginCard(),
      ],
    );
  }
}
