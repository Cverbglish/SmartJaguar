import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/select_user/widgets/accountCard_widget.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/select_user/widgets/addAccountCard_widget.dart';

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> accounts = [
      "Abraham Mozqueda",
      "Miguel Muñoz",
      "Tirzo Diaz",
      "Melany Villalobos",
      "Mario Galvan",
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5C258D), Color(0xFF4389A2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '¿Quien va a aprender hoy?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 190,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...accounts.map((account) {
                            return AccountCard(account: account);
                          }),
                          const AddAccountCard(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
