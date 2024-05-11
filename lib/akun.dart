import 'package:flutter/material.dart';
import 'package:kuis/homepage.dart';
import 'package:kuis/login.dart';
import 'package:kuis/riwayatpes.dart';

class Akun extends StatelessWidget {
  final String loggedInUsername;

  Akun({required this.loggedInUsername});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username: $loggedInUsername',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
              },
              child: Text('Logout'),
            ),
          ],
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
                        Navigator.push(
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
                  icon: Icon(Icons.receipt_long_outlined, color: Color(0xFF7469B6)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SedangBerjalan()), 
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
