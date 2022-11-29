import 'package:flutter/material.dart';
import 'package:searchbar/pages/emojis.dart';
import 'package:searchbar/utils/search_bar.dart';

class HomePage extends StatefulWidget {
  //final controller;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        clipBehavior: Clip.none,
        children: const [
          Align(
            heightFactor: 4.5,
            child: Emojis(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}
