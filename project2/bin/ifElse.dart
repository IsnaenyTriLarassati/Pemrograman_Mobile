import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  print('Hello world: ${project2.calculate()}!');

  // int nilai = 75;
  stdout.write("Masukkan Nilai : ");
  String? input = stdin.readLineSync()!;
  int nilai = int.parse(input ?? '') ?? 0;

  // logic konversi String null ke int nol (diatas)
  /* 1. String tmp = input ?? ''; 
  int nilai = int.tryParse(tmp) ?? 0; */

  /* 2. String tmp;
  if(input == null){
    tmp = '';
  } else {
    tmp = input;
  } */

  if((nilai >= 75) && (nilai <= 100)){
    print("Nilai A");
  } else if((nilai >= 60) && (nilai < 74)){
    print("Nilai B");
  } else if((nilai >= 0) && (nilai < 59)){
    print("Nilai C");
  } else {
    print("Nilai Invalid");
  }

  // If Tradisional
  String status;
  if (nilai >= 60) {
    status = "Lulus";
  } else {
    status = "Tidak Lulus";
  }
  print("$status");

  // If Ternary
  String status1 = (nilai >= 60) ? 
  " Alhamdulillah Lulus" 
  : "Maaf Anda Tidak Lulus";
  print("$status1");

  
}
