import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/signup/widgets/signup_card_widget.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo
        Image.asset(
          'assets/LogoSmartJaguar_Fnd.png',
          width: 300,
          height: 130,
        ),
        isMobile
            ? Transform.translate(
                offset: const Offset(0, 5),
                child: Image.asset(
                  'assets/jag_paws.png',
                  width: 100,
                ),
              )
            : Container(),
        // Login Form
        const SignUpCard(),
      ],
    );
  }
}
