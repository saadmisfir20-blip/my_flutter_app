import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IbnMesferApp());
}

const Color primaryRed = Color(0xFFD32F2F);
const Color primaryBlue = Color(0xFF0D47A1);
const Color backgroundGrey = Color(0xFFF5F5F5);

class IbnMesferApp extends StatelessWidget {
  const IbnMesferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ابن مسفر لمواد البناء',
      theme: ThemeData(
        primaryColor: primaryBlue,
        scaffoldBackgroundColor: backgroundGrey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryBlue),
          titleTextStyle: TextStyle(color: primaryBlue, fontSize: 18, fontWeight: FontWeight.bold),
          elevation: 1,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// الشاشة الرئيسية مع شريط التنقل السفلي الفعال
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const BuildingMaterialsHomePage(),
    const CategoriesScreen(),
    const CartScreen(),
    const ContactScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryRed,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'الأقسام'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'تواصل معنا'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'المزيد'),
        ],
      ),
    );
  }
}

// 1. الصفحة الرئيسية
class BuildingMaterialsHomePage extends StatelessWidget {
  const BuildingMaterialsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ابن مسفر للتجارة مواد البناء'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'أسمنت فائق الجودة بأفضل الأسعار',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text('المنتجات المتاحة للطلب الفوري:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              title: const Text('أسمنت وطني 50 كجم', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('7,500 ر.س'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryRed, foregroundColor: Colors.white),
                onPressed: () {
                  // فتح تفاصيل المنتج أو الطلب مباشرة
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailScreen(productName: 'أسمنت وطني 50 كجم')));
                },
                child: const Text('طلب'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('حديد تسليح 12 مم', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('6,000 ر.س'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryRed, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailScreen(productName: 'حديد تسليح 12 مم')));
                },
                child: const Text('طلب'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. شاشة الأقسام
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<String> categories = const [
    'أسمنت ومواد بناء',
    'حديد وتسليح',
    'بلاط وسيراميك',
    'أدوات سباكة',
    'دهانات ومواد عزل',
    'كهرباء وإنارة',
    'أخشاب وأبواب',
    'أدوات ومعدات',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أقسام المتجر')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(categories[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailScreen(productName: categories[index])),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 3. شاشة السلة
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Future<void> sendWhatsAppOrder(BuildContext context) async {
    String phoneNumber = "+967711395120";
    String message = "السلام عليكم، أريد إتمام طلب المنتجات الموجودة في السلة من متجر ابن مسفر.";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح تطبيق الواتساب')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سلة الطلبات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text('المنتجات المضافة ستظهر هنا، أو يمكنك إتمام الطلب مباشرة.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryRed, foregroundColor: Colors.white, padding: const EdgeInsets.all(14)),
                onPressed: () => sendWhatsAppOrder(context),
                child: const Text('إتمام الطلب عبر الواتساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. شاشة تواصل معنا
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void _launchURL(String urlString) async {
    if (await canLaunchUrl(Uri.parse(urlString))) {
      await launchUrl(Uri.parse(urlString), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تواصل معنا')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.phone, color: primaryBlue),
            title: const Text('أرقام التواصل'),
            subtitle: const Text('711395120 - 714395120'),
            onTap: () => _launchURL('tel:+967711395120'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.location_on, color: primaryBlue),
            title: const Text('الموقع'),
            subtitle: const Text('اليمن - ريمة - الجبين'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.message, color: Colors.green),
            title: const Text('واتساب مباشر'),
            subtitle: const Text('اضغط هنا لمراسلتنا فوراً'),
            onTap: () {
              String url = "https://wa.me/+967711395120?text=${Uri.encodeComponent('السلام عليكم، استفسار بخصوص المنتجات')}";
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }
}

// 5. شاشة المزيد
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المزيد')),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.info), title: Text('عن المتجر')),
          Divider(),
          ListTile(leading: Icon(Icons.settings), title: Text('الإعدادات')),
          Divider(),
          ListTile(leading: Icon(Icons.share), title: Text('مشاركة التطبيق')),
        ],
      ),
    );
  }
}

// شاشة تفاصيل المنتج وإرسال الطلب للرقم
class ProductDetailScreen extends StatelessWidget {
  final String productName;
  const ProductDetailScreen({super.key, required this.productName});

  Future<void> sendOrder(BuildContext context) async {
    String phoneNumber = "+967711395120"; // رقمك الأساسي
    String message = "السلام عليكم، أريد طلب المنتج التالي: ($productName) من تطبيق مواد البناء.";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح تطبيق الواتساب')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('متوفر للطلب والتوصيل المباشر.', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryRed, foregroundColor: Colors.white, padding: const EdgeInsets.all(15)),
                onPressed: () => sendOrder(context),
                child: const Text('طلب الآن عبر الواتساب (711395120)', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
