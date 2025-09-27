import 'dart:io';

// Growable List
void main() {
  var mahasiswa = <String>["Isna", "Laras", "Rama"];
  print("Daftar Mahasiswa: $mahasiswa"); 
  mahasiswa.add("Rizki");
  print("Daftar Mahasiswa setelah ditambah: $mahasiswa");
  mahasiswa.remove("Laras");
  print("Daftar Mahasiswa setelah dihapus: $mahasiswa");

  // Growable List dengan input user
  List<String> mahasiswaInput = [];
  stdout.write("\nMasukkan jumlah mahasiswa: ");  
  int jmlMhs = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < jmlMhs; i++) {
    stdout.write("Nama mahasiswa ke-${i + 1}: ");
    String nama = stdin.readLineSync()!;
    mahasiswaInput.add(nama);
  }
  print("Daftar Mahasiswa dari input user: $mahasiswaInput");
  
  print("Apakah kamu ingin menambahkan mahasiswa lagi? (y/n): ");
  String? tambah = stdin.readLineSync();
  if (tambah == "y") {
    stdout.write("Masukkan nama mahasiswa: ");
    String? namaBaru = stdin.readLineSync();
    if (namaBaru != null) {
      mahasiswaInput.add(namaBaru);
    }
  }
  print("Daftar Mahasiswa akhir: $mahasiswaInput");
}