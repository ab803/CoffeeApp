import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task2/Screens/HomeScreen.dart';
import 'package:task2/Screens/SignUp.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isObscure = true;

  Future<void> signInFirebase() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signin Successful!"),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Color(0xFFC67C4E),
          elevation: 6.0,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

    } on FirebaseAuthException catch (e) {
      String message = "An error occurred";
      if (e.code == 'user-not-found') {
        message = "No user found with this email";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password";
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
                "Sign in",
                style: TextStyle(
                  color: Color(0xff313131),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
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
                          labelStyle: TextStyle(color: Color(0xFFC67C4E)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFC67C4E), width: 2),
                          ),
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
                        obscureText: isObscure,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password, color: Color(0xFFC67C4E)),
                          labelText: "Enter the Password",
                          labelStyle: TextStyle(color: Color(0xff313131)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff313131), width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFC67C4E), width: 2.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure ? Icons.visibility_off : Icons.visibility,
                              color: Color(0xFFC67C4E),
                            ),
                            onPressed: () {
                              setState(() => isObscure = !isObscure);
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) return "Password must be at least 6 characters";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Sign Up Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you are not registered! ", style: TextStyle(color: Color(0xff313131))),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    ),
                    child: Text("Sign up ", style: TextStyle(color: Color(0xFFC67C4E))),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Sign In Button
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
                  onPressed: signInFirebase,
                  child: Text("Sign in", style: TextStyle(color: Color(0xff313131))),
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
