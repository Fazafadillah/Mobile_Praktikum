import 'package:flutter/material.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigasi Flutter',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'iPhone 15 Pro',
        'image': 'assets/images/iphone.png',
        'description':
            'Apple iPhone 15 Pro dengan chip A17 Pro, bodi titanium, layar Super Retina XDR 6,1 inci, dan kamera utama 48 MP.',
      },
      {
        'name': 'Samsung Galaxy S24',
        'image': 'assets/images/samsung.png',
        'description':
            'Samsung Galaxy S24 dengan layar Dynamic AMOLED 2X 120 Hz, prosesor Exynos 2400, dan fitur Galaxy AI.',
      },
      {
        'name': 'Xiaomi 14',
        'image': 'assets/images/xiaomi.png',
        'description':
            'Xiaomi 14 dengan Snapdragon 8 Gen 3, lensa Leica, dan pengisian daya cepat 90W.',
      },
      {
        'name': 'OPPO Reno 11',
        'image': 'assets/images/oppo.png',
        'description':
            'OPPO Reno 11 dengan kamera portrait 50 MP, layar AMOLED melengkung, dan pengisian SUPERVOOC 67W.',
      },
      {
        'name': 'Vivo V30',
        'image': 'assets/images/vivo.png',
        'description':
            'Vivo V30 dengan kamera Aura Light, desain tipis, dan baterai 5000 mAh dengan FlashCharge 80W.',
      },
      {
        'name': 'Realme 12 Pro',
        'image': 'assets/images/realme.png',
        'description':
            'Realme 12 Pro dengan lensa periskop telefoto, layar 120 Hz, dan desain terinspirasi jam tangan mewah.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(
              product['image']!,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.smartphone, size: 40),
            ),
            title: Text(product['name']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    itemTitle: product['name']!,
                    itemImage: product['image']!,
                    itemDescription: product['description']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}