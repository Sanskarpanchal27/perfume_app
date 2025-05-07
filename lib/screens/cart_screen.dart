import 'package:flutter/material.dart';
import '../models/perfume.dart';

class CartScreen extends StatelessWidget {
  final List<Perfume> cart;

  CartScreen({required this.cart});

  double get totalPrice =>
      cart.fold(0, (sum, item) => sum + (item.price * item.count));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  leading: Image.asset(item.image, width: 50, height: 50),
                  title: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    '${item.count} x \$${item.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    '\$${(item.count * item.price).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Checkout successful!')),
                    );
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
