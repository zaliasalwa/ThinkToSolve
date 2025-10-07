import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'widgets/crossword_generator_app.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: LoginPage(
            onLoginSuccess: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CrosswordGeneratorApp(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showRegisterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: RegisterPage(
            onRegisterSuccess: () {
              Navigator.pop(context); // Close the dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Registrasi berhasil! Silakan masuk."),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3bb7a0), Color(0xFF77d9c9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Column(
                  children: [
                    _buildTitleBox("THINK"),
                    const SizedBox(height: 8),
                    _buildTitleBox("TO"),
                    const SizedBox(height: 8),
                    _buildTitleBox("SOLVE"),
                  ],
                ),
                const Spacer(flex: 3),
                Column(
                  children: [
                    _buildAuthButton(
                      context,
                      "masuk",
                      () => _showLoginDialog(context),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    _buildAuthButton(
                      context,
                      "daftar",
                      () => _showRegisterDialog(context),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CrosswordGeneratorApp(),
                          ),
                        );
                      },
                      child: const Text(
                        "masuk sebagai tamu",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildAuthButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white, width: 1.5),
        ),
        elevation: 0,
      ),
      child: Text(text),
    );
  }
}
