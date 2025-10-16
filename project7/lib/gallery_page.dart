import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/photo1.jpg',
      'assets/images/photo2.jpg',
      'assets/images/photo3.jpg',
      'assets/images/photo4.jpg',
      'assets/images/photo5.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImage(imagePath: images[index]),
                  ),
                );
              },
              child: Hero(
                tag: images[index],
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                icon: const Icon(Icons.photo_album_outlined, color: Colors.white),
                label: const Text('Profile', style: TextStyle(color: Colors.white)),
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

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: imagePath,
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 1,
              maxScale: 4,
              child: Image.asset(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
