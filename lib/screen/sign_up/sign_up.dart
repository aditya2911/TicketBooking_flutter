import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_booking/services/auth/sign_up_user.dart';

class SignUp extends ConsumerWidget {
  SignUp({super.key});

  final _formKey = GlobalKey<FormState>(); // Create a GlobalKey for the Form
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: 100.sw,
          height: 100.sh,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // Wrap the content with Form widget
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(fontSize: 20.sp, letterSpacing: 1.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Spacer(),

                  TextFormField(
                    controller: _firstNameController,
                    // First Name Text Field
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  TextFormField(
                    controller: _lastNameController,
                    // Last Name Text Field
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter your last name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  TextFormField(
                    // Email Text Field
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add email validation logic if needed
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  TextFormField(
                    controller: _passwordController,
                    // Password Text Field
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      // Add password validation logic if needed
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  // Sign-Up Button
                  SizedBox(
                    width: 80.sw,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, perform sign-up
                          String firstname = _firstNameController.text;
                          String lastname = _lastNameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          SignUpUser()
                              .signUpUser(firstname, lastname, email, password);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF443FF4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
