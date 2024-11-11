import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({
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
                      'Cursos',
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
  // Lista de cursos con nombres, progreso y ruta de la imagen
  final List<Map<String, dynamic>> courses = [
    {
      "name": "Curso de Verbos",
      "progress": 0.75,
      "image": 'assets/FondoEducativo.jpg',
    },
    {
      "name": "Curso de Adverbios",
      "progress": 0.5,
      "image": 'assets/jag_m.png',
    },
    {
      "name": "Curso de Vocabulario",
      "progress": 0.9,
      "image": 'assets/FondoEducativo.jpg',
    },
    // Puedes añadir más cursos aquí con sus respectivas imágenes
  ];

  ScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.help_outline, color: Colors.teal),
        title: const Text('Favoritos', style: TextStyle(color: Colors.teal)),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.teal),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CourseCard(
                courseName: course["name"],
                progress: course["progress"],
                imagePath: course["image"],
                isMobile: isMobile,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final double progress;
  final String imagePath;
  final bool isMobile;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.progress,
    required this.imagePath,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath, // Utiliza la imagen proporcionada en el curso
              height: isMobile ? 100 : 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        courseName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${(progress * 100).toInt()}%', // Muestra el progreso en porcentaje
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {
                        // Acción del botón de favoritos
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
