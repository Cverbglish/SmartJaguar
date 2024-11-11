import 'package:flutter/material.dart';
import 'package:smart_jaguar/utils/constants.dart';

class FriendsListWidget extends StatelessWidget {
  // Lista de amigos con su nombre, estado (en línea o no), y una imagen de usuario ficticia.
  final List<Map<String, dynamic>> friends = [
    {'name': 'Abraham', 'isOnline': true, 'image': 'assets/jag_m.png'},
    {'name': 'Melany', 'isOnline': false, 'image': 'assets/jag_m.png'},
    {'name': 'Miguel', 'isOnline': true, 'image': 'assets/jag_m.png'},
    {'name': 'Tirzo', 'isOnline': false, 'image': 'assets/jag_m.png'},
    {'name': 'Mario', 'isOnline': true, 'image': 'assets/jag_m.png'},
    {'name': 'Marisela', 'isOnline': false, 'image': 'assets/jag_m.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return Card(
            color: secundaryColor,
            margin: const EdgeInsets.symmetric(vertical: 6), // Menor margen
            elevation: 2, // Menor elevación
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Borde más pequeño
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 6, horizontal: 10), // Menor padding
              leading: CircleAvatar(
                radius: 24, // Avatar más pequeño
                backgroundImage: AssetImage(friend['image']),
              ),
              title: Text(
                friend['name'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14), // Texto más pequeño
              ),
              subtitle: Text(
                friend['isOnline']
                    ? 'En línea'
                    : 'Desconectado', // Abreviación del estado
                style: TextStyle(
                  color: friend['isOnline'] ? Colors.green : Colors.red,
                  fontSize: 12, // Texto más pequeño
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(
                friend['isOnline'] ? Icons.check_circle : Icons.cancel,
                color: friend['isOnline'] ? Colors.green : Colors.red,
                size: 22, // Icono más pequeño
              ),
            ),
          );
        },
      ),
    );
  }
}
