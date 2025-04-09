import 'package:fahad_project/StateManagement/checkout.dart';
import 'package:fahad_project/StateManagement/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badge;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
        centerTitle: true,
        actions: [
          Consumer<CartController>(
            builder: (context, controller, child) {
              return badge.Badge(
                badgeContent: Text(controller.items.values.length.toString()),
                child: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.remove_shopping_cart_outlined),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Consumer<CartController>(
              builder: (context, cart, child) {
                return cart.items.isEmpty
                  ? const Center(child: Text("No items in cart"))
                  : ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart.items.values.toList()[index];
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${cartItem.title!}"),
                          Text("Price: \$${cartItem.price}")
                        ],
                      ),
                      subtitle: Text('Quantity: ${cartItem.quantity}'),
                      trailing: IconButton(
                        onPressed: () {
                          cart.removeItems(cartItem.id.toString());
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              cart.decreaseQuantity(cartItem.id!);
                            },
                          ),
                          Text(cartItem.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cart.increaseQuantity(cartItem.id!);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total: \$${controller.totalAmount}"),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Checkout"),
                      content: const Text("Proceed To Checkout"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Checkout(),
                              ),
                            );
                          },
                          child: const Text("Checkout"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
