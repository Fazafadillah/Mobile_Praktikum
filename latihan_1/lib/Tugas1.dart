import 'package:flutter/material.dart';

class Aplkasiku extends StatelessWidget {
  const Aplkasiku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), 
      ),
      home: const HalamanUtama(title: 'Aplikasi'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key, required this.title});
    final String title;
  @override
  Widget build(BuildContext context) {
    String ucapan = 'Selamat datang, ';
    String nama = 'Muchamad Faza Fadillah';
    

    String hasilGabungan = ucapan + nama;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title), 
        ),
        body: Center( 
          child: Text(
            hasilGabungan,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
    );
  }
}