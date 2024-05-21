import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  Search_state createState() => Search_state();
}

class Search_state extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 230, 165),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onSubmitted: (_) {},
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Center(child: Text("Search")),
    );
  }
}
