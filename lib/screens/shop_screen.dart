import 'package:flutter/material.dart';
import '../models/perfume.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<Perfume> allPerfumes = [
    Perfume(
      name: 'Dior Sauvage',
      price: 120.0,
      image: 'assets/images/perfume1.jpeg',
      description:
      'Sauvage is an act of creation inspired by wide-open spaces and defined by raw freshness.',
    ),
    Perfume(
      name: 'Chanel No.5',
      price: 150.0,
      image: 'assets/images/perfume2.jpeg',
      description:
      'The very essence of femininity. A timeless, legendary fragrance.',
    ),

    Perfume(
      name: 'Gucci Bloom',
      price: 100.0,
      image: 'assets/images/perfume3.jpeg',
      description:
      'A scent designed to celebrate the authenticity, vitality and diversity of women—flourishing in a natural, expressive and individual way.',
    ),
    Perfume(
      name: 'Versace Eros',
      price: 130.0,
      image: 'assets/images/perfume4.jpeg',
      description:
      'Versace Eros is a bold and captivating blend of masculinity and sensuality, with a fresh, citrusy top note and a warm, woody base.',
    ),
    Perfume(
      name: 'Dolce & Gabbana',
      price: 143.0,
      image: 'assets/images/perfume5.jpg',
      description: 'Dolce & Gabbana The One, Eau De Toilette Spray for Men.',
    ),
    Perfume(
      name: 'Jimmy Choo',
      price: 74.68,
      image: 'assets/images/perfume6.jpg',
      description: 'Jimmy Choo I Want Choo Forever – rich and feminine.',
    ),
    Perfume(
      name: 'Calvin Klein',
      price: 70.88,
      image: 'assets/images/perfume7.jpg',
      description:
      'CK Be Eau de Toilette for Men & Women – clean, aromatic fragrance.',
    ),
    Perfume(
      name: 'Armani Beauty',
      price: 205.0,
      image: 'assets/images/perfume8.jpg',
      description:
      'Armani Sì Intense – Chypre Ambery Fruity with blackcurrant, rose & tea.',
    ),
    Perfume(
      name: 'Paco Rabanne',
      price: 274.68,
      image: 'assets/images/perfume9.jpg',
      description: '1 Million Parfum Spray for Men – daring and luxurious.',
    ),
    Perfume(
      name: 'Carolina Herrera',
      price: 154.68,
      image: 'assets/images/perfume10.jpg',
      description: 'Bad Boy by Carolina Herrera – bold woody aromatic blend.',
    ),
  ];

  String query = '';
  List<Perfume> cart = [];

  @override
  Widget build(BuildContext context) {
    List<Perfume> filtered = allPerfumes
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Perfume World'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen(cart: cart)),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) => setState(() => query = val),
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Find your signature scent...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final perfume = filtered[index];
          return Card(
            margin: EdgeInsets.all(8),
            color: Theme.of(context).cardColor,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
                      perfume: perfume,
                      cart: cart,
                    ),
                  ),
                );
              },
              leading: Image.asset(
                perfume.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                perfume.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                '\$${perfume.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
