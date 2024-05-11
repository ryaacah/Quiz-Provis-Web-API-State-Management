import 'package:flutter/material.dart';
import 'package:kuis/riwayatpes.dart';

// 2205714 Raya Cahya Nurani & 2206000 Septiani Eka Putri

void main() {
  runApp(statusPesanan());
}

class statusPesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: statusPesananPage(),
    );
  }
}

class statusPesananPage extends StatefulWidget {
  State<statusPesananPage> createState() => _MystatusPesananPageState();
}

class _MystatusPesananPageState extends State<statusPesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Tambahkan logika untuk menangani ketika tombol panah kembali diklik
          },
        ),
        title: Row(
          children: [
            SizedBox(width: 8),
            Text('Driver Menuju Restoran'),
            SizedBox(width: 8),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline_outlined),
            onPressed: () {
              // Tambahkan fungsi untuk menangani ketika ikon keranjang diklik
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.check_circle_rounded, color: Color.fromARGB(168, 225, 175, 209)), // Icon bulat yang dicentang
                  Text('Pesanan Diterima'),
                  Text('11.05'),
                ],
              ),
              SizedBox(width: 8),
              Container(
                height: 1,
                width: 50,
                color: Colors.grey, // Garis
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Icon(Icons.circle, color: Colors.grey), // Icon bulat kosong
                  Text('Diambil'),
                ],
              ),
              SizedBox(width: 8),
              Container(
                height: 1,
                width: 50,
                color: Colors.grey, // Garis
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Icon(Icons.circle, color: Colors.grey), // Icon bulat kosong
                  Text('Selesai'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16), // Jarak antara baris sebelumnya dan baris baru
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue, // Warna latar belakang gambar bulat
                  ),
                  child: Center(
                    child: Text(
                      'Foto', // Ganti dengan gambar Anda
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Driver'),
                    Text('Rating: 4.5 • AB1234CD'),
                  ],
                ),
                SizedBox(width: 16),
                Row( // Menambahkan Row untuk menampilkan icon pesan dan telepon secara horizontal
                  children: [
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        // Tambahkan logika ketika tombol telepon ditekan
                      },
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {
                        // Tambahkan logika ketika tombol pesan ditekan
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Jarak antara baris sebelumnya dan baris baru
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fish Box - Dago', // Text pertama
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8), // Jarak antara baris sebelumnya dan baris baru  
              Text(
                'Rp40.100 - (1 Menu) - Tunai', // Text ketiga
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8), // Jarak antara baris sebelumnya dan baris baru
              Text(
                'Raya Cahya - (+62) 821-3635-72532', // Text ketiga
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8), // Jarak antara baris sebelumnya dan baris baru
              Text(
                'Alamat Penerima', // Text pertama
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8), // Jarak antara baris sebelumnya dan baris baru
              Text(
                'Gerlong Tengah No. 02', // Text pertama
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Fish Box - Dago', // Nama toko
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16), // Jarak antara baris sebelumnya dan baris baru
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/a7a2f1c8-20bf-4af7-81cd-843bae8ad325_restaurant-image_1637558167919.jpg'), // Ganti URL dengan URL gambar menu
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1 x Fish and chips', // Nama menu
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp40.100', // Harga menu
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16), // Jarak antara baris sebelumnya dan baris baru
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal Pesanan (1 menu)', // Teks subtotal
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp40.100', // Harga subtotal
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SedangBerjalan()), // Ganti dengan halaman homepage
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7469B6), // Memberi warna latar belakang
          ),
          child: Text('Pesanan Diterima', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
