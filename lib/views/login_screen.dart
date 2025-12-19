import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.business, size: 100, color: Color(0xFF1E88E5)),
              ),
              const SizedBox(height: 16),
              const Text(
                'SCUBE',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 48),
              CustomTextField(
                controller: controller.usernameController,
                hintText: 'Username',
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),
              Obx(() => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                isPasswordVisible: controller.isPasswordVisible.value,
                onTogglePassword: controller.togglePasswordVisibility,
              )),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Login',
                onPressed: controller.login,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Register Now'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}