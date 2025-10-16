import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final List<String> courses = const [
    'Pemrograman Mobile',
    'Manajemen Rantai Pasok',
    'Manajemen Proyek',
    'Perancangan Basis Data',
    'Penjaminan Mutu Perangkat Lunak',
    'K3',
    'Audit Sistem Informasi',
    'Kecerdasan Bisnis',
    'Metodologi Penelitian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 2,
      ),

      // BODY UTAMA
      body: Container(
        width: double.infinity,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                'Isnaeny Tri Larassati',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              const SizedBox(height: 6),
              const Text('2341760086', style: TextStyle(fontSize: 16)),
              const Text(
                'D-IV Sistem Informasi Bisnis',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 28),
              const Text(
                'Daftar Mata Kuliah Semester 5',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 12),

              // LIST MATA KULIAH
              ListView.builder(
                itemCount: courses.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.bookmark_outline, color: Colors.teal),
                      title: Text(
                        courses[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100), // supaya tidak ketutupan tombol bawah
            ],
          ),
        ),
      ),

      // BAGIAN BAWAH (TOMBOL MELAYANG)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Tombol Beranda
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                icon: const Icon(Icons.home_outlined, color: Colors.white),
                label: const Text('Beranda', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Tombol Galeri
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/gallery'),
                icon: const Icon(Icons.photo_library_outlined, color: Colors.white),
                label: const Text('Galeri', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
