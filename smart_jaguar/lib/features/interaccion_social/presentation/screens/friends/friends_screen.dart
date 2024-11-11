import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  Friend? selectedFriend;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: !isMobile
          ? PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 38, 195, 235),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: const Text(
                      'Amigos',
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
                            onPressed: () {},
                          ),
                          const Text(" X",
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.star, color: Colors.green),
                            onPressed: () {},
                          ),
                          const Text(" X%",
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                    centerTitle: true,
                  ),
                ),
              ),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: FriendsList(
                  onFriendSelected: (friend) {
                    if (isMobile) {
                      // Navegar a una nueva pantalla en dispositivos móviles
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(friend: friend),
                        ),
                      );
                    } else {
                      // Mostrar el chat en la misma pantalla en dispositivos de escritorio
                      setState(() {
                        selectedFriend = friend;
                      });
                    }
                  },
                ),
              ),
              // Área de chat solo visible en dispositivos grandes
              if (!isMobile)
                Expanded(
                  flex: 3,
                  child: selectedFriend != null
                      ? ChatScreen(friend: selectedFriend!)
                      : const Center(
                          child: Text('Selecciona un amigo para chatear'),
                        ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class FriendsList extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'Amigo 1', status: 'En Línea'),
    Friend(name: 'Amigo 2', status: 'En Línea'),
    Friend(name: 'Amigo 3', status: 'Desconectado'),
    Friend(name: 'Amigo 4', status: 'En Línea'),
    Friend(name: 'Amigo 5', status: 'En Línea'),
  ];

  final ValueChanged<Friend> onFriendSelected;

  FriendsList({super.key, required this.onFriendSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[50],
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(friend.name, overflow: TextOverflow.ellipsis),
            subtitle: Text(friend.status, overflow: TextOverflow.ellipsis),
            onTap: () => onFriendSelected(friend),
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final Friend friend;

  const ChatScreen({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.cyan[100],
        child: Column(
          children: [
            ChatHeader(friend: friend),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: const [
                  ChatBubble(text: 'Mensaje recibido', isReceived: true),
                  ChatBubble(text: 'Mensaje enviado', isReceived: false),
                  ChatBubble(text: 'Otro mensaje recibido', isReceived: true),
                ],
              ),
            ),
            const MessageInputField(),
          ],
        ),
      ),
    );
  }
}

class ChatHeader extends StatelessWidget {
  final Friend friend;

  const ChatHeader({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.cyan[300],
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 20,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              friend.name,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.message, color: Colors.white),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isReceived;

  const ChatBubble({super.key, required this.text, this.isReceived = true});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isReceived ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isReceived ? Colors.cyan : Colors.cyan[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MessageInputField extends StatelessWidget {
  const MessageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.cyan[50],
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribir...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Friend {
  final String name;
  final String status;

  Friend({required this.name, required this.status});
}
