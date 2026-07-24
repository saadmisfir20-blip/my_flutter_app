import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IbnMusferApp());
}

class IbnMusferApp extends StatelessWidget {
  const IbnMusferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ابن مسفر لتجارة مواد البناء',
      theme: ThemeData(
        primaryColor: const Color(0xFF0C1B33),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MainNavigationScreen(),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF26522),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'الأقسام'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'التواصل'),
        ],
      ),
    );
  }
}

// ---------------- 1. الشاشة الرئيسية ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String logoUrl = "https://raw.githubusercontent.com/saadmisfir20-blip/my_flutter_app/main/assets/logo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B33),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                logoUrl,
                height: 38,
                width: 38,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.construction, color: Colors.orange),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'ابن مسفر لتجارة مواد البناء',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFF26522), width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        logoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.construction, size: 50, color: Color(0xFF0C1B33)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ابن مسفر للتجارة',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0C1B33)),
                  ),
                  const Text(
                    'مواد بناء - Ibn Msfer Building Materials',
                    style: TextStyle(fontSize: 13, color: Color(0xFFF26522), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0C1B33),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text('أسمنت ابن مسفر بأعلى جودة', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF26522)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryDetailScreen(categoryTitle: 'أسمنت ومواد بناء')));
                    },
                    child: const Text('تسوق الآن', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('الأقسام الرئيسية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                CategoryCard(title: 'أسمنت ومواد بناء', icon: Icons.build),
                CategoryCard(title: 'حديد وتسليح', icon: Icons.grid_view),
                CategoryCard(title: 'بلاط وسيراميك', icon: Icons.space_dashboard),
                CategoryCard(title: 'أدوات سباكة', icon: Icons.plumbing),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- 2. شاشة الأقسام ----------------
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'أسمنت ومواد بناء', 'حديد وتسليح', 'بلاط وسيراميك',
      'أدوات سباكة', 'دهانات ومواد عزل', 'كهرباء وإضاءة', 'أخشاب وأبواب'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B33),
        title: const Text('الأقسام', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.category, color: Color(0xFF0C1B33)),
              title: Text(cat, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailScreen(categoryTitle: cat)));
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------------- 3. شاشة تفاصيل القسم ----------------
class CategoryDetailScreen extends StatelessWidget {
  final String categoryTitle;
  const CategoryDetailScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B33),
        title: Text(categoryTitle, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProductCard(title: '$categoryTitle - صنف 1', price: '7,500 ر.س'),
          ProductCard(title: '$categoryTitle - صنف 2', price: '12,000 ر.س'),
          ProductCard(title: '$categoryTitle - صنف 3', price: '4,500 ر.س'),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title, price;
  const ProductCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.inventory_2, color: Color(0xFF0C1B33), size: 36),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price, style: const TextStyle(color: Color(0xFFF26522), fontWeight: FontWeight.bold)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0C1B33)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('تمت إضافة $title إلى السلة')),
            );
          },
          child: const Text('إضافة للسلة', style: TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ),
    );
  }
}

// ---------------- 4. شاشة السلة وتوجيه الطلب للواتساب ----------------
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Future<void> _sendOrderToWhatsApp(BuildContext context) async {
    const phoneNumber = "967711395120"; // رقم الواتساب الرسمي
    const message = "السلام عليكم ورحمة الله وبركاته،\nأود إتمام طلب شراء مواد بناء من متجر ابن مسفر:\n- أسمنت الوطنية 50 كجم (عدد 10)\n- حديد تسليح 12 مم (عدد 20)\n\nالإجمالي: 236,500 ر.س";
    
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح تطبيق الواتساب')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B33),
        title: const Text('سلة الطلبات', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CartItemTile(title: 'أسمنت الوطنية 50 كجم', price: '7,500 ر.س', qty: '10'),
                  CartItemTile(title: 'حديد تسليح 12 مم', price: '6,000 ر.س', qty: '20'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('إجمالي المنتجات:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('236,500 ر.س', style: TextStyle(fontSize: 18, color: Color(0xFFF26522), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF25D366)),
                      onPressed: () => _sendOrderToWhatsApp(context),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat, color: Colors.white),
                          SizedBox(width: 8),
                          Text('إتمام الطلب عبر الواتساب', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------- 5. شاشة التواصل ----------------
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1B33),
        title: const Text('التواصل معنا', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone, color: Color(0xFF0C1B33)),
              title: Text('أرقام التواصل', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('711395120', style: TextStyle(fontSize: 16)),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.chat, color: Color(0xFF25D366)),
              title: Text('واتساب', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('711395120', style: TextStyle(color: Color(0xFF25D366), fontSize: 13)),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Color(0xFFF26522)),
              title: Text('الموقع', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('ريمة - الجبين - الشارع العام'),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailScreen(categoryTitle: title)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFF0C1B33)),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final String title, price, qty;
  const CartItemTile({super.key, required this.title, required this.price, required this.qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price, style: const TextStyle(color: Color(0xFFF26522))),
        trailing: Text('الكمية: $qty'),
      ),
    );
  }
}
