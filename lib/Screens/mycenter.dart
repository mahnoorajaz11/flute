


import 'package:flutter/material.dart';

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.amber,
          ),
          const Positioned(child:Icon(Icons.person)),
          const Positioned(
              top: 0,
              right: 0,
              child:Icon(Icons.person)),
          const Positioned(
              bottom: 0,
              child:Icon(Icons.person)),
          const Positioned(
              bottom: 0,
              right: 0,
              child:Icon(Icons.person)),
          Positioned(
              height: 500,
              width: 500,
              child: Icon(Icons.person)),
        ],
      )
    );
  }
}
