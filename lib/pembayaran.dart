import 'package:flutter/material.dart';
import 'package:kuis/homepage.dart';
import 'package:kuis/riwayatpes.dart';
import 'package:kuis/statusPesanan.dart';

// 2205714 Raya Cahya Nurani & 2206000 Septiani Eka Putri

void main() {
  runApp(Pembayaran());
}

class Pembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PembayaranPage(),
    );
  }
}

class PembayaranPage extends StatefulWidget {
  @override
  _MyPembayaranPageState createState() => _MyPembayaranPageState();
}

class _MyPembayaranPageState extends State<PembayaranPage> {
  int quantity = 1; // Variable to hold the quantity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Ganti dengan halaman homepage
            );
          },
        ),
        title: Row(
          children: [
            SizedBox(width: 8),
            Text('Konfirmasi Pesanan'),
            SizedBox(width: 8),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat Penerima:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Gerlong Tengah No. 02',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.local_shipping, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Pengiriman',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(168, 225, 175, 209).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Standart - 20 min',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Rp 7.000',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.store),
                  SizedBox(width: 8),
                  Text(
                    'Fish Box - Dago',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Tambahkan logika untuk menangani ketika tombol "Ubah" diklik
                      print('Ubah diklik');
                    },
                    child: Text(
                      'Tambah Pesanan',
                      style: TextStyle(color: Color(0xFF7469B6)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk menangani ketika box diklik
                print('Box diklik');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/a7a2f1c8-20bf-4af7-81cd-843bae8ad325_restaurant-image_1637558167919.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fish and chips',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Decrease quantity logic
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              child: Icon(Icons.remove_circle_outlined, color: Color.fromARGB(168, 225, 175, 209)), // Minus Icon
                            ),
                            SizedBox(width: 8),
                            Text(
                              quantity.toString(), // Display quantity
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                // Increase quantity logic
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Icon(Icons.add_circle, color: Color(0xFF7469B6)), // Plus Icon
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text('Rp. 40.100'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), 
            // Added space here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pesanan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp. 40.100', // Ganti dengan total harga pesanan Anda
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Added space here
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.card_giftcard, color: Color(0xFF7469B6)), // Voucher Icon
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Voucher',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Voucher Gratis Ongkir',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey), // Forward Icon
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Color(0xFF7469B6)), // Money Icon
                      SizedBox(width: 16),
                      Text(
                        'Pembayaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Tunai',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Rp. 40.100',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Diskon',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Rp. 7000', // Ganti dengan nilai diskon jika ada
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya Pengiriman',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Rp. 7.000',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp. 40.100', // Ganti dengan total pembayaran
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => statusPesanan()), // Ganti dengan halaman homepage
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7469B6), // Memberi warna latar belakang
          ),
          child: Text('Pesan Sekarang', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
