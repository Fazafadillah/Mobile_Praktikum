import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kartunama extends StatelessWidget {
  const Kartunama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Nama Digital',
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  // backgroundImage: NetworkImage(
                  //   'https://th.bing.com/th/id/OIP.qKM0kCuZ9lFPY3K6uDeUOQ?w=330&h=185&c=7&r=0&o=7&pid=1.7&rm=3',
                  // ),
                  backgroundImage: AssetImage('assets/img/foto.jpeg'),
                ), // CircleAvatar
                SizedBox(height: 10),
                Text(
                  'Muchamad Faza Fadillah',
                  style: GoogleFonts.archivoBlack(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Text
                SizedBox(
                  height: 20,
                  width: 350,
                  child: Divider(color: Colors.black),
                ), // Divider // SizedBox
                Text(
                  'Fullstack Developer',
                  style: GoogleFonts.archivoBlack(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ), // Text
                SizedBox(
                  height: 20,
                  width: 450,
                  child: Divider(color: Colors.black),
                ), // Divider // SizedBox
                Card(
                  //CARD 1
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.phone_callback, color: Colors.white),
                    title: Text(
                      '+62 889 8238 1355',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ), //CARD Card
                Card(
                  //Card 2
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text(
                      'fadilahfaza43@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  //CARD 3
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.tiktok, color: Colors.white),
                    title: Text(
                      '@nasigoreng',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  //CARD 4
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.pink,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.white),
                    title: Text(
                      '@fazafad.23',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  //CARD 5
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.work, color: Colors.white),
                    title: Text(
                      'Faza Fadillah',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
