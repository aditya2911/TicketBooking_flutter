import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

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

                // First Name Text Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),

                // Last Name Text Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),

                // Email Text Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),

                // Password Text Field
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.white, // Change this color
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
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
                      // Add your sign-up logic here
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
    );
  }
}
