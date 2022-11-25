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

      //Comparação entre a lista e o que escrevo na caixa
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
        //Criação da caixa de pesquisa
        Container(
          margin: const EdgeInsets.fromLTRB(25, 80, 25, 0),
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            onChanged: (value) => findMatch(),
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Search...',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.clear,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),

        //Mostrar a pesquisa
        Expanded(
          child: controller.text.isEmpty
              ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                )
              : searchTerms.isEmpty
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
                          contentPadding:
                              const EdgeInsets.fromLTRB(35, 0, 15, 0),
                          onTap: () {
                            setState(() {
                              controller.text = matchQuery[index];
                              matchQuery = [];
                            });
                          },
                          title: Text(
                            matchQuery[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
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
