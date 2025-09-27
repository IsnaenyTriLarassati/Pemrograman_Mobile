import 'dart:io';

void main() {
  //var sudah = {"nim": "2341", "nama": "Isna", "umur": 20};
  //var sudah = {"nim": "2341", "nama": "Isna", "umur": 20, "nim": "2342"}; //nim awal akan direplce

  var opo = {
    'nim' : ['2341', '2342'],
    'nama' : ['Isna', 'Laras'],
    'umur' : [20, 21]
  };
  print(opo);
  print(opo["nama"]![0]);
  print(opo["nama"]?[1]);
}