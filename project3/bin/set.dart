import 'dart:io';

void main() {
  var setNilai1 = <int>{1,2,3,4};
  var setNilai2 = <int>{3,3,4,5};
  print(setNilai2);
  print(setNilai1.union(setNilai2));
  print(setNilai1.intersection(setNilai2)); 

// Set dengan inputan
  // set dengan inputan integer
  var setNilai3 = <int>{};

  stdout.writeln("Jumlah data setNilai3 = ");
  String? input1 = stdin.readLineSync();
  int jumlah1 = int.tryParse(input1 ?? '') ?? 0;
  for (var i = 0; i < jumlah1; i++) {
    stdout.writeln("Masukkan nilai ke-${i + 1} = ");
    String? inputNilai = stdin.readLineSync();
    int nilai1 = int.tryParse(inputNilai ?? '') ?? 0;
    setNilai3.add(nilai1);
  }
  print(setNilai3);

  // Set dengan inputan String
  var setNilai4 = <String>{};

  stdout.writeln("Jumlah data setNilai4 = ");
  String? input = stdin.readLineSync();
  int jumlah = int.tryParse(input ?? '') ?? 0;
  for (var i = 0; i < jumlah; i++) {
    stdout.writeln("Masukkan nilai ke-${i + 1} = ");
    String? inputNilai = stdin.readLineSync();
    String nilai1 = inputNilai ?? '';
    setNilai4.add(nilai1);
  }
  // print(setNilai4);
  // print(setNilai4.elementAt(1)); //mengambil data berdasarkan index

  var NilaiList = setNilai4.toList();
  print(NilaiList.elementAt(1));
}