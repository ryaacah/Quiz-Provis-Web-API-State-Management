import 'package:flutter/material.dart';
import 'package:kuis/menu.dart';
import 'package:kuis/pembayaran.dart';

// 2205714 Raya Cahya Nurani & 2206000 Septiani Eka Putri

class Keranjang extends StatelessWidget {
  final Map<String, int> itemCountMap; // Tambahkan parameter itemCountMap

  Keranjang({Key? key, required this.itemCountMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeranjangPage(itemCountMap: itemCountMap), // Teruskan itemCountMap ke KeranjangPage
    );
  }
}

class KeranjangPage extends StatefulWidget {
  final Map<String, int> itemCountMap; // Tambahkan parameter itemCountMap

  KeranjangPage({Key? key, required this.itemCountMap}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _MyKeranjangPageState();
}

class _MyKeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    bool hasItems = widget.itemCountMap.isNotEmpty; // Periksa apakah ada item dalam keranjang

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF7469B6)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
        ),
        title: Row(
          children: [
            SizedBox(width: 8),
            Text('Keranjangku'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.itemCountMap.length, // Gunakan panjang itemCountMap
            itemBuilder: (context, index) {
              final itemName = widget.itemCountMap.keys.toList()[index];
              final itemCount = widget.itemCountMap[itemName] ?? 0;
              return GestureDetector(
                onTap: () {
                  // Tambahkan logika untuk menangani ketika item diklik
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(168, 225, 175, 209),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Isi dengan informasi item yang sesuai dari itemCountMap
                      Text(
                        itemName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 16),
                      Text('Jumlah: $itemCount'),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: hasItems
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Pembayaran()),
                      );
                    }
                  : null, // Buat tombol non-aktif jika tidak ada item dalam keranjang
              child: Text('Pesan Sekarang'),
            ),
          ),
        ],
      ),
    );
  }
}
