import 'package:flutter/material.dart';
import 'package:kuis/homepage.dart';
import 'package:kuis/keranjang.dart';

void main() {
  runApp(Voucher());
}

class Voucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoucherPage(),
    );
  }
}

class VoucherPage extends StatefulWidget {
  @override
  State<VoucherPage> createState() => _MyVoucherPageState();
}

class _MyVoucherPageState extends State<VoucherPage> {
  TextEditingController _searchController = TextEditingController();

  List<String> voucherImages = [
    'assets/vc.jpg',
  ];

  List<Map<String, dynamic>> vouchers = [
    {
      'image': 'assets/vcMakanan.jpg',
      'title': 'Voucher sebesar 60%',
      'description': 'Berlaku hingga hari ini',
    },
    {
      'image': 'assets/vcMakanan.jpg',
      'title': 'Voucher sebesar 60%',
      'description': 'Berlaku hingga hari ini',
    },
    {
      'image': 'assets/vcGratong.jpg',
      'title': 'Voucher Gratis Ongkir',
      'description': 'Berlaku hingga hari ini',
    },
    {
      'image': 'assets/vcGratong.jpg',
      'title': 'Voucher Gratis Ongkir',
      'description': 'Berlaku hingga hari ini',
    },
  ];

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
                  },
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Ganti dengan halaman homepage
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('Kotak diklik');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Keranjang(itemCountMap: {},)), // Navigasi ke halaman detail
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ListView.builder(
              itemCount: voucherImages.length,
              shrinkWrap: true, // Membuat ListView mengikuti ukuran widget yang ada di dalamnya
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      voucherImages[index],
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: vouchers.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Tambahkan logika untuk menangani ketika kontainer diklik
                    print('Kontainer ke-${index + 1} diklik');
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(168, 225, 175, 209),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          vouchers[index]['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vouchers[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              vouchers[index]['description'],
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
