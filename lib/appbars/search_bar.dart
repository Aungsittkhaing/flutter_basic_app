import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchBarExample extends StatefulWidget {
  const SearchBarExample({super.key});

  @override
  State<SearchBarExample> createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar Example'),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context,
                    //to customize the search bar
                    delegate: CustomSearchDelegate()
                );
              }, 
              icon: Icon(Icons.search_outlined)
          )
        ],
      ),
      body: const Center(
        child: Text('Please search your data!'),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate{
  //demo list to show query
  List<String> searchTerms = [
    "Apple",
    "Orange",
    "Banana",
    "Mango",
    "PineApple",
    "Grape",
    "WaterMelon",
    "BlueBerries",
    "StrawBerries",
    "Pear"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){
        query = '';
      },
          icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      close(context, null);
    },
        icon: const Icon(Icons.search)
    );
  }

  //to show query result
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: ()=> Fluttertoast.showToast(msg: result),
          );
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: ()=> Fluttertoast.showToast(msg: result),
        );
      },
    );
  }
}