import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:murgi_care/controller/auth_controller.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.watch<DiseaseProvider>().isEnglish;

    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                auth.isLogin
                    ? (isEnglish ? "Login" : "লগইন")
                    : (isEnglish ? "Register" : "নিবন্ধন"),
              ),
              backgroundColor: Colors.teal,
              elevation: 0,
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal, Colors.grey.shade50],
                  stops: const [0.1, 0.3],
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (!auth.isLogin)
                            _buildImagePicker(context, auth, isEnglish),
                          const SizedBox(height: 20),
                          _buildTextField(
                            auth, // Pass auth here
                            _emailController,
                            isEnglish ? "Email" : "ইমেইল",
                            Icons.email,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            auth, // Pass auth here
                            _passwordController,
                            isEnglish ? "Password" : "পাসওয়ার্ড",
                            Icons.lock,
                            isPassword: true, // Use visibility toggle logic
                          ),

                          if (auth.isLogin)
                            _buildForgotPassword(context, isEnglish),

                          if (!auth.isLogin) ...[
                            const SizedBox(height: 15),
                            _buildTextField(
                              auth, // Pass auth here
                              _nameController,
                              isEnglish ? "Full Name" : "পুরো নাম",
                              Icons.person,
                            ),
                            const SizedBox(height: 15),
                            _buildTextField(
                              auth, // Pass auth here
                              _phoneController,
                              isEnglish ? "Phone" : "ফোন",
                              Icons.phone,
                              type: TextInputType.phone,
                            ),
                            const SizedBox(height: 15),
                            _buildTextField(
                              auth, // Pass auth here
                              _addressController,
                              isEnglish ? "Address" : "ঠিকানা",
                              Icons.home,
                            ),
                            const SizedBox(height: 15),

                            // Row for User Type and Gender
                            Row(
                              children: [
                                Expanded(
                                  child: _buildUserTypeDropdown(
                                    auth,
                                    isEnglish,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildGenderDropdown(auth, isEnglish),
                                ),
                              ],
                            ),
                          ],

                          const SizedBox(height: 30),
                          auth.isLoading
                              ? const CircularProgressIndicator()
                              : _buildSubmitButton(context, auth, isEnglish),

                          TextButton(
                            onPressed: () => auth.toggleAuthMode(),
                            child: Text(
                              auth.isLogin
                                  ? (isEnglish
                                        ? "New here? Register"
                                        : "নতুন? নিবন্ধন করুন")
                                  : (isEnglish
                                        ? "Have an account? Login"
                                        : "অ্যাকাউন্ট আছে? লগইন করুন"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- UI Components ---

  Widget _buildImagePicker(
    BuildContext context,
    AuthProvider auth,
    bool isEnglish,
  ) {
    return GestureDetector(
      onTap: () => _showImageSourceActionSheet(context, auth, isEnglish),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.teal.shade50,
            backgroundImage: auth.selectedImage != null
                ? FileImage(auth.selectedImage!)
                : null,
            child: auth.selectedImage == null
                ? const Icon(Icons.camera_alt, size: 40, color: Colors.teal)
                : null,
          ),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.teal,
            child: Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderDropdown(AuthProvider auth, bool isEnglish) {
    return DropdownButtonFormField<String>(
      value: auth.selectedGender,
      decoration: _inputDeco(isEnglish ? "Gender" : "লিঙ্গ", Icons.people),
      items: [
        'Male',
        'Female',
        'Other',
      ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
      onChanged: (val) => auth.setGender(val!),
    );
  }

  Widget _buildUserTypeDropdown(AuthProvider auth, bool isEnglish) {
    return DropdownButtonFormField<String>(
      value: auth.selectedUserType,
      decoration: _inputDeco(isEnglish ? "Type" : "ধরণ", Icons.work),
      items: [
        'Farmer',
        'Vet',
        'Expert',
        'Other',
      ].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
      onChanged: (val) => auth.setUserType(val!),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    AuthProvider auth,
    bool isEnglish,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            auth.authenticate(
              context: context,
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              name: _nameController.text.trim(),
              phone: _phoneController.text.trim(),
              address: _addressController.text.trim(),
            );
          }
        },
        child: Text(
          auth.isLogin
              ? (isEnglish ? "LOGIN" : "লগইন")
              : (isEnglish ? "REGISTER" : "নিবন্ধন"),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context, bool isEnglish) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Read the email from the controller and send it to the provider
          final email = _emailController.text.trim();
          context.read<AuthProvider>().sendPasswordReset(context, email);
        },
        child: Text(
          isEnglish ? "Forgot Password?" : "পাসওয়ার্ড ভুলে গেছেন?",
          style: const TextStyle(color: Colors.teal),
        ),
      ),
    );
  }

  Widget _buildTextField(
    AuthProvider auth,
    TextEditingController ctrl,
    String label,
    IconData icon, {
    bool isPassword = false,
    TextInputType type = TextInputType.text,
  }) {
    return TextFormField(
      controller: ctrl,
      obscureText: isPassword ? auth.obscurePassword : false,
      keyboardType: type,
      decoration: _inputDeco(
        label,
        icon,
        suffix: isPassword
            ? IconButton(
                icon: Icon(
                  auth.obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.teal,
                ),
                onPressed: () => auth.togglePasswordVisibility(),
              )
            : null,
      ),
      validator: (val) => val!.isEmpty ? "Required" : null,
    );
  }

  InputDecoration _inputDeco(String label, IconData icon, {Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.teal),
      suffixIcon: suffix,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  void _showImageSourceActionSheet(
    BuildContext context,
    AuthProvider auth,
    bool isEnglish,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(isEnglish ? 'Gallery' : 'গ্যালারি'),
              onTap: () {
                Navigator.pop(context);
                auth.pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(isEnglish ? 'Camera' : 'ক্যামেরা'),
              onTap: () {
                Navigator.pop(context);
                auth.pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
}
