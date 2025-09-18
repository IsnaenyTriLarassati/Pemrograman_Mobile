import 'dart:io';

import 'package:project1/project1.dart' as project1;

const String nama = 'Isna';
void main(List<String> arguments) {
  // print('Hello world: ${project1.calculate()}!');

  // constanta & final
  final String nama2 = 'Larassati';
  // print("Nama saya $nama $nama2");

  // Variabel
  int umur = 20;
  double tinggi = 155.5;
  bool jenis_kelamin = false; // true = laki-laki, false = perempuan
  String alamat = 'Jl. Mawar no 20';
  stdout.writeln("umur saya $umur tahun");
  stdout.writeln("tinggi saya $tinggi cm");
  stdout.writeln("jenis kelamin saya ${jenis_kelamin ? 'laki-laki' : 'perempuan'}");
  stdout.writeln("alamat saya di $alamat");
  num nilai = 95.5;
  stdout.writeln("nilai saya $nilai");
  dynamic bebas = "20";
  stdout.writeln("Nilai dari dynamic adalah $bebas");
  String angka1 = "10";
  int angka2 = int .parse(angka1);
  int angka3 = bebas;

  // list
  List<String> hobby = ['Nonton Film', 'Game Roblox', 'Berenang'];
  hobby.add('Traveling');
  stdout.writeln("Hobby saya adalah $hobby");

  // mapping
  Map<String, String> data = {
    'nama': 'Isna Larassati',
    'alamat': 'Jl. Mawar no 20',
    'jenis_kelamin': 'Perempuan',
  };

  Map<String, int> data2 = {'umur': 20, 'tinggi': 155};
  data["pekerjaan"] = "Mahasiswa";
  data.addAll({"hoby": "Nonton Film"});

  stdout.writeln("Data diri saya $data $data2");
  stdout.writeln("Nama saya adalah ${data['nama']}");

  // Exception
  try {
    // Code that might throw an exception
    int result = 10 ~/ 0; // This will throw an IntegerDivisionByZeroException
  } on IntegerDivisionByZeroException {
    // Handles the specific IntegerDivisionByZeroException
    print("Cannot divide by zero!");
  } catch (e) {
    // Handles any other type of exception and provides the exception object
    print("An unexpected error occurred: $e");
  } finally {
    // Code that always executes, regardless of whether an exception occurred
    print("Execution complete.");
  }

  // Null Safety
  // String? kendaraan; // kendaraan bisa bernilai null
  String kendaraan = 'Motor'; // kendaraan tidak boleh bernilai null
  stdout.writeln("Kendaraan saya adalah $kendaraan");
}

