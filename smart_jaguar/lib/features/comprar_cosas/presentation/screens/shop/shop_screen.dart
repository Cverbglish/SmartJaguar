import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({
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
                      'Tienda',
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
      body: const ScreenContent(),
    );
  }
}

class ScreenContent extends StatelessWidget {
  const ScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Barra superior
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),

            // Sección promocional
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "NUEVO",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Descuento de 50% en esta compra",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Acción del botón "Comprar ahora"
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Comprar ahora"),
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

            // Lista de categorías
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryButton(label: "Todo"),
                      CategoryButton(label: "Nuevo"),
                      CategoryButton(label: "Popular"),
                      CategoryButton(label: "Oferta"),
                      CategoryButton(label: "JagCoins"),
                    ],
                  ),
                ),
              ),
            ),

            // Espacio para los elementos de la tienda (GridView responsivo)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount =
                      2; // Predeterminado para pantallas pequeñas

                  if (constraints.maxWidth > 1200) {
                    crossAxisCount = 5; // Más columnas en pantallas grandes
                  } else if (constraints.maxWidth > 800) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth > 600) {
                    crossAxisCount = 3;
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: 10, // Cambia esto según el número de elementos
                    itemBuilder: (context, index) {
                      return Container(
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 40,
                              color: Colors.teal,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Producto",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "\$Precio",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  const CategoryButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          // Acción al presionar el botón de categoría
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.teal[800],
          backgroundColor: Colors.teal[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
