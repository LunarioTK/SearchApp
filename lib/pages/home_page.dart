import 'package:flutter/material.dart';
import 'package:searchbar/utils/search_bar.dart';

class HomePage extends StatefulWidget {
  //final controller;
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchBar(),
    );
  }
}
