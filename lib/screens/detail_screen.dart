import 'package:flutter/material.dart';
import '../models/perfume.dart';
import 'cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final Perfume perfume;
  final List<Perfume> cart;

  DetailScreen({
    required this.perfume,
    required this.cart,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.perfume.count;
  }

  void increment() {
    setState(() {
      count++;
      widget.perfume.count = count;

      if (!widget.cart.contains(widget.perfume)) {
        widget.cart.add(widget.perfume);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.perfume.name} added'),
        duration: Duration(milliseconds: 800), // 🔽 Faster dismiss
      ),
    );
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
        widget.perfume.count = count;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${widget.perfume.name} quantity decreased'),
          duration: Duration(milliseconds: 800), // 🔽 Faster dismiss
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final perfume = widget.perfume;

    return Scaffold(
      appBar: AppBar(title: Text(perfume.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(perfume.image, height: 200),
            SizedBox(height: 20),
            Text(
              perfume.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              '\$${perfume.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decrement,
                  icon: Icon(Icons.remove_circle, size: 30),
                ),
                SizedBox(width: 20),
                Text(
                  '$count',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: increment,
                  icon: Icon(Icons.add_circle, size: 30),
                ),
              ],
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(cart: widget.cart),
                  ),
                );
              },
              child: Text('Your Selections'),
            ),
          ],
        ),
      ),
    );
  }
}
