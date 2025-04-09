import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
        leadingWidth: 100,
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Text("Aptech",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        title: const Icon(CupertinoIcons.book_fill),
        centerTitle: true,
        actions: const [
          Icon(Icons.settings,size: 28,),
          SizedBox(width: 10),
          Icon(Icons.bookmark_border,size: 28,),
          SizedBox(width: 10),
          Icon(Icons.search,size: 28,),
        ],
        shadowColor: Colors.grey,
        elevation: 3,
        // bottom: PreferredSize(
        //   preferredSize: Size(double.infinity,50),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: TextField(
        //       decoration: InputDecoration(
        //         border: OutlineInputBorder(
        //
        //         )
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
