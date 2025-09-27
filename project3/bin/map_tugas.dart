import 'dart:io';

// Map untuk menyimpan data barang
void main() {
  // Map dengan key = kode barang, value = Map detail barang
  Map<String, Map<String, dynamic>> barang = {
    "BRG001": {"nama": "Laptop", "harga": 8500000},
    "BRG002": {"nama": "Smartphone", "harga": 3500000},
    "BRG003": {"nama": "Headset", "harga": 250000},
  };

  // Tampilkan data barang
  barang.forEach((kode, detail) {
    print("Kode: $kode Nama: ${detail['nama']} Harga: Rp${detail['harga']}");
  });
}