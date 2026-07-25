import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر ابن مسفر',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesPage(),
    );
  }
}

// صفحة الأقسام الرئيسية
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  // قائمة الأقسام في متجرك
  final List<Map<String, String>> categories = const [
    {
      'title': 'المواد الغذائية',
      'subtitle': 'مواد غذائية أساسية واستهلاكية',
      'image': '🛒'
    },
    {
      'title': 'خدمات الصرافة والحوالات',
      'subtitle': 'خدمات النقد وتحويل الأموال',
      'image': '💸'
    },
    {
      'title': 'مواد البناء',
      'subtitle': 'مستلزمات البناء والتشييد',
      'image': '🏗️'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أقسام المتجر'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Text(
                  categories[index]['image']!,
                  style: const TextStyle(fontSize: 32),
                ),
                title: Text(
                  categories[index]['title']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(categories[index]['subtitle']!),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // عند الضغط على القسم، ينتقل إلى صفحة المنتجات الخاصة به
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryProductsPage(
                        categoryName: categories[index]['title']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// صفحة المنتجات داخل القسم المحدد
class CategoryProductsPage extends StatelessWidget {
  final String categoryName;

  const CategoryProductsPage({super.key, required this.categoryName});

  // دالة إرسال الطلب إلى الواتساب
  Future<void> sendOrderToWhatsApp(String productName) async {
    String phoneNumber = "+967711395120";
    String message = "السلام عليكم، أريد طلب ($productName) من قسم ($categoryName).";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'تعذر فتح الواتساب';
    }
  }

  @override
  Widget build(BuildContext context) {
    // أمثلة لمنتجات وهمية داخل القسم (يمكنك تعديلها لاحقاً)
    final List<String> products = [
      'منتج رقم 1',
      'منتج رقم 2',
      'منتج رقم 3',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(products[index]),
              subtitle: const Text('متوفر للطلب المباشر'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => sendOrderToWhatsApp(products[index]),
                child: const Text('طلب'),
              ),
            ),
          );
        },
      ),
    );
  }
}
