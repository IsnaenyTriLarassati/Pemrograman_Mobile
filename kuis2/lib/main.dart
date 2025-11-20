// Dari image_01671b.png
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(PokeApp());
}

class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeAPI Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PokemonPage(),
    ); // MaterialApp
  }
}

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  Map<String, dynamic>? pokemonData;
  bool isLoading = false;
  String? error;

  Future<void> fetchPokemon() async {
    setState(() {
      isLoading = true;
      error = null;
    });

// Dari image_01673f.png
    try {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'))
          .timeout(Duration(seconds: 15));

      if (response.statusCode == 200) {
        setState(() {
          pokemonData = jsonDecode(response.body);
        });
      } else {
        setState(() {
          error = 'Gagal memuat data. Status: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Terjadi kesalahan: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemon(); // otomatis ambil data saat pertama kali
  }

// Dari image_016760.png
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('[PokeAPI - Ditto]')),
      body: Center(child: _buildPokemonCard()),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchPokemon,
        child: const Icon(Icons.refresh),
        tooltip: 'Refresh Data',
      ), // FloatingActionButton
    ); // Scaffold
  }

  Widget _buildPokemonCard() {
    final name = pokemonData!['name'] ?? '-';
    final id = pokemonData!['id'] ?? '-';
    final height = pokemonData!['height'] ?? '-';
    final weight = pokemonData!['weight'] ?? '-';
    final sprite =
        pokemonData!['sprites']['front_default'] ?? 'https://via.placeholder.com/150';

    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(sprite, width: 150, height: 150),
            SizedBox(height: 10),
            Text(
              name.toString().toUpperCase(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ), // TextStyle
            ), // Text
            SizedBox(height: 8),
            Text('ID: $id'),
            Text('Height: $height'),
            Text('Weight: $weight'),
          ],
        ),
      ), // Padding
    ); // Card
  }
}