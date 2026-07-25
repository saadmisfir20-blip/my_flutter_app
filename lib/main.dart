class BuildingMaterialsHomePage extends StatelessWidget {
  const BuildingMaterialsHomePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"name": "أسمنت", "icon": Icons.foundation},
    {"name": "حديد", "icon": Icons.hardware},
    {"name": "بلاط", "icon": Icons.grid_view},
    {"name": "سباكة", "icon": Icons.water_drop},
    {"name": "كهرباء", "icon": Icons.electrical_services},
    {"name": "دهانات", "icon": Icons.format_paint},
    {"name": "أخشاب", "icon": Icons.cabin},
    {"name": "معدات", "icon": Icons.handyman},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "ابن مسفر للتجارة",
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        children: [

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "ابحث عن منتج...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height:20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal:16),
            height:170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff0D47A1),
                  Color(0xff1565C0),
                ],
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  right:20,
                  top:25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "عروضنا",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height:8),

                      Text(
                        "أفضل الأسعار\nلمواد البناء",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize:18,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left:20,
                  bottom:20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryRed,
                    ),
                    onPressed: (){},
                    child: const Text("تسوق الآن"),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height:25),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: Text(
              "الأقسام",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height:15),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            padding: const EdgeInsets.symmetric(horizontal:16),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:4,
              childAspectRatio:.9,
              crossAxisSpacing:10,
              mainAxisSpacing:10,
            ),
            itemBuilder: (_,index){

              return Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      radius:24,
                      backgroundColor: primaryBlue.withOpacity(.1),
                      child: Icon(
                        categories[index]["icon"],
                        color: primaryBlue,
                      ),
                    ),

                    const SizedBox(height:10),

                    Text(
                      categories[index]["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:13,
                      ),
                    )

                  ],
                ),
              );
            },
          ),

          const SizedBox(height:25),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: Text(
              "أحدث المنتجات",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:20,
              ),
            ),
          ),

          const SizedBox(height:80),
        ],
      ),
    );
  }
}
const SizedBox(height:80),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    childAspectRatio: 0.72,
    children: [

      buildProductCard(
        context,
        "أسمنت وطني",
        "7,500 ر.س",
        Icons.foundation,
      ),

      buildProductCard(
        context,
        "حديد تسليح",
        "6,000 ر.س",
        Icons.hardware,
      ),

      buildProductCard(
        context,
        "بلاط سيراميك",
        "4,500 ر.س",
        Icons.grid_view,
      ),

      buildProductCard(
        context,
        "مواسير سباكة",
        "2,800 ر.س",
        Icons.water_drop,
      ),

    ],
  ),
),

const SizedBox(height:25),
Widget buildProductCard(
  BuildContext context,
  String title,
  String price,
  IconData icon,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: const Offset(0, 3),
        )
      ],
    ),
    child: Column(
      children: [

        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Icon(
              icon,
              size: 70,
              color: primaryBlue,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),

              Text(
                price,
                style: const TextStyle(
                  color: primaryRed,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryRed,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(
                          productName: title,
                        ),
                      ),
                    );
                  },
                  child: const Text("اطلب الآن"),
                ),
              ),

            ],
          ),
        )

      ],
    ),
  );
}
