import 'package:flutter/material.dart';

void main() {
  runApp(const Isnaapp());
}

class Isnaapp extends StatelessWidget {
  const Isnaapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Larassati Flutter App",
      home: Scaffold(         //! Scaffold!
      
        appBar: AppBar(       //! Appbar!
          title: const Text("Ini AppBar"),
          backgroundColor: Colors.blue,
          //leading: const Icon(Icons.menu),  // Ikon dikiri
          actions: [
            const Icon(Icons.search), // Ikon dikanan
            const Icon(Icons.more_vert),
            const FlutterLogo(size: 24.0),
          ],
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Atas"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.red, size: 40),
                  Icon(Icons.star, color: Colors.green, size: 40),
                  Icon(Icons.star, color: Colors.blue, size: 40),
                ],
              ),

              const Text(
                "Ini Foto Saya",
                style: TextStyle(
                  fontSize: 24, // ukuran font
                  fontWeight: FontWeight.bold, // tebal
                  fontStyle: FontStyle.italic, // miring
                  color: Colors.blue, // warna
                  letterSpacing: 2, // jarak antar huruf
                  wordSpacing: 5, // jarak antar kata
                  decoration: TextDecoration.underline, // garis bawah
                ),
                textAlign: TextAlign.center, // rata kiri, kanan, tengah
                maxLines: 2, // jumlah baris maksimal
                overflow: TextOverflow.ellipsis, // kalau kepanjangan -> "..."
              ),
              
              Image.asset("assets/images/nadin.jpg"),
              
              const MyStateful(), // Memanggil class MyStateful

            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(  //! FloatingActionButton!
          onPressed: () {
            print("Floating Action Button Pressed");
          },
          child: const Icon(Icons.add),
        ),

        drawer: Drawer(        //! Drawer!
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(  //! BottomNavigationBar!
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
        // IconButton moved to AppBar actions or body for valid placement
      ),
    
    );
  }
}

class MyStateful extends StatefulWidget {
  const MyStateful({super.key});

  @override
  State<MyStateful> createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> {
  int counter = 0;

  void tambah() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Counter: $counter",
          style: const TextStyle(fontSize: 24),
        ),
        ElevatedButton(
          onPressed: tambah,
          child: const Text("Tambah"),
        ),
      ],
    );
  }
}