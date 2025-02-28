import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task2/Screens/SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  bool isLoading = false;
  bool isObscuredPassword = true;
  bool isObscuredConfirm = true;

  Future<void> signUpFirebase() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signup Successful!"),
          backgroundColor: Color(0xFFC67C4E),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
      );

    } on FirebaseAuthException catch (e) {
      String message = "An error occurred, please try again";
      if (e.code == "email-already-in-use") {
        message = "This email is already registered";
      } else if (e.code == 'weak-password') {
        message = "Password must be at least 6 characters";
      } else if (e.code == 'invalid-email') {
        message = "Enter a valid email address";
      } else if (e.code == 'network-request-failed') {
        message = "Check your internet connection and try again";
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDD6C8),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Coffee Icon.png",
                width: 200,
                height: 150,
                color: Color(0xff313131),
              ),
              SizedBox(height: 20),
              Text(
                "Sign Up",
                style: TextStyle(color: Color(0xff313131), fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Email Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Color(0xFFC67C4E)),
                          labelText: "Enter Your Email",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFC67C4E), width: 2.5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter an email";
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return "Enter a valid email";
                          return null;
                        },
                      ),
                    ),

                    // Password Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                      child: TextFormField(
                        obscureText: isObscuredPassword,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Color(0xFFC67C4E)),
                          labelText: "Enter the Password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFC67C4E), width: 2.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscuredPassword ? Icons.visibility_off : Icons.visibility,
                              color: Color(0xFFC67C4E),
                            ),
                            onPressed: () {
                              setState(() => isObscuredPassword = !isObscuredPassword);
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter your password";
                          if (value.length < 8) return "Password must be at least 8 characters";
                          if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                              .hasMatch(value)) {
                            return "Include uppercase, lowercase, number & special character";
                          }
                          return null;
                        },
                      ),
                    ),

                    // Confirm Password Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: TextFormField(
                        obscureText: isObscuredConfirm,
                        controller: passwordConfirmController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Color(0xFFC67C4E)),
                          labelText: "Confirm the Password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFC67C4E), width: 2.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscuredConfirm ? Icons.visibility_off : Icons.visibility,
                              color: Color(0xFFC67C4E),
                            ),
                            onPressed: () {
                              setState(() => isObscuredConfirm = !isObscuredConfirm);
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Confirm your password";
                          if (value != passwordController.text) return "Passwords do not match";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already registered? ", style: TextStyle(color: Color(0xff313131))),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    ),
                    child: Text("Sign in", style: TextStyle(color: Color(0xFFC67C4E))),
                  ),
                ],
              ),

              isLoading
                  ? CircularProgressIndicator(color: Color(0xFFC67C4E))
                  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC67C4E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: signUpFirebase,
                  child: Text("Sign Up", style: TextStyle(color: Color(0xff313131))),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
