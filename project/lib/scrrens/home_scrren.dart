import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> foodItems = [
    {"title": "Biriyani Lover", "image": "assets/biryani.png"},
    {"title": "Kwality Bites", "image": "assets/icecreame.jpg"},
    {"title": "Baarish-e-Pakoda", "image": "assets/pakoda.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: CircleAvatar(radius: 12), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Stack(
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset('assets/img1.png', height: 100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Leaderboard
              const Text(
                "Leaderboard",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('assets/leaderboard1.png', height: 100),
                    SizedBox(width: 20),
                    Image.asset('assets/laderboard2.png', height: 100),
                    SizedBox(width: 20),
                    Image.asset('assets/leaderboard3.png', height: 100),
                    SizedBox(width: 20),
                    Image.asset('assets/leaderboard4.png', height: 100),
                    SizedBox(width: 20),
                    Image.asset('assets/leaderboard5.png', height: 100),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Search
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.filter_alt_outlined),
                ],
              ),
              const SizedBox(height: 20),

              // Food Scroll
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/biryani.png'),
                    SizedBox(width: 10),
                    Image.asset('assets/meggi.png'),
                    SizedBox(width: 10),
                    Image.asset('assets/burger.jpg'),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/line1.png", width: 10),
                  const SizedBox(width: 8),
                  const Text(
                    "Cuisines you should try",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Image.asset("assets/line1.png", width: 10),
                ],
              ),
              const SizedBox(height: 20),

              // Cuisine Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 3.0,
                children: [
                  _CuisineCard(
                    image: 'assets/thali1.jpg',
                    title: 'Indian',
                    subtitle: 'Biriyani, Naan, Roti',
                  ),
                  _CuisineCard(
                    image: 'assets/chinese.jpg',
                    title: 'Chinese',
                    subtitle: 'Noodles, Fried Rice',
                  ),
                  _CuisineCard(
                    image: 'assets/pizza.jpg',
                    title: 'Italian',
                    subtitle: 'Pizza, Pasta',
                  ),
                  _CuisineCard(
                    image: 'assets/dhosa.jpg',
                    title: 'South Indian',
                    subtitle: 'Dosa, Idli, Vada',
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                "Food playlist",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    final item = foodItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                              item['image']!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item['title']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Featured Hives
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'Our ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: 'Featured ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Hives',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _foodItem("assets/biryani.png", "₹ 450.00"),
                                const SizedBox(width: 10),
                                _foodItem("assets/paneer.jpg", "₹ 450.00"),
                                const SizedBox(width: 10),
                                _foodItem("assets/curry.jpg", "₹ 450.00"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/clock.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(Icons.circle, size: 10, color: Colors.red),
                        Icon(Icons.circle, size: 10, color: Colors.green),
                        SizedBox(width: 6),
                        Text(
                          "Indian/ chinese/ thai/ japanese",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            "Clock Tower: Restaurant cum Cafe",
                            style: TextStyle(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.trending_up, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _foodItem("assets/biryani.png", "₹ 450.00"),
                                const SizedBox(width: 10),
                                _foodItem("assets/paneer.jpg", "₹ 450.00"),
                                const SizedBox(width: 10),
                                _foodItem("assets/curry.jpg", "₹ 450.00"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/restaurant.jpg",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(Icons.circle, size: 10, color: Colors.red),
                        Icon(Icons.circle, size: 10, color: Colors.green),
                        SizedBox(width: 6),
                        Text(
                          "Indian/ chinese/ thai/ japanese",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            "Clock Tower: Restaurant cum Cafe",
                            style: TextStyle(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.trending_up, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
              //button
              const SizedBox(height: 30),
              Container(
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all hives",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hiveverse',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildHiveImageCard(
                          imagePath: 'assets/drophive.png',
                          label: 'Parcel Delivery',
                        ),
                        _buildHiveImageCard(
                          imagePath: 'assets/medihive.png',
                          label: 'Medicines',
                        ),
                        _buildHiveImageCard(
                          imagePath: 'assets/shophive.png',
                          label: 'Groceries',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom widget
Widget _buildHiveImageCard({required String imagePath, required String label}) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget _CuisineCard({
  required String image,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color(0xFFF7F7F7),
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
        child: Image.asset(image, width: 40, height: 40, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
      ),
    ),
  );
}

Widget _foodItem(String imagePath, String price) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover),
      ),
      const SizedBox(height: 4),
      Text(price, style: const TextStyle(fontSize: 10)),
    ],
  );
}
