

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.tealAccent.shade200
          // image: DecorationImage(
          //   opacity: 0.3,
          //     fit: BoxFit.fill,
          //     image: AssetImage('assets/laptop.png')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.500,
              width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border:  Border.all(color: Colors.black,width: 2)
              ),
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty && value != null){
                            return "Name is Empty";
                          }
                           else{
                             return null;
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            nameController.text = value;
                          });
                        },
                        // controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: const TextStyle(
                            color: Colors.black,),
                          suffixIcon: const Icon(Icons.person,color: Colors.black,),
                          enabledBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextFormField(
                        obscureText: true
                        ,
                        // validator: (value){
                        //   if(value!.isEmpty&& value !=null ){
                        //     return "Password is Empty";
                        //   }
                        //   else{
                        //     return null;
                        //   }
                        // },
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            color: Colors.black,),
                          suffixIcon: const Icon(Icons.lock,color: Colors.black,),
                          enabledBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                      ),
                    ),
                    Text("Name: ${nameController.text}, Password: ${passwordController.text}"),
                    InkWell(
                      onTap: (){
                        if(key.currentState!.validate()){
                          print("Clicked");
                        }else{
                          return;
                        }
                      },
                      child: Container(
                        height: 50,
                        width:MediaQuery.of(context).size.width-40 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [Colors.grey.shade300,
                          Colors.grey.shade700
                          ])
                        ),
                        child: const Center(child: Text("Login",style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          letterSpacing: 3
                        ),)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
