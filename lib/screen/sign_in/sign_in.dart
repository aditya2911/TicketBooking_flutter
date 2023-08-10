import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

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
                  "Let's Sign you in",
                  style: TextStyle(fontSize: 20.sp, letterSpacing: 1.sp),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                      fontSize: 17.sp, color: const Color(0xff6f707c)),
                ),
                Text(
                  "You have been missed",
                  style: TextStyle(
                      fontSize: 17.sp, color: const Color(0xff6f707c)),
                ),
                const Spacer(),

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

                // Sign-In Button
                SizedBox(
                  width: 80.sw,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your sign-in logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF443FF4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),

                // Sign-Up Button
                SizedBox(
                  width: 80.sw,
                  height: 40.h,
                  child: OutlinedButton(
                    onPressed: () {
                      // Add your sign-up navigation logic here
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('Sign Up'),
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
