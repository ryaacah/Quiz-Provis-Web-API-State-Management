import 'package:flutter/material.dart';
import 'package:kuis/akun.dart';
import 'package:kuis/homepage.dart';
import 'package:kuis/statusPesanan.dart';

void main() {
  runApp(SedangBerjalan());
}

class SedangBerjalan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SedangBerjalanPage(),
    );
  }
}

class SedangBerjalanPage extends StatefulWidget {
  @override
  State<SedangBerjalanPage> createState() => _MySedangBerjalanPageState();
}

class _MySedangBerjalanPageState extends State<SedangBerjalanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 8),
            Text('Riwayat'),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => statusPesanan()),
            );
          },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nomor Pembelian: #123456',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Jam Pembelian: 10:00 AM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Image.network(
                    'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/a7a2f1c8-20bf-4af7-81cd-843bae8ad325_restaurant-image_1637558167919.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fish Box - Dago',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Menu: Fish and chips',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Banyaknya Pesanan: 1'),
              Text('Harga: Rp. 40.100'),
              SizedBox(height: 16),
              Container(
                height: 1,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(vertical: 16),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pesanan Diterima',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Driver Menuju Restoran'),
                        Text('Perkiraan Pesanan Tiba'),
                      ],
                    ),
                  ),
                  Icon(Icons
                      .access_time), // Menambahkan ikon access_time di samping perkiraan pesanan tiba
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Color.fromARGB(168, 225, 175, 209),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.home_outlined, color: Color(0xFF7469B6)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()), 
                    );
                  },
                ),
                Text('Home'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.receipt_long_outlined,
                      color: Color(0xFF7469B6)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>SedangBerjalan()), 
                    );
                  },
                ),
                Text('Pesanan Saya '),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.person_2_outlined, color: Color(0xFF7469B6)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Akun(loggedInUsername: '')), 
                    );
                  },
                ),
                Text('Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
