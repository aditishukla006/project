import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Image.asset('assets/chesse burger.png'),
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
              SizedBox(height: 20),

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
            ],
          ),
        ),
      ),
    );
  }
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
