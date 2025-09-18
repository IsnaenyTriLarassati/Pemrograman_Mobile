import 'dart:io';
void main() {
  // break
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break;
    }
    print("Perulangan ke-$i");
  }

  // continue
  for (int i = 1; i <= 10; i++) {
    if (i % 2 != 0) { // ganjil
      continue;
    }
    print("Perulangan ke-$i");
  }
}