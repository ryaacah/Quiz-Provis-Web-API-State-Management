import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuis/akun.dart';
import 'package:kuis/homepage.dart';
import 'package:kuis/service/auth_service.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginPage(),
      ),
    );
  }
}

class LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginEvent {
  final String raya;
  final String raya1;

  LoginEvent(this.raya, this.raya1);
}

class LoginCubit extends Cubit<LoginState> {
  String? loggedInUsername;

  LoginCubit() : super(LoginState());

  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      emit(LoginFailure('Mohon isi username dan password.'));
      return;
    }

    emit(LoginLoading());

    try {
      bool isAuthenticated = await verifyCredentials(username, password);
      if (isAuthenticated) {
        loggedInUsername = username;
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Kredensial tidak valid. Periksa kembali username dan password Anda.'));
      }
    } catch (e) {
      emit(LoginFailure('Terjadi kesalahan saat memverifikasi kredensial.'));
    }
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Menambahkan jarak dari atas
            Center(
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(173, 136, 193, 100),
                ),
              ),
            ),
            SizedBox(height: 55),
            Text(
              'Masuk',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Silahkan masukkan username yang terhubung beserta kata sandi.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: Color.fromARGB(133, 133, 133, 100),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'UserName',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _usernameController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(133, 133, 133, 100),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kata Sandi',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Masukkan Kata Sandi',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(133, 133, 133, 100),
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Color.fromRGBO(173, 136, 193, 100),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Ganti dengan logika lupa kata sandi
                },
                child: Text(
                  'Lupa Kata Sandi?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Center(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return CircularProgressIndicator();
                  } else if (state is LoginFailure) {
                    return Text(state.error);
                  } else if (state is LoginSuccess) {
                    WidgetsBinding.instance?.addPostFrameCallback((_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    });
                  }
                  return ElevatedButton(
                    onPressed: () {
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      context.read<LoginCubit>().login(username, password);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(173, 136, 193, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: SizedBox(
                      width: 220, // Atur lebar tombol
                      child: Center(
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 70), // Menambahkan jarak di antara tombol dan tulisan berikutnya
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ganti dengan logika buat akun
                  final username = _usernameController.text;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Akun(loggedInUsername: username)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(173, 136, 193, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ), child: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
