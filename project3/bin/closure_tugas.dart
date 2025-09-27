import 'dart:io';

Function buatDiskonBertingkat() {
  double diskon = 0.0;
  return (double harga) {
    diskon += 0.05;
    return harga - (harga * diskon);
  };
}

void main() {
  var diskonBertingkat = buatDiskonBertingkat();
  stdout.write("Masukkan harga awal: ");
  double hargaAwal = double.parse(stdin.readLineSync()!);
  print("Harga awal: Rp$hargaAwal");

  for (int i = 1; i <= 3; i++) {
    double hargaDiskon = diskonBertingkat(hargaAwal);
    print("Harga setelah panggilan $i (diskon ${i * 5}%): Rp$hargaDiskon");
  }
}