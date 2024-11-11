import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/autenticacion_usuario/presentation/screens/select_user/select_user_screen.dart';

/// Equipo de Trabajo:
/// Tirzo Antonio Diaz Infante Gomez
/// Miguel Angel Muñoz Carmona
/// Karol Abraham Robledo Mozqueda
/// Melany Alexa Villalobos Moya

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Jaguar',
      home: SelectUserScreen(),
    );
  }
}
