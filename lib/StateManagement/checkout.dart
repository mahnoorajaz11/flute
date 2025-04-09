


import 'package:fahad_project/StateManagement/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller =Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text("Your Products"),
         controller.items.isEmpty
      ?const Center(child: Text("No items is cart"))
          :Consumer<CartController>(
        builder: (context, cart, child) {
          return SizedBox(height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items.values.toList()[index];
                return ListTile(
                  title: Text(cartItem.title!),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Text('\$${cartItem.price! * cartItem.quantity!}'),
                );
              },
            ),
          );
        },
      ),
          Text("Total Price: ${controller.totalAmount}",style: Theme.of(context).textTheme.displaySmall),

         ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return const HomeScreen();
           }));
         }, child: const Text("Continue Shopping"))
        ],
      ),
    );
  }
}
