import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IbnMesferApp());
}

// الألوان الأساسية للتطبيق كما في الشعار
const Color primaryRed = Color(0xFFD32F2F); // أحمر غامق
const Color primaryBlue = Color(0xFF0D47A1); // أزرق غامق
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
        fontFamily: 'Tajawal', // نفترض وجود خط عربي مناسب
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryBlue),
          titleTextStyle: TextStyle(color: primaryBlue, fontSize: 20, fontWeight: FontWeight.bold),
          elevation: 1,
        ),
      ),
      home: const BuildingMaterialsHomePage(),
    );
  }
}

// الصفحة الرئيسية ( تحاكي الشاشة الثانية في الصورة )
class BuildingMaterialsHomePage extends StatefulWidget {
  const BuildingMaterialsHomePage({super.key});

  @override
  State<BuildingMaterialsHomePage> createState() => _BuildingMaterialsHomePageState();
}

class _BuildingMaterialsHomePageState extends State<BuildingMaterialsHomePage> {
  int _selectedIndex = 0;

  // أقسام مواد البناء المحددة
  final List<Map<String, dynamic>> _materialsCategories = [
    {'name': 'أسمنت ومواد بناء', 'icon': Icons.architecture, 'color': Colors.orange},
    {'name': 'حديد تسليح', 'icon': Icons.fitness_center, 'color': Colors.grey},
    {'name': 'بلاط وسيراميك', 'icon': Icons.grid_view, 'color': Colors.teal},
    {'name': 'أدوات سباكة', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'name': 'دهانات ومواد عزل', 'icon': Icons.format_paint, 'color': Colors.redAccent},
    {'name': 'كهرباء وإنارة', 'icon': Icons.lightbulb, 'color': Colors.amber},
    {'name': 'أخشاب وأبواب', 'icon': Icons.door_back_door, 'color': Colors.brown},
    {'name': 'أدوات ومعدات', 'icon': Icons.handyman, 'color': Colors.blueGrey},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'), // ضع شعارك هنا
          ),
        ),
        title: const Text('ابن مسفر للتجارة مواد البناء'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // لافتة الإعلانات ( تحاكي الجزء العلوي )
            Container(
              margin: const EdgeInsets.all(12),
              height: 150,
              decoration: BoxDecoration(
                color: primaryBlue,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/banner.png'), // ضع صورة الإعلان هنا
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: const Center(
                child: Text(
                  'أسمنت فائق الجودة بأفضل الأسعار',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            
            // شريط البحث
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتج...',
                  prefixIcon: const Icon(Icons.search, color: primaryBlue),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            
            // عنوان الأقسام
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الأقسام الرئيسية', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('عرض الكل', style: TextStyle(color: primaryRed, fontSize: 14)),
                ],
              ),
            ),
            
            // شبكة الأقسام (Grid) - خاصة بمواد البناء
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _materialsCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                     // عند الضغط ننتقل لصفحة المنتجات الخاصة بالقسم
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsListPage(categoryName: _materialsCategories[index]['name'])));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
                        ),
                        child: Icon(_materialsCategories[index]['icon'], color: _materialsCategories[index]['color'], size: 30),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _materialsCategories[index]['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              },
            ),
            
            // جزء العروض والخصومات ( محاكاة للشاشة الثامنة )
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                   Text('العروض والخصومات', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                   Spacer(),
                   Icon(Icons.arrow_forward, size: 16, color: primaryBlue,)
                ],
              ),
            ),
             
             // مثال لبطاقة عرض
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: ListTile(
                leading: Container(width: 50, color: Colors.grey[200], child: const Icon(Icons.construction, color: primaryBlue,)),
                title: const Text('أسمنت وطني 50 كجم', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('سعر خاص للعرض المحدود'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('7,500 ر.س', style: TextStyle(color: primaryRed, fontWeight: FontWeight.bold)),
                    Text('9,000 ر.س', style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 10)),
                  ],
                ),
                onTap: () {
                   // عند الضغط ننتقل لصفحة تفاصيل المنتج
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailPage()));
                },
              ),
            ),
            const SizedBox(height: 80), // مسافة لشريط التنقل
          ],
        ),
      ),
       
      // شريط التنقل السفلي ( يحاكي الأيقونات في التصميم )
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryRed,
        unselectedItemColor: primaryBlue.withOpacity(0.6),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 3) { // أيقونة "اتصل بنا"
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsPage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'الأقسام'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_outlined), label: 'اتصل بنا'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'المزيد'),
        ],
      ),
    );
  }
}

// صفحة تفاصيل المنتج ( محاكاة للشاشة الرابعة )
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

    Future<void> launchWhatsApp() async {
    String phoneNumber = "+967711395120"; // رقمك
    String message = "السلام عليكم، أريد الاستفسار أو طلب أسمنت وطني:";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'تعذر فتح الواتساب';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل المنتج')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: const Icon(Icons.architecture, size: 100, color: Colors.orange,), // صورة المنتج
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('أسمنت وطني 50 كجم', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text('العلامة التجارية: الوطنية', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  const Text('7,500 ر.س', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryRed)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            IconButton(icon: const Icon(Icons.remove), onPressed: () {}),
                            const Text('1', style: TextStyle(fontSize: 18)),
                            IconButton(icon: const Icon(Icons.add, color: primaryRed), onPressed: () {}),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton.icon(
                           icon: const Icon(Icons.shopping_cart_outlined),
                           label: const Text('إضافة إلى السلة'),
                           onPressed: () {},
                           style: ElevatedButton.styleFrom(backgroundColor: primaryBlue, foregroundColor: Colors.white, padding: const EdgeInsets.all(15)),
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(height: 10),
                   SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                       onPressed: launchWhatsApp, // زر الشراء المباشر يفتح الواتساب
                       style: ElevatedButton.styleFrom(backgroundColor: primaryRed, foregroundColor: Colors.white, padding: const EdgeInsets.all(15)),
                       child: const Text('طلب الآن عبر الواتساب'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة منتجات القسم الفرعي ( تحاكي الشاشة الثالثة مع تعديل )
class ProductsListPage extends StatelessWidget {
  final String categoryName;
  const ProductsListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
     // بيانات وهمية مؤقتة
    final List products = List.generate(5, (index) => {'name': '$categoryName - منتج ${index+1}', 'price': (index + 1) * 1000});

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.construction, color: Colors.orange,),
              title: Text(products[index]['name']),
              trailing: Text('${products[index]['price']} ر.س', style: const TextStyle(color: primaryRed, fontWeight: FontWeight.bold)),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailPage())),
            ),
          );
        },
      ),
    );
  }
}

// صفحة "اتصل بنا" ( محاكاة للشاشة التاسعة )
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  // دوال الاتصال بالروابط
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
          Image.asset('assets/store_front.png', height: 150, fit: BoxFit.cover,), // صورة الفرع
          const SizedBox(height: 20),
          
          // معلومات التواصل
          ListTile(
            leading: const Icon(Icons.phone, color: primaryBlue),
            title: const Text('أرقام التواصل'),
            subtitle: const Text('7711395120 - 714395120'), // رقمك
            onTap: () => _launchURL('tel:+967711395120'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.location_on, color: primaryBlue),
            title: const Text('الموقع'),
            subtitle: const Text('اليمن - صنعاء - شارع الستين'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.message, color: Colors.green),
            title: const Text('واتساب'),
            subtitle: const Text('اضغط للتواصل المباشر معنا'),
            onTap: () {
               String phoneNumber = "+967711395120";
               String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent('السلام عليكم، عندي طلب من التطبيق')}";
               _launchURL(url);
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.access_time, color: primaryBlue),
            title: const Text('ساعات العمل'),
            subtitle: const Text('من 7:00 صباحاً - إلى 10:00 مساءً'),
          ),
        ],
      ),
    );
  }
}
