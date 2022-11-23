import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final controller = TextEditingController();
  List<String> matchQuery = [];
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

  void findMatch() {
    setState(() {
      /*for (var terms in searchTerms) {
        if (terms.toLowerCase().contains(controller.text.toLowerCase())) {
          matchQuery.add(terms);
        }
      }*/
      matchQuery = searchTerms
          .where((element) =>
              element.toLowerCase().contains(controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(25, 80, 25, 0),
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          child: TextField(
            onChanged: (value) => findMatch(),
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
        ),
        Expanded(
          child: searchTerms.isEmpty
              ? Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: matchQuery.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                      title: Text(
                        matchQuery[index],
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
