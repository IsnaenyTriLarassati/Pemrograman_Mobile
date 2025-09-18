import 'dart:io';

void main() {
  Map<String, int> mahasiswa = {};

  for (int i = 1; i <= 5; i++) {
    stdout.write("Masukkan nama mahasiswa ke-$i: ");
    String? nama = stdin.readLineSync();

    stdout.write('Masukkan nilai $nama: ');
    int? nilai = int.tryParse(stdin.readLineSync() ?? '0');

    // Simpan ke map jika nama valid dan nilai valid
    if (nama != null && nilai != null) {
      mahasiswa[nama] = nilai;
    } else {
      print('Input tidak valid. Coba lagi.');
      i--; // ulangi input jika tidak valid
    }
  }

    // Menentukan grade
    Map<String, String> kategori = {};
    mahasiswa.forEach((nama, nilai) {
      String grade;
      if (nilai >= 80 && nilai <= 100) {
        grade = "A";
      } else if (nilai >= 60 && nilai < 80) {
        grade = "B";
      } else if (nilai >= 0 && nilai < 60) {
        grade = "C";
      } else {
        grade = "Invalid Nilai";
      }
      kategori[nama] = grade;
    });

  // Tampilkan hasil akhir
  print('\nDaftar Mahasiswa dan Kategorinya (Grade & Nilai):');
  print('+----------------------+-------+-------+');
  print('| Nama Mahasiswa       | Grade | Nilai |');
  print('+----------------------+-------+-------+');
  kategori.forEach((nama, grade) {
    int nilai = mahasiswa[nama]!; // ambil nilai dari map mahasiswa
    // format nama 20 karakter, grade 5 karakter, nilai 5 karakter
    print('| ${nama.padRight(20)} | ${grade.padRight(5)} | ${nilai.toString().padRight(5)} |');
  });
  print('+----------------------+-------+-------+');
}
