import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

// 1. Ubah menjadi StatefulWidget
class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Variabel untuk melacak status sembunyi/tampil kata sandi
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Jika widget ini adalah password, maka atur otomatis tertutup (_obscureText = true)
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: widget.controller,
      obscureText: _obscureText, // Menggunakan variabel state
      style: TextStyle(
        color: isDark ? AppColors.cream : AppColors.sageGreen,
        fontWeight: FontWeight.w500, // 2. Bikin tulisan ketikan jadi Medium
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark
            ? AppColors.darkSurface
            : Colors.white.withOpacity(0.6),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: isDark
              ? AppColors.cream.withOpacity(0.5)
              : AppColors.sageGreen.withOpacity(0.5),
          fontWeight: FontWeight.w500, // 3. Bikin tulisan hint jadi Medium juga
        ),
        prefixIcon: Icon(widget.icon, color: AppColors.terracotta),

        // 4. Tambahkan tombol ikon mata khusus untuk form password (suffixIcon)
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: isDark
                      ? AppColors.cream.withOpacity(0.5)
                      : AppColors.sageGreen.withOpacity(0.5),
                ),
                onPressed: () {
                  // Mengubah status hide/unhide saat ditekan
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null, // Jika bukan form password, tidak ada ikon di kanan

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: isDark
                ? Colors.transparent
                : AppColors.sageGreen.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: AppColors.terracotta, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 20.0,
        ),
      ),
    );
  }
}
