import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/perfume.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(PerfumeApp());
}

class PerfumeApp extends StatefulWidget {
  @override
  _PerfumeAppState createState() => _PerfumeAppState();
}

class _PerfumeAppState extends State<PerfumeApp> {
  final List<Perfume> cart = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Perfume World',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
        primaryColor: Colors.lightBlueAccent,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: GoogleFonts.poppins(color: Colors.black87),
          bodyMedium: GoogleFonts.poppins(color: Colors.black54),
          titleLarge: GoogleFonts.poppins(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.lightBlueAccent,
          elevation: 1,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.lightBlueAccent,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: GoogleFonts.poppins(color: Colors.grey[600]),
        ),
        cardColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        } else if (settings.name == '/cart') {
          return MaterialPageRoute(builder: (_) => CartScreen(cart: cart));
        }
        return null;
      },
    );
  }
}
