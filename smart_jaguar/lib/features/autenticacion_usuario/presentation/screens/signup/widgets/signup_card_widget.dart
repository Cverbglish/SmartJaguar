import 'package:flutter/material.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

bool _isObscured = true; // Estado inicial para ocultar el texto

class _SignUpCardState extends State<SignUpCard> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        SizedBox(
          height: isMobile ? 418 : 500,
          child: Card(
            color: isMobile
                ? const Color.fromARGB(255, 38, 195, 235)
                : Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 15.0, bottom: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: isMobile
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
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

                    const SizedBox(height: 20),
                    // Nombre Field
                    TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          labelStyle: isMobile
                              ? const TextStyle(color: Colors.white)
                              : const TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: isMobile ? Colors.white : Colors.black,
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
                        )),
                    const SizedBox(height: 10),
                    // Email Field
                    TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Correo Electronico',
                          labelStyle: isMobile
                              ? const TextStyle(color: Colors.white)
                              : const TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email,
                            color: isMobile ? Colors.white : Colors.black,
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
                        )),
                    const SizedBox(height: 10),
                    // Password Field
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
                        )),
                    const SizedBox(height: 24),

                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        // Acción de login
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Registrar',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Forgot Password Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes Cuenta?',
                          style: TextStyle(
                            color: isMobile ? Colors.white : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Acción de inicio sesión
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              color: isMobile ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
