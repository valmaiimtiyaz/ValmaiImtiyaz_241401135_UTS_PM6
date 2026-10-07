import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? size.width * 0.25 : 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.terracotta.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.waving_hand_rounded,
                    size: 40,
                    color: AppColors.terracotta,
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  'Halo, \nSelamat Datang!',
                  style: textTheme.displayLarge?.copyWith(
                    fontSize: 36,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  'Masuk ke akun AsahAsik kamu \nuntuk memulai quiz.',
                  style: textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
                SizedBox(height: size.height * 0.05),

                CustomTextField(
                  hintText: 'Nama Pengguna',
                  icon: Icons.alternate_email_rounded,
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Kata Sandi',
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.terracotta,
                    ),
                    child: const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                CustomButton(
                  text: 'Masuk',
                  onPressed: () {
                    //TODO: implement login
                  },
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun? ', style: textTheme.bodyMedium),
                    GestureDetector(
                      onTap: () {
                        //TODO: implement navigation sign up screen
                      },
                      child: const Text(
                        'Buat akun',
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
      ),
    );
  }
}
