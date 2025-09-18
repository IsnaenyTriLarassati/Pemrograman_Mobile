import 'dart:io';

void main() {
  print("Masukkan nilai awal : ");
  String? nilai = stdin.readLineSync();
  int i = int.tryParse(nilai ?? '') ?? 0;

  // int i = 1;
  while (i <= 10) {
    print("Iterasi ke-$i");
    i++;
  }

  print("Masukkan nilai awal : ");
  String? nilai1 = stdin.readLineSync();
  int a = int.tryParse(nilai1 ?? '') ?? 0;

  // int a = 11;
  do {
    print("Perulangan ke-$a");
    a++;
  } while (a <= 10);
}