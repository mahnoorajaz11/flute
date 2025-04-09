import 'package:flutter/material.dart';

class ImportantWidgets extends StatelessWidget {
  const ImportantWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedItem= "Monday";
    List<String> list=[
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Icon(Icons.account_balance),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Account"),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("Settings"),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text("About GFG"),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text("Go Premium"),
              ),
              const PopupMenuItem(
                value: 6,
                child: Text("Logout"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          OutlinedButton(onPressed: (){}, child: const Text("Outlined Button")),
            ElevatedButton(onPressed: (){}, child: const Text("Elevated Button")),
            IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
            TextButton(onPressed: (){}, child: const Text("Text Button")),
            DropdownButtonFormField(
                value: selectedItem,
                items: list.map((value){
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value));
            }).toList(), onChanged: (value){})
        ],),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),),
    );
  }
}
