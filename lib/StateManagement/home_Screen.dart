



import 'package:fahad_project/StateManagement/cart_model.dart';
import 'package:fahad_project/StateManagement/cart_screen.dart';
import 'package:fahad_project/StateManagement/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CartItem>? _products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _products=[
      CartItem(id: "1",title: "Mobile",price: 15400,quantity: 3),
      CartItem(id: "2",title: "Laptop",price: 16400,quantity: 6),
      CartItem(id: "3",title: "Car",price: 17400,quantity: 8),
      CartItem(id: "4",title: "Bike",price: 13400,quantity: 2),
      CartItem(id: "5",title: "camera",price: 11400,quantity: 5),
    ];
  }
  @override
  Widget build(BuildContext context) {
    // final CartController controller = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ShoppingCart"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const CartScreen();
            }));

          }, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: _products!.length,
        itemBuilder: (context, index) {
          final product = _products![index];
          return ProductItem(
            id: product.id.toString(),
            title: product.title.toString(),
            price: product.price!,
            quantity: product.quantity!,
          );
        },
      ),
    );
  }
}
class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  ProductItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Quantity: $quantity',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add to cart functionality
              Provider.of<CartController>(context, listen: false).addItem(
                id,
                title,
                price,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$title added to cart!'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              foregroundColor: Colors.white // Text color
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}