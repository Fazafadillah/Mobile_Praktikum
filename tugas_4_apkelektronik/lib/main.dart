import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product_model.dart';

void main() {
  runApp(const ElectronicsApp());
}

class ElectronicsApp extends StatelessWidget {
  const ElectronicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Elektronik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProductScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<Product>> _productsFuture;

  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _productsFuture = ApiService().fetchProducts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final shouldShow = _scrollController.offset > 300;
    if (shouldShow != _showScrollToTop) {
      setState(() {
        _showScrollToTop = shouldShow;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  // Pull-to-refresh
  Future<void> _refreshProducts() async {
    final newFuture = ApiService().fetchProducts();
    setState(() {
      _productsFuture = newFuture;
    });
    try {
      await newFuture;
    } catch (_) {
      // error ditampilkan oleh FutureBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Elektronik'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError && !snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${snapshot.error}',
                        textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _refreshProducts,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final products = snapshot.data!;
            return RefreshIndicator(
              onRefresh: _refreshProducts,
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.image != null)
                            Center(
                              child: Image.network(
                                product.image!,
                                height: 200,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported,
                                      size: 50);
                                },
                              ),
                            ),
                          const SizedBox(height: 10),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(product.description ?? 'Tidak ada deskripsi.'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _refreshProducts,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 200),
                  Center(child: Text('Tidak ada produk yang ditemukan.')),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: _showScrollToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Kembali ke atas',
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
