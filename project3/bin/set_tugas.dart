import 'dart:io';

// Set dengan inputan 
void main() {
  stdout.write("Masukkan jumlah buah dikeranjang 1: ");
  int buah1 = int.parse(stdin.readLineSync()!);
  Set<String> B1 = {};
  for (int i = 0; i < buah1; i++) {
    stdout.write("Buah ke-${i + 1}: ");
    B1.add(stdin.readLineSync()!);
  }

  stdout.write("Masukkan jumlah buah dikeranjang 2: ");
  int buah2 = int.parse(stdin.readLineSync()!);
  Set<String> B2 = {};
  for (int i = 0; i < buah2; i++) {
    stdout.write("Buah ke-${i + 1}: ");
    B2.add(stdin.readLineSync()!);
  }

  Set<String> unionSet = B1.union(B2);
  Set<String> intersectionSet = B1.intersection(B2);

  print("\nBuah dikeranjang 1: $B1");
  print("Buah dikeranjang 2: $B2");
  print("Union: $unionSet");
  print("Intersection: $intersectionSet\n");  
}