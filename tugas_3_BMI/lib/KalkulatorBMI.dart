import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  double? _hasilBMI;
  String _keterangan = "Masukkan Data Anda";
  String _gender = "Laki-laki"; 

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);
        _hasilBMI = hasil;

        if (_gender == "Laki-laki") {
          if (hasil < 18.5) {
            _keterangan = "Kurus (Underweight)";
          } else if (hasil < 25.0) {
            _keterangan = "Normal (Ideal)";
          } else if (hasil < 27.0) {
            _keterangan = "Kelebihan Berat Badan";
          } else {
            _keterangan = "Obesitas";
          }
        } else {
          if (hasil < 18.5) {
            _keterangan = "Kurus (Underweight)";
          } else if (hasil < 24.0) {
            _keterangan = "Normal (Ideal)";
          } else if (hasil < 27.0) {
            _keterangan = "Kelebihan Berat Badan";
          } else {
            _keterangan = "Obesitas";
          }
        }
      } else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid!!!";
      }
    });
  }

  void _resetData() {
    setState(() {
      _bbController.clear();
      _tbController.clear();
      _hasilBMI = null;
      _keterangan = "Masukkan Data Anda";
      _gender = "Laki-laki";
    });
  }

  Color _getResultColor() {
    if (_hasilBMI == null) return Colors.grey.shade200;
    if (_keterangan.contains("Normal")) return Colors.green.shade100;
    if (_keterangan.contains("Kurus")) return Colors.blue.shade100;
    return Colors.red.shade100;
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], 
      appBar: AppBar(
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Pilih Jenis Kelamin",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChoiceChip(
                            label: const Text('Laki-laki'),
                            selected: _gender == 'Laki-laki',
                            onSelected: (selected) {
                              if (selected) {
                                setState(() => _gender = 'Laki-laki');
                              }
                            },
                            avatar: const Icon(Icons.male),
                            selectedColor: Colors.blue.shade100,
                          ),
                          const SizedBox(width: 15),
                          ChoiceChip(
                            label: const Text('Perempuan'),
                            selected: _gender == 'Perempuan',
                            onSelected: (selected) {
                              if (selected) {
                                setState(() => _gender = 'Perempuan');
                              }
                            },
                            avatar: const Icon(Icons.female),
                            selectedColor: Colors.pink.shade100,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _bbController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.monitor_weight),
                          labelText: 'Berat Badan (kg)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _tbController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.height),
                          labelText: 'Tinggi Badan (cm)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _resetData,
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        'Reset',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _hitungBMI,
                      icon: const Icon(Icons.calculate),
                      label: const Text(
                        'Hitung',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF0D47A1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _getResultColor(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'HASIL BMI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? '-',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: _hasilBMI == null ? Colors.grey : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _keterangan,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: _keterangan.contains("Tidak Valid")
                            ? Colors.red
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
