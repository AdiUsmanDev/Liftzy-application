import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert'; 
import 'package:crypto/crypto.dart'; 


class MendaftarPage extends StatefulWidget {
  const MendaftarPage({super.key});

  @override
  _MendaftarPageState createState() => _MendaftarPageState();
}

class _MendaftarPageState extends State<MendaftarPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      _birthDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }


  Widget _buildTextFieldContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, bool isGenderField = false}) {
    return _buildTextFieldContainer(
      child: TextFormField(
        controller: controller,
        readOnly: isGenderField,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: isGenderField ? Icon(Icons.qr_code_scanner, color: Colors.grey) : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDateField() {
    return _buildTextFieldContainer(
      child: TextFormField(
        controller: _birthDateController,
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          hintText: 'Tanggal Lahir',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isPasswordVisible,
    required VoidCallback onIconPressed,
  }) {
    return _buildTextFieldContainer(
      child: TextFormField(
        controller: controller,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: onIconPressed,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan $label';
          }
          if (value.length < 8) {
            return '$label minimal 8 karakter';
          }
          return null;
        },
      ),
    );
  }
 Future<void> _daftar() async {
        final pass = md5.convert(utf8.encode(_passwordController.text)).toString();
        String docId = _emailController.text;
      await FirebaseFirestore.instance.collection('users').doc(docId).set({
                    'name': _nameController.text,
                    'email': _emailController.text,
                    'gender': _genderController.text,
                    'birthDate': _birthDateController.text,
                    'password': pass,
                    'skinType':"Kulit Normal",
                    'createdAt': Timestamp.now(),
                  });
  }

  // Modifikasi bagian _buildRegisterButton
  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  if (!_emailController.text.contains('@')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Email harus mengandung "@"'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  if (_passwordController.text != _confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Kata sandi tidak sama'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  setState(() {
                    _isLoading = true;
                  });
                  _daftar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Akun berhasil terdaftar'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      _isLoading = false;
                    });
                    // Navigasi ke halaman /login setelah selesai
                    Navigator.pushReplacementNamed(context, '/login');
                  });
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 143, 78, 155),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                "Daftar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildTextField(controller: _nameController, label: 'Nama Pengguna'),
                  const SizedBox(height: 16),
                  _buildTextField(controller: _emailController, label: 'Email'),
                  const SizedBox(height: 16),
                  _buildTextField(controller: _genderController, label: 'Jenis Kelamin'),
                  const SizedBox(height: 16),
                  _buildDateField(),
                  const SizedBox(height: 16),
                  _buildPasswordField(
                    controller: _passwordController,
                    label: 'Kata Sandi',
                    isPasswordVisible: _isPasswordVisible,
                    onIconPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildPasswordField(
                    controller: _confirmPasswordController,
                    label: 'Konfirmasi Kata Sandi',
                    isPasswordVisible: _isConfirmPasswordVisible,
                    onIconPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  _buildRegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
