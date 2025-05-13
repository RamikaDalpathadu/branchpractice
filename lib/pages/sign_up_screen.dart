import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Text(
              "Create Your Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            buildTextField(
              "Enter your name",
              "Name",
              suffixIcon: SvgPicture.string(userIcon),
            ),
            const SizedBox(height: 16),
            buildTextField(
              "Enter your mobile number",
              "Mobile",
              keyboardType: TextInputType.phone,
              suffixIcon: SvgPicture.string(phoneIcon),
            ),
            const SizedBox(height: 16),
            buildTextField(
              "Enter your email",
              "Email",
              keyboardType: TextInputType.emailAddress,
              suffixIcon: SvgPicture.string(emailIcon),
            ),
            const SizedBox(height: 16),
            buildTextField(
              "Enter your password",
              "Password",
              obscureText: true,
              suffixIcon: SvgPicture.string(lockIcon),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54B0A8),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String hint,
    String label, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(color: Color(0xFF757575)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        suffixIcon:
            suffixIcon != null
                ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(width: 24, height: 24, child: suffixIcon),
                )
                : null,
        border: authOutlineInputBorder,
        enabledBorder: authOutlineInputBorder,
        focusedBorder: authOutlineInputBorder.copyWith(
          borderSide: const BorderSide(color: Color(0xFF54B0A8)),
        ),
      ),
    );
  }
}

final OutlineInputBorder authOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(32),
  borderSide: const BorderSide(color: Colors.grey),
);

/// SVG icons as string constants:
const String userIcon = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M20 21v-2a4 4 0 0 0-3-3.87"></path>
  <path d="M4 21v-2a4 4 0 0 1 3-3.87"></path>
  <circle cx="12" cy="7" r="4"></circle>
</svg>
''';

const String phoneIcon = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M22 16.92V19a2 2 0 0 1-2.18 2A19.79 19.79 0 0 1 3 5.18 2 2 0 0 1 5 3h2.09a2 2 0 0 1 2 1.72 13 13 0 0 0 .57 2.57 2 2 0 0 1-.45 2.11L7.91 10.91a16 16 0 0 0 6.18 6.18l1.51-1.51a2 2 0 0 1 2.11-.45 13 13 0 0 0 2.57.57 2 2 0 0 1 1.72 2z"></path>
</svg>
''';

const String emailIcon = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M22 6L12 13 2 6"></path>
  <rect x="2" y="6" width="20" height="12" rx="2" ry="2"></rect>
</svg>
''';

const String lockIcon = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
  <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
</svg>
''';
