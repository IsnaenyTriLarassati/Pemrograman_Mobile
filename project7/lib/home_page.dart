import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // 🔹 Latar belakang lembut
      appBar: AppBar(
        title: const Text('Beranda'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon utama
              const Icon(
                Icons.school,
                color: Colors.teal,
                size: 90,
              ),
              const SizedBox(height: 20),

              // Judul utama
              const Text(
                'Selamat Datang Isnaeny',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                'Pilih menu di bawah untuk melanjutkan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Tombol Profil Mahasiswa
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  icon: const Icon(Icons.person_outline, color: Colors.white),
                  label: const Text('Profil Mahasiswa', style: TextStyle(color: Colors.white, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tombol Galeri
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/gallery'),
                  icon: const Icon(Icons.photo_library_outlined, color: Colors.white),
                  label: const Text('Galeri Mahasiswa', style: TextStyle(color: Colors.white, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Politeknik Negeri Malang',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
