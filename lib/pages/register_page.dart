import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodiu/models/user_model.dart';
import 'package:foodiu/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late UserCredential userCredential;
  bool isLoading = false;
  // final regex = RegExp(
  // r"^[a-zA-Z0-9.a-zA-Z0-9.#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future registerUser() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            UserModel(
              userId: userCredential.user!.uid,
              firstName: _firstNameController.text.trim(),
              lastName: _lastNameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            ).toMap(),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void validation() {
    if (_firstNameController.text.trim().isEmpty ||
        _firstNameController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('first name is empty'),
        ),
      );
    } else if (_lastNameController.text.trim().isEmpty ||
        _lastNameController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('last name is empty'),
        ),
      );
    } else if (_emailController.text.trim().isEmpty ||
        _emailController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('email is empty'),
        ),
      );
    }

    //  else if (regex.hasMatch(_emailController.text))
    else if (!_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('invalid email'),
        ),
      );
    } else if (_passwordController.text.trim().isEmpty ||
        _passwordController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('password is empty'),
        ),
      );
    } else {
      setState(() {
        isLoading = true;
      });
      registerUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  children: [
                    Expanded(child: FlutterLogo(size: 128)),
                    Expanded(child: _buildContent(context)),
                  ],
                );
              }
              return Column(
                children: [
                  Expanded(child: FlutterLogo(size: 128)),
                  Expanded(child: _buildContent(context)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _firstNameController,
          decoration: InputDecoration(
            hintText: 'Enter your first name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _lastNameController,
          decoration: InputDecoration(
            hintText: 'Enter your last name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          obscureText: true,
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {
                  validation();
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Login here',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
