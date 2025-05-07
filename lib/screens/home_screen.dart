import 'package:flutter/material.dart';
import 'shop_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 140,
              ),
              SizedBox(height: 30),

              Text(
                'Welcome to Perfume World',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ShopScreen()),
                  );
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text('Shop Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
