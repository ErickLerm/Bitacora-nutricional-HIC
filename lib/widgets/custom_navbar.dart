import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/info_screen.dart';
import '../screens/comida_screen.dart';
import '../screens/reporte_screen.dart';
import '../screens/settings_screen.dart';
import 'top_bar.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _index = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(onTabChange: (index) {
        setState(() => _index = index);
      }),
      const InfoScreen(),
      const ComidaScreen(),
      const ReporteScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {

    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Topbar(),
      ),

      body: Row(
        children: [

          // 🔹 NAVBAR LATERAL (WEB / TABLET)
          if (isDesktop)
            NavigationRail(
              selectedIndex: _index,
              onDestinationSelected: (i) {
                setState(() => _index = i);
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Inicio'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info),
                  label: Text('Info'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.restaurant),
                  label: Text('Comida'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart),
                  label: Text('Reporte'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),

          // 🔹 CONTENIDO
          Expanded(
            child: _screens[_index],
          ),
        ],
      ),

      // 🔹 NAVBAR INFERIOR (MÓVIL)
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _index,
              onTap: (i) => setState(() => _index = i),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
                BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
                BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Comida'),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reporte'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
    );
  }
}