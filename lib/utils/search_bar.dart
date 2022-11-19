import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final controller = TextEditingController();
  //Lista de sugestões de pesquisa
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onSubmitted: (value) {
          setState(() {
            List<String> matchQuery = [];
            for (var terms in searchTerms) {
              if (terms.toLowerCase().contains(controller.text.toLowerCase())) {
                matchQuery.add(terms);
                Container(
                  height: 300,
                  width: 200,
                  //child: Text(matchQuery[]),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                );
              }
            }
          });
        },
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            fontSize: 15,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 25,
          ),
        ),
      ),
    );
  }
}
