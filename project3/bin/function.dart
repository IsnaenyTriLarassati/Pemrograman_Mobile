import 'dart:io';

// Fungsi dengan parameter 
// void sapa(String nama, [String? salam]) {
//   print("Halo $nama, ${salam ?? 'Selamat datang!'}");
// }

// void main() {
//   sapa("Luqman");
//   sapa("Luqman", "Selamat pagi");
// }


// Anonymous Function
// void main() {
//   var list = [1, 2, 3];
//   list.forEach((angka) {
//     print("Angka: $angka");
//   });
// }


// Lexical Scope
// void main() {
//   var x = 10;

//   void tampil() {

//     print(x); // bisa akses x walaupun x ada di luar
//   }
//   tampil();
// }


// closure
Function buatCounter() {
  var hitung = 0;

  return () {
    hitung++;
    return hitung;
  };
}

void main() {
  var counter = buatCounter();
  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3
}



