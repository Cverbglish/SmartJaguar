import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: !isMobile
          ? PreferredSize(
              preferredSize: const Size.fromHeight(
                  100), // Altura personalizada para el AppBar
              child: Container(
                margin: const EdgeInsets.all(
                    16), // Margen exterior alrededor del AppBar
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 38, 195, 235), // Color de fondo del AppBar
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 4), // Sombra debajo del AppBar
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Padding dentro del AppBar
                  child: AppBar(
                    backgroundColor: Colors
                        .transparent, // Fondo transparente para usar el color del Container
                    elevation: 0, // Sin sombra extra
                    title: const Text(
                      'Hola, Nombre Usuario',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.monetization_on,
                                color: Colors.orange),
                            onPressed: () {
                              // Acción para el primer botón
                            },
                          ),
                          const Text(" X",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.star, color: Colors.green),
                            onPressed: () {
                              // Acción para el segundo botón
                            },
                          ),
                          const Text(" X%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                    centerTitle: true, // Centra el título
                  ),
                ),
              ),
            )
          : null,
      body: const RoundedAppBarScreen(),
    );
  }
}

class RoundedAppBarScreen extends StatelessWidget {
  const RoundedAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const screenprueba();
  }
}

// ignore: camel_case_types
class screenprueba extends StatelessWidget {
  const screenprueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            // Contenido principal
            Expanded(
              child: Column(
                children: [
                  // Logo y búsqueda
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/LogoSmartJaguar_Fnd.png',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            const Text("SMART JAGUAR",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Text("Be funny. Be intelligent. Be a jaguar."),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Buscar...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            fillColor: Colors.blue[100],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Cursos
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) => Card(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Nombre Curso"),
                              Icon(Icons.favorite_border),
                            ],
                          ),
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuOption(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }

  Widget _onlineFriend(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.person, color: Colors.black),
          const SizedBox(width: 5),
          Text(name),
        ],
      ),
    );
  }
}
