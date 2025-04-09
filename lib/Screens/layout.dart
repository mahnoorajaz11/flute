import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.3,
            filterQuality: FilterQuality.low,
            image: AssetImage('assets/map.png'),
          )
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black,width: 5),
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 3
                    )
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 5,
                bottom: 80,
                child: Icon(Icons.maps_ugc,color: Colors.black,)),
            const Positioned(
              right: 5,
                bottom: 120,
                child: Icon(Icons.maps_home_work,color: Colors.black,))
          ],
        ),
      ),
    );
  }
}
