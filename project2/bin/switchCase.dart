import 'dart:io';

void main() {
  print("Masukkan angka hari =");
  String? hari = stdin.readLineSync();
  int nilai = int.tryParse(hari ?? '') ?? 0;

  switch (nilai) {
    case 1:
      print("Senin");
      break;
    case 2:
      print("Selasa");
      break;
    case 3:
      print("Rabu");
      break;
    case 4:
      print("Kamis");
      break;
    case 5:
      print("Jumat");
      break;
    case 6:
      print("Sabtu");
      break;
    case 7:
      print("Minggu");
      break;
    default:
      print("Maaf inputan salah");
  }
}