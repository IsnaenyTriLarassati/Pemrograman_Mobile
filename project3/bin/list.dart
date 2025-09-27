import 'dart:io';

import 'package:project3/project3.dart' as project3;

void main(List<String> arguments) {

// Fixlist
  var fl = List<int>.filled(4, 21); //21 = default value
  fl[0] = 1;
  fl[1] = 2;
  fl[2] = 3;
  fl[3] = 4;
  // fl[4] = 5;
  stdout.writeln(fl);
  
// Growablelist
  var gl = [1, 2, 3];
  gl.add(4);
  gl.remove(3);
  stdout.writeln(gl);
}
