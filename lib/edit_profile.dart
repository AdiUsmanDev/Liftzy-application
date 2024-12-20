import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'session.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({Key? key}) : super(key: key);

  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}
class _EditProfilPageState extends State<EditProfilPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _skinTypeController = TextEditingController();
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
  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ubah profile berhasil!'),
        backgroundColor: Colors.green,
      ),
    );
  }

 Future<void> _updateUser(String docId) async {
  final Map<String, dynamic> updatedData = {
    'name': _nameController.text,
    'email': _emailController.text,
    'gender': _genderController.text,
    'birthDate': _birthDateController.text,
    'skinType': _skinTypeController.text,
    'updatedAt': Timestamp.now(),
  };

  try { 
    
    String? docId = await getData('session');
    await FirebaseFirestore.instance.collection('users').doc(docId).update(updatedData);
    Navigator.pop(context, updatedData);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error updating user: ${e.toString()}')),
    );
  }
}


  void _onSave() {
    if (_formKey.currentState!.validate()) {
      _showSuccessMessage();
      
      // Mengirim data kembali ke ProfilePage
    /*  Navigator.pop(context, {
        'name': _nameController.text,
        'email': _emailController.text,
        'gender': _genderController.text,
        'birthDate': _birthDateController.text,
        'skinType': _skinTypeController.text,
      });*/

      _updateUser("ggg");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    _skinTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.purple[100],
      appBar: AppBar(
        backgroundColor:  Colors.purple[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Ubah Profil',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildLabeledTextField(
                  label: 'Nama Pengguna',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Pengguna tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildLabeledTextField(
                  label: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildLabeledTextField(
                  label: 'Jenis Kelamin',
                  controller: _genderController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Kelamin tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildLabeledDateField(
                  label: 'Tanggal Lahir',
                  controller: _birthDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal Lahir tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _buildLabeledTextField(
                  label: 'Jenis Kulit',
                  controller: _skinTypeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Kulit tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[400],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: _onSave,
                      child: const Text(
                        'Simpan',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 234, 235),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledDateField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () => _selectDate(context),
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 233, 234, 235),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
