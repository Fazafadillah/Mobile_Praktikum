import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemTitle;
  final String itemImage;
  final String itemDescription;

  const DetailPage({
    super.key,
    required this.itemTitle,
    required this.itemImage,
    required this.itemDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              itemImage,
              height: 250,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.smartphone, size: 150),
            ),
            const SizedBox(height: 16),
            Text(
              itemTitle,
              style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              itemDescription,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
