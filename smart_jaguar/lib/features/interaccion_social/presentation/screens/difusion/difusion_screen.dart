import 'package:flutter/material.dart';

class DiffusionScreen extends StatelessWidget {
  const DiffusionScreen({
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
                      'Difusión',
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
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.star, color: Colors.green),
                            onPressed: () {
                              // Acción para el segundo botón
                            },
                          ),
                          const Text(" X%",
                              style: TextStyle(color: Colors.white)),
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
      body: ScreenContent(),
    );
  }
}

class ScreenContent extends StatelessWidget {
  // Lista de cursos nuevos con nombres y fechas
  final List<Map<String, String>> newCourses = [
    {"name": "Curso de Inglés Básico", "date": "10/11/2024"},
    {"name": "Curso de Gramática Avanzada", "date": "15/11/2024"},
    // Puedes agregar más cursos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Barra superior
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.teal,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¡Mantente Informado!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Banner promocional
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "¡Domina el Inglés de forma Divertida!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Nuevos cursos de Smart Jaguar",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/jag_m.png', // Asegúrate de tener esta imagen en tu carpeta assets
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),

            // Título para cursos nuevos
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Cursos Nuevos",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Lista de cursos nuevos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: newCourses.map((course) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.teal,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Fecha: ${course['date']}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el botón Ir
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Ir"),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
