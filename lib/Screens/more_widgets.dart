


import 'package:flutter/material.dart';

class MoreWidgets extends StatefulWidget {
  const MoreWidgets({super.key});

  @override
  State<MoreWidgets> createState() => _MoreWidgetsState();
}

class _MoreWidgetsState extends State<MoreWidgets> {
  bool myValue = false;
  String selectedOption = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myValue?Container() :const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  // hintText: "Name",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Colors.red,
                  suffixIcon: Icon(Icons.visibility_off),
                  suffixIconColor: Colors.greenAccent,
                  filled: true,
                  fillColor: Colors.green
                ),
              ),
            ),
            Checkbox(
              value: myValue,
              onChanged: (value) {
                setState(() {
                  myValue = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Male'),
              leading: Radio<String>(
                value: "Male",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),ListTile(
              title: const Text('Female'),
              leading: Radio<String>(
                value: "Female",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            Text(selectedOption),
          ],
        ),
      ),
    );
  }
}
