import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// Main Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil & Izin Kehadiran App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MainPage(),
    );
  }
}

// Main Page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Mapping untuk izin tiap mata kuliah
  Map<String, int> izinData = {
    "Pemrograman Mobile": 0,
    "Perencanaan Sumber Daya": 0,
    "Manajemen Rantai Pasok": 0,
  };

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _updateIzin(String matkul, int nilai) {
    setState(() {
      izinData[matkul] = (izinData[matkul]! + nilai).clamp(0, 100);
    });
  }

  void _tambahMatkulBaru(String matkulBaru) {
    setState(() {
      izinData[matkulBaru] = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ProfilePage(izinData: izinData),
      CounterPage(
        izinData: izinData,
        onUpdate: _updateIzin,
        onAddMatkul: _tambahMatkulBaru,
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Izin"),
        ],
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  final Map<String, int> izinData;
  const ProfilePage({super.key, required this.izinData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 50),
                const SizedBox(width: 20),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal.shade100,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/nadin.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/images/nadin.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Placeholder(
                        fallbackWidth: 120,
                        fallbackHeight: 120,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Isnaeny Tri Larassati",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text("NIM: 2341760086"),
            const Text("Sistem Informasi Bisnis"),
            const SizedBox(height: 20),

            // Contact Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.email, color: Colors.teal),
                SizedBox(width: 8),
                Text("isnaenylrst@polinema.ac.id"),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.phone, color: Colors.teal),
                SizedBox(width: 8),
                Text("+62 858-2619-5940"),
              ],
            ),
            const SizedBox(height: 30),

            // Daftar Izin Kehadiran
            Text(
              "Daftar Izin Kehadiran",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            ...izinData.entries.map((e) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.key),
                    Text("${e.value} izin",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// Counter Page
class CounterPage extends StatefulWidget {
  final Map<String, int> izinData;
  final Function(String, int) onUpdate;
  final Function(String) onAddMatkul;

  const CounterPage({
    super.key,
    required this.izinData,
    required this.onUpdate,
    required this.onAddMatkul,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  String namaMatkulBaru = ""; // Variabel untuk menyimpan input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Izin Kehadiran"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: widget.izinData.entries.map((e) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    e.key,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${e.value} izin",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => widget.onUpdate(e.key, -1),
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => widget.onUpdate(e.key, 1),
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            widget.izinData[e.key] = 0;
                          });
                        },
                        child: const Text("Reset"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),

      //FloatingActionButton untuk tambah mata kuliah
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              title: const Text("Tambah Mata Kuliah"),
              content: SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) {
                    namaMatkulBaru = value; // Simpan input ke variabel
                  },
                  decoration: const InputDecoration(
                    hintText: "Masukkan nama mata kuliah",
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    namaMatkulBaru = "";
                  },
                  child: const Text("Batal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final newMatkul = namaMatkulBaru.trim();
                    if (newMatkul.isNotEmpty &&
                        !widget.izinData.containsKey(newMatkul)) {
                      widget.onAddMatkul(newMatkul);
                    }
                    Navigator.pop(context);
                    namaMatkulBaru = "";
                  },
                  child: const Text("Tambah"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
