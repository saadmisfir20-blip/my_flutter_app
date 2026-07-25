import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IbnMesferApp());
}

const Color primaryRed = Color(0xFFD32F2F);
const Color primaryBlue = Color(0xFF0D47A1);
const Color backgroundGrey = Color(0xFFF8F9FA);

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

// الشاشة الرئيسية مع شريط التنقل السفلي
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    CategoriesScreen(),
    CartScreen(),
    ContactScreen(),
    MoreScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'الأقسام'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_rounded), label: 'تواصل معنا'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_rounded), label: 'المزيد'),
        ],
      ),
    );
  }
}

// 1. الصفحة الرئيسية
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> featuredItems = const [
    {'name': 'أسمنت وطني 50 كجم', 'price': '7,500 ر.س', 'icon': Icons.architecture},
    {'name': 'حديد تسليح 12 مم', 'price': '6,000 ر.س', 'icon': Icons.fitness_center},
    {'name': 'بلاط أرضيات 60×60', 'price': '3,800 ر.س', 'icon': Icons.grid_view},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ابن مسفر لمواد البناء'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أهلاً بك في متجر ابن مسفر',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'جودة البناء تبدأ من اختيارك.. اطلب الآن ويوصلك الطلب مباشرة.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('المنتجات الأكثر طلباً', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...featuredItems.map((item) => Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: primaryBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Icon(item['icon'], color: primaryBlue),
              ),
              title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['price'], style: const TextStyle(color: primaryRed, fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen(productName: item['name'])),
                ),
                child: const Text('طلب'),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

// 2. شاشة الأقسام الكاملة
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
      appBar: AppBar(title: const Text('أقسام المتجر'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(categories[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen(productName: categories[index])),
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

  Future<void> sendCartOrder(BuildContext context) async {
    String phoneNumber = "+967711395120";
    String message = "السلام عليكم، أريد إتمام طلب منتجات سلة المشتريات من متجر ابن مسفر.";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر فتح تطبيق الواتساب')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سلة الطلبات'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('السلة جاهزة لاستقبال طلباتك', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryRed,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => sendCartOrder(context),
                child: const Text('إتمام الطلب السريع عبر الواتساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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

  void _launch(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تواصل معنا'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.phone_rounded, color: primaryBlue),
              title: const Text('أرقام التواصل'),
              subtitle: const Text('711395120 - 714395120'),
              onTap: () => _launch('tel:+967711395120'),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.chat_rounded, color: Colors.green),
              title: const Text('الواتساب المباشر'),
              subtitle: const Text('اضغط للمراسلة الفورية'),
              onTap: () => _launch('https://wa.me/+967711395120?text=${Uri.encodeComponent("السلام عليكم، أريد الاستفسار عن مواد البناء")}'),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.location_on_rounded, color: primaryBlue),
              title: Text('الموقع'),
              subtitle: Text('اليمن - ريمة - الجبين'),
            ),
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
      appBar: AppBar(title: const Text('المزيد'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(leading: Icon(Icons.info_outline), title: Text('عن المتجر'))),
          Card(child: ListTile(leading: Icon(Icons.settings_outlined), title: Text('الإعدادات'))),
        ],
      ),
    );
  }
}

// شاشة تأكيد الطلب وإرساله للواتساب (رقم 711395120)
class OrderScreen extends StatelessWidget {
  final String productName;
  const OrderScreen({super.key, required this.productName});

  Future<void> sendWhatsAppOrder(BuildContext context) async {
    String phoneNumber = "+967711395120";
    String message = "السلام عليكم، أريد طلب: ($productName) من متجر ابن مسفر لمواد البناء.";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر فتح تطبيق الواتساب')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تأكيد الطلب'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المنتج أو القسم المختار:', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            const SizedBox(height: 6),
            Text(productName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('سيتم إرسال تفاصيل هذا الطلب مباشرة إلى رقم الواتساب الخاص بالمتجر لتأكيده.', style: TextStyle(fontSize: 14, color: Colors.black54)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => sendWhatsAppOrder(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('تأكيد وإرسال الطلب عبر الواتساب (711395120)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
