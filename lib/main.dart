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
      title: 'متجر مواد البناء',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuildingMaterialsPage(),
    );
  }
}

// صفحة أقسام مواد البناء الرئيسية
class BuildingMaterialsPage extends StatelessWidget {
  const BuildingMaterialsPage({super.key});

  // أقسام مواد البناء
  final List<Map<String, String>> buildingSections = const [
    {
      'title': 'الأسمنت والحديد',
      'subtitle': 'جميع أنواع الأسمنت وحديد التسليح',
      'image': '🏗️'
    },
    {
      'title': 'البطحاء والسمسمية والرخام',
      'subtitle': 'مستلزمات الخرسانة والتشطيبات',
      'image': '🧱'
    },
    {
      'title': 'أدوات البناء والمعدات',
      'subtitle': 'خلاطات، مواسير، ومعدات أخرى',
      'image': '🛠️'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم مواد البناء'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: buildingSections.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Text(
                  buildingSections[index]['image']!,
                  style: const TextStyle(fontSize: 32),
                ),
                title: Text(
                  buildingSections[index]['title']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(buildingSections[index]['subtitle']!),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // الانتقال إلى منتجات القسم المختار
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SectionItemsPage(
                        sectionName: buildingSections[index]['title']!,
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

// صفحة استعراض المنتجات داخل القسم
class SectionItemsPage extends StatelessWidget {
  final String sectionName;

  const SectionItemsPage({super.key, required this.sectionName});

  // دالة إرسال الطلب عبر الواتساب إلى رقمك مباشرة
  Future<void> sendOrderToWhatsApp(String itemName) async {
    String phoneNumber = "+967711395120";
    String message = "السلام عليكم، أريد طلب ($itemName) من قسم ($sectionName).";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'تعذر فتح الواتساب';
    }
  }

  @override
  Widget build(BuildContext context) {
    // قائمة تجريبية للمنتجات داخل كل قسم (يمكنك تعديلها لاحقاً)
    final List<String> items = [
      'منتج نوع أول',
      'منتج نوع ثانٍ',
      'منتج نوع ثالث',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(sectionName),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(items[index]),
              subtitle: const Text('متوفر للطلب والتوصيل'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => sendOrderToWhatsApp(items[index]),
                child: const Text('طلب'),
              ),
            ),
          );
        },
      ),
    );
  }
}
