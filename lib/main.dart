import 'package:dst_helper/farm_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DST Helper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade800),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Menu {
  farm,
  etc;

  @override
  String toString() {
    switch (this) {
      case Menu.farm:
        return 'Farm';
      case Menu.etc:
        return 'Etc.';
    }
  }
}

class _HomePageState extends State<HomePage> {
  final List<(Menu, bool)> selectedMenuState = Menu.values.map((menu) {
    if (menu.index == 0) return (menu, true);
    return (menu, false);
  }).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget body;
    switch (selectedMenuState.firstWhere((element) => element.$2 == true).$1) {
      case Menu.farm:
        body = const FarmPage();
      case Menu.etc:
        body = Container();
    }

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset(
            'bg_loading_loading_charlie2.png',
            height: 100,
          ),
        ),
        actions: [
          ToggleButtons(
            renderBorder: false,
            color: Colors.white70,
            selectedColor: Colors.yellow.shade800,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            isSelected: selectedMenuState.map((element) => element.$2).toList(),
            onPressed: (index) {
              setState(() {
                for (var i = 0; i < Menu.values.length; i++) {
                  selectedMenuState[i] = (selectedMenuState[i].$1, i == index);
                }
              });
            },
            children:
                Menu.values.map((element) => Text(element.toString())).toList(),
          ),
          const SizedBox(width: 200),
        ],
      ),
      body: body,
    );
  }
}
