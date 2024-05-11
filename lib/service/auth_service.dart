import 'dart:async';

// Metode untuk memverifikasi kredensial pengguna
Future<bool> verifyCredentials(String username, String password) async {
  await Future.delayed(Duration(seconds: 2)); // Mensimulasikan pengecekan kredensial yang memakan waktu
  

  if (username == 'raya' && password == 'raya1' || username == 'septi' && password == 'septi1') {
    return true; // Jika kredensial valid
  } else {
    return false; // Jika kredensial tidak valid
  }
}
