import 'package:flutter/material.dart';
import 'screens/map_screen.dart';
import 'screens/simulation_screen.dart';
import 'screens/reports_screen.dart';

void main() {
  runApp(const TrafficSimApp());
}

class TrafficSimApp extends StatelessWidget {
  const TrafficSimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traffic Simulation',
      theme: ThemeData(useMaterial3: true),
      home: const MainTabs(),
    );
  }
}

class MainTabs extends StatefulWidget {
  const MainTabs({super.key});

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  int index = 0;

  final List<Widget> pages = const [
    MapScreen(),
    SimulationScreen(),
    ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.traffic), label: 'Simulation'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      ),
    );
  }
}
