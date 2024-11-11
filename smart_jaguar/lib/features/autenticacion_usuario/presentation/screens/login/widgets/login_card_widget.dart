import 'package:flutter/material.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/home/home_screen.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

bool _isObscured = true; // Estado inicial para ocultar el texto

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        SizedBox(
          height: isMobile ? 400 : 500,
          child: Stack(
            clipBehavior:
                Clip.none, // Permite que los widgets se salgan de los límites
            children: [
              Card(
                color: isMobile
                    ? const Color.fromARGB(255, 38, 195, 235)
                    : Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    top: 70.0, // Espacio superior ajustado
                    bottom: 15.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: isMobile
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: isMobile ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.pets,
                            size: 30,
                            color: isMobile ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: isMobile ? 1 : 20,
                      ),
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nombre de Usuario',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: isMobile
                              ? const TextStyle(color: Colors.white)
                              : const TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: isMobile ? Colors.white : Colors.black,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              color: isMobile ? Colors.white : Colors.black,
                              _isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured =
                                    !_isObscured; // Alterna entre ocultar y mostrar
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: isMobile
                                ? const BorderSide(color: Colors.white)
                                : const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: isMobile
                                ? const BorderSide(color: Colors.white)
                                : const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Acción de login
                          Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      HomeScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Configura la animación de desplazamiento y desvanecimiento
                                var beginOffset = const Offset(
                                    0.0, 1.0); // Desde abajo hacia arriba
                                var endOffset = Offset.zero;
                                var offsetTween =
                                    Tween(begin: beginOffset, end: endOffset);
                                var slideAnimation =
                                    animation.drive(offsetTween);

                                var fadeTween = Tween(
                                    begin: 0.0,
                                    end: 1.0); // Desvanecimiento de opacidad
                                var fadeAnimation = animation.drive(fadeTween);

                                return SlideTransition(
                                  position: slideAnimation,
                                  child: FadeTransition(
                                    opacity: fadeAnimation,
                                    child: child,
                                  ),
                                );
                              },
                            ),
                            (Route<dynamic> route) =>
                                false, // Elimina todas las pantallas anteriores
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (!isMobile)
                        TextButton(
                          onPressed: () {
                            // Acción de recuperar contraseña
                          },
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (isMobile)
                Positioned(
                  top: -30, // Ajusta este valor para sobresalir la imagen
                  left: (MediaQuery.of(context).size.width / 2) - 85,
                  child: Image.asset(
                    'assets/jag_m.png',
                    width: 130,
                    height: 130,
                  ),
                ),
            ],
          ),
        ),
        if (isMobile)
          TextButton(
            onPressed: () {
              // Acción de recuperar contraseña
            },
            child: const Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
