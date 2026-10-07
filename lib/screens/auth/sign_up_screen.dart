import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? size.width * 0.25 : 30.0,
                  vertical: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'Buat Akun\nBaru!',
                      style: textTheme.displayLarge?.copyWith(
                        fontSize: 36,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      'Daftarkan dirimu dan mulai asah otakmu bersama AsahAsik.',
                      style: textTheme.bodyMedium?.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: size.height * 0.04),

                    CustomTextField(
                      hintText: 'Nama Lengkap',
                      icon: Icons.person_outline_rounded,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      hintText: 'Nama Pengguna',
                      icon: Icons.alternate_email_rounded,
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      hintText: 'Kata Sandi',
                      icon: Icons.lock_outline_rounded,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      hintText: 'Konfirmasi Kata Sandi',
                      icon: Icons.lock_reset_rounded,
                      isPassword: true,
                      controller: _confirmPasswordController,
                    ),
                    SizedBox(height: size.height * 0.04),

                    CustomButton(
                      text: 'Daftar Sekarang',
                      onPressed: () {
                        // TODO: Logika validasi dan pendaftaran
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Akun berhasil dibuat!'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah punya akun? ', style: textTheme.bodyMedium),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Masuk di sini',
                            style: TextStyle(
                              color: AppColors.terracotta,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 16,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.sageGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: AppColors.sageGreen,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
