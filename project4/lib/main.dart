// import 'package:flutter/material.dart';

// void main() {
//   runApp(DeeApp());
// }

// class DeeApp extends StatelessWidget {
//   const DeeApp({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Dee Flutter App",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Balonku ada 5",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontFamily: 'Arial',
//             ),
//           ),
//           backgroundColor: Colors.blue,
//           centerTitle: false,
//           foregroundColor: Colors.white,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Balonku ada 5\nRupa-rupa warnanya\nHijau, kuning, kelabu\nMerah muda dan biru",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontFamily: 'Arial',
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Meletus balon hijau\nHatiku sangat kacau\nBalonku tinggal 4\nKupegang erat-erat",
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.grey[700],
//                 fontFamily: 'Arial',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';

void main() {
  runApp(IsnaApp());
}

class IsnaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IsnaApp",
      home: Scaffold(
        appBar: AppBar(
          title: Text("🧚‍♀️ larassati", style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Georgia',
          ),),
          backgroundColor: const Color(0xFFC46A45),
          centerTitle: false,
          foregroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF7EDE8),
                Color(0xFFE8D9C9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/nadin.jpg',
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Judul Lagu
                Text(
                  "\"Di Akhir Perang\"",
                  style: TextStyle(
                    fontSize: 26, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC46A45),
                    fontFamily: 'Georgia',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Nadin Amizah",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A4A3C),
                    fontFamily: 'Georgia',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Lirik Lagu
                Text(
                  """
Perlahan akan
Kuajarkan cara
Menanam, menuai
Baik buruk di dunia

Kuwarnai tanganmu yang mati
Biar kau lihat dunia tak lagi menyakiti

Dan kubisikkan asal kau tahu bagaimana
Rasanya bahagia sepenuhnya sampai
Ku merasa lega, kau merasa lega
Ku sampai di sana

Perlahan telah
Kau ajarkan cara
Menerima rasa
Baik buruk yang ku punya

Kau panggil jahat yang menyelimuti
Sampai ku tahu dunia tak lagi menyakiti

Dan kubisikkan asal kau tahu bagaimana
Rasanya bahagia sepenuhnya sampai
Ku merasa lega, kau merasa lega
Ku sampai di sana

Perang telah usai
Perang telah usai
Aku bisa pulang
Kubaringkan panah
Dan berteriak, "Menang"

Dan kubisikkan asal kau tahu bagaimana
Rasanya bahagia sepenuhnya sampai
Ku merasa lega, kau merasa lega
Ku sampai di sana, kau sampai di sana
Ku sampai di sana, kau sampai di sana
                  """,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: Color(0xFF6A4A3C), 
                    fontFamily: 'Georgia',
                  ),
                  textAlign: TextAlign.right, // rata kanan
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
