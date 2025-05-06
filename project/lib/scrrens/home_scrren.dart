import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              // Top Banner
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
                          child: Text(
                            '15% OFF\non your favorite hives',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/scooter.png',
                          height: 80,
                        ), // Placeholder
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 20,
                    child: Image.asset(
                      'assets/foods.png',
                      height: 70,
                    ), // Placeholder
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _LeaderboardItem(rank: "#1", name: "Tnnet"),
                  _LeaderboardItem(rank: "#2", name: "Nivara"),
                  _LeaderboardItem(rank: "#3", name: "NearHive"),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search & Filter
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
                  children: const [
                    _FoodCard(
                      tag: "#clocktower",
                      title: "Chicken Biryani",
                      image: "assets/biryani.png",
                    ),
                    _FoodCard(
                      tag: "#fusionfrenzy",
                      title: "Chicken Maggie",
                      image: "assets/maggie.png",
                    ),
                    _FoodCard(
                      tag: "#lockupcafe",
                      title: "Veg Cheese Burger",
                      image: "assets/burger.png",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Cuisines you should try",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _CuisineChip(label: "Indian", sub: "Biryani, Naan, Roti"),
                  _CuisineChip(label: "Chinese", sub: "Noodles, Dumplings"),
                  _CuisineChip(label: "Thai", sub: "Thukpa, Sea Salad"),
                  _CuisineChip(
                    label: "American",
                    sub: "Pizza, Burger, Doritos",
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Leaderboard Widget
class _LeaderboardItem extends StatelessWidget {
  final String rank;
  final String name;

  const _LeaderboardItem({required this.rank, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 24, child: Text(rank)),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Food Card
class _FoodCard extends StatelessWidget {
  final String tag;
  final String title;
  final String image;

  const _FoodCard({
    required this.tag,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 100,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Row(
            children: const [
              Icon(Icons.remove_red_eye_outlined, size: 14),
              SizedBox(width: 4),
              Text("1.7k", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

// Cuisine Chip
class _CuisineChip extends StatelessWidget {
  final String label;
  final String sub;

  const _CuisineChip({required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
