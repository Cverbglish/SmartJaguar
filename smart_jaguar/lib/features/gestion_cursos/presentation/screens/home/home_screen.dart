import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:smart_jaguar/features/comprar_cosas/presentation/screens/shop/shop_screen.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/curses/curses_screen.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/home/start_screen.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/home/widgets/library_sidebar/src/controller/sidebarx_controller.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/home/widgets/library_sidebar/src/sidebarx_base.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/home/widgets/library_sidebar/src/theme/sidebarx_theme.dart';
import 'package:smart_jaguar/features/gestion_cursos/presentation/screens/home/widgets/library_sidebar/src/models/sidebarx_item.dart';
import 'package:smart_jaguar/features/interaccion_social/presentation/screens/difusion/difusion_screen.dart';
import 'package:smart_jaguar/features/interaccion_social/presentation/screens/friends/friends_screen.dart';
import 'package:smart_jaguar/features/interaccion_social/presentation/screens/friends/widgets/friends_list_widget.dart';
import 'package:smart_jaguar/utils/constants.dart';

// Notificador centralizado para controlar el índice seleccionado
final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  final ValueNotifier<String> titleNotifier =
      ValueNotifier<String>('Hola, Nombre Usuario');

  @override
  void dispose() {
    _controller.dispose();
    titleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      key: _key,
      appBar: isMobile
          ? AppBar(
              backgroundColor: canvasColor,
              title: ValueListenableBuilder<String>(
                valueListenable: titleNotifier,
                builder: (context, title, _) {
                  return Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
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
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.star, color: Colors.green),
                      onPressed: () {
                        // Acción para el segundo botón
                      },
                    ),
                    const Text(" X%",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            )
          : null,
      drawer: isMobile
          ? ExampleSidebarX(
              controller: selectedIndexNotifier,
              onItemSelected: (index) {
                // Actualiza el índice y el título al seleccionar un ítem del Sidebar
                selectedIndexNotifier.value = index;
                titleNotifier.value = _getTitleByIndex(index);
                if (isMobile) {
                  Navigator.pop(context); // Solo cierra el Drawer en móvil
                }
              },
            )
          : Container(),
      body: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, index, _) {
          return Row(
            children: [
              if (!isMobile)
                ExampleSidebarX(
                  controller: selectedIndexNotifier,
                  onItemSelected: (index) {
                    selectedIndexNotifier.value = index;
                    titleNotifier.value = _getTitleByIndex(index);
                  },
                ),
              Expanded(child: Center(child: screens(index))),
            ],
          );
        },
      ),
      bottomNavigationBar: isMobile
          ? BottomBarNavigationWidget(
              controller: selectedIndexNotifier,
              onItemSelected: (index) {
                // Actualiza el índice y el título al seleccionar un ítem del BottomNavigationBar
                selectedIndexNotifier.value = index;
                titleNotifier.value = _getTitleByIndex(index);
              },
            )
          : null,
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  final ValueNotifier<int> controller;
  final Function(int) onItemSelected;

  const ExampleSidebarX({
    super.key,
    required this.controller,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding:
          !isMobile ? const EdgeInsets.all(16.0) : const EdgeInsets.all(5.0),
      child: SidebarX(
        controller: SidebarXController(
          selectedIndex: controller.value,
          extended: !isMobile,
        ),
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius:
                BorderRadius.circular(10), // Redondeado para estado cerrado
          ),
          hoverColor: const Color.fromARGB(255, 10, 129, 165),
          textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          selectedTextStyle: const TextStyle(color: Colors.white),
          hoverTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: canvasColor),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: actionColor.withOpacity(0.37),
            ),
            gradient: const LinearGradient(
              colors: [accentCanvasColor, canvasColor],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 30,
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.7),
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
        ),
        extendedTheme: SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(
                20), // Redondeado solo cuando está extendido
          ),
        ),
        footerDivider: divider,
        headerBuilder: (context, extended) {
          return SizedBox(
            height: 100,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: ClipOval(
                      child:
                          Image.asset('assets/avatar.png', fit: BoxFit.cover)),
                )),
          );
        },
        // Modificamos footerBuilder para usar un tamaño fijo
        footerBuilder: (context, extended) {
          return !isMobile
              ? SizedBox(
                  height: isMobile
                      ? 250
                      : 300, // Ajustamos la altura dependiendo de si es móvil o no
                  child: FriendsListWidget(),
                )
              : Container();
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: 'Inicio',
            onTap: () => onItemSelected(0),
          ),
          SidebarXItem(
            icon: Icons.people_alt,
            label: 'Amigos',
            onTap: () => onItemSelected(1),
          ),
          SidebarXItem(
            icon: Icons.school_rounded,
            label: 'Cursos',
            onTap: () => onItemSelected(2),
          ),
          SidebarXItem(
            icon: Icons.info,
            label: 'Difusión',
            onTap: () => onItemSelected(3),
          ),
          SidebarXItem(
            icon: Icons.shopping_bag,
            label: 'Tienda',
            onTap: () => onItemSelected(4),
          ),
        ],
      ),
    );
  }
}

class BottomBarNavigationWidget extends StatefulWidget {
  final ValueNotifier<int> controller;
  final Function(int) onItemSelected;

  const BottomBarNavigationWidget({
    super.key,
    required this.controller,
    required this.onItemSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarNavigationWidgetState createState() =>
      _BottomBarNavigationWidgetState();
}

class _BottomBarNavigationWidgetState extends State<BottomBarNavigationWidget> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      final selectedIndex = widget.controller.value;
      _bottomNavKey.currentState?.setPage(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavKey,
      backgroundColor: Colors.transparent,
      color: const Color.fromARGB(255, 38, 195, 235),
      items: const [
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.people, color: Colors.white),
        Icon(Icons.school, color: Colors.white),
        Icon(Icons.info, color: Colors.white),
        Icon(Icons.shopping_bag, color: Colors.white),
      ],
      onTap: (index) {
        widget.controller.value = index;
        widget.onItemSelected(
            index); // Llama a onItemSelected para actualizar el índice
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Hola, Nombre Usuario';
    case 1:
      return 'Amigos';
    case 2:
      return 'Cursos';
    case 3:
      return 'Difusión';
    case 4:
      return 'Tienda';
    default:
      return 'Not found page';
  }
}

Widget screens(int index) {
  switch (index) {
    case 0:
      return const StartScreen();
    case 1:
      return const FriendsScreen();
    case 2:
      return const CoursesScreen();
    case 3:
      return const DiffusionScreen();
    case 4:
      return const ShopScreen();
    default:
      return const StartScreen();
  }
}
