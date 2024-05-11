import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kuis/keranjang.dart';

void main() {
  runApp(Menu());
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(itemCountMap: {}),
    );
  }
}

class MenuPage extends StatefulWidget {
  final Map<String, int> itemCountMap; // Tambahkan parameter itemCountMap

  MenuPage({Key? key, required this.itemCountMap}) : super(key: key);

  @override
  State<MenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MenuPage> {
  TextEditingController _searchController = TextEditingController();

  List<String> foodImages = [
    'https://images.tokopedia.net/img/KRMmCm/2023/6/13/8333d36a-ae93-4891-883d-c21c9e68a7f5.jpg',
    'https://akcdn.detik.net.id/visual/2023/02/02/keikpop_43.jpeg?w=650&q=90',
    'https://images.tokopedia.net/img/KRMmCm/2022/10/7/8c53a432-2e09-482c-b3c3-877a63dd588b.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Color(0xFFEFE6E6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Mau makan apa?',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    // Tambahkan fungsi untuk menangani ketika tombol pencarian diaktifkan
                    print('Hasil pencarian: $value');
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Keranjang(itemCountMap: widget.itemCountMap)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Tambahkan fungsi untuk menangani ketika ikon list diklik
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Keranjang(itemCountMap: widget.itemCountMap)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: foodImages.map((imageUrl) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageUrl,
                      width: 300, // Ubah ukuran lebar gambar di sini
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: foodImages.map((imageUrl) {
                int index = foodImages.indexOf(imageUrl);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            buildMenuItem(
              name: 'Kupat Tahu Uhuy',
              imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2023/01/16/resep-kupat-tahu-saus-kacang-khas-jawa_43.jpeg?w=1200',
              price: 10.0,
            ),
            buildMenuItem(
              name: 'Ayam Geprek Teh Jean',
              imageUrl:'https://images.tokopedia.net/img/KRMmCm/2022/10/7/8c53a432-2e09-482c-b3c3-877a63dd588b.jpg',
              price: 10.0,
            ),
            buildMenuItem(
              name: 'Keikpop by The Food Chain',
              imageUrl: 'https://down-id.img.susercontent.com/file/4b197dad1f60d83646f7bb0a51bce3fd',
              price: 10.0,
            ),
            buildMenuItem(
              name: 'Kupat Tahu Spesial',
              imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2023/01/16/resep-kupat-tahu-saus-kacang-khas-jawa_43.jpeg?w=1200',
              price: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String name,
    required String imageUrl,
    required double price,
  }) {
    int itemCount = widget.itemCountMap[name] ?? 0; // Ambil jumlah item yang sudah dipilih

    return GestureDetector(
      onTap: () {
        setState(() {
          // Tambahkan item ke itemCountMap dan tambahkan jumlahnya jika sudah ada
          if (widget.itemCountMap.containsKey(name)) {
            widget.itemCountMap[name] = widget.itemCountMap[name]! + 1;
          } else {
            widget.itemCountMap[name] = 1;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(168, 225, 175, 209), // Warna latar belakang kontainer
          borderRadius: BorderRadius.circular(8.0), // Sudut kontainer
        ),
        child: Row(
          children: [
            Container(
              width: 100, // Sesuaikan ukuran dengan kebutuhan
              height: 100, // Sesuaikan ukuran dengan kebutuhan
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0, // Ukuran teks pertama
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Deskripsi', // Tambahkan deskripsi menu di sini jika diperlukan
                    style: TextStyle(
                      fontSize: 16.0, // Ukuran teks kedua
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (itemCount > 0) {
                              // Kurangi jumlah item jika jumlahnya lebih dari 0
                              widget.itemCountMap[name] = itemCount - 1;
                            }
                          });
                        },
                      ),
                      Text(
                        itemCount.toString(), // Tampilkan jumlah item
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            // Tambahkan jumlah item jika tombol + diklik
                            widget.itemCountMap[name] = itemCount + 1;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16.0),
                      Icon(Icons.star, color: Colors.yellow, size: 16.0),
                      Icon(Icons.star, color: Colors.yellow, size: 16.0),
                      Icon(Icons.star, color: Colors.yellow, size: 16.0),
                      Icon(Icons.star_half, color: Colors.yellow, size: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        '4.5 | 15 Min',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
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
