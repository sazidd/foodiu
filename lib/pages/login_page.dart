import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodiu/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserCredential? userCredential;
  bool isLoading = false;
  // final regex = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future loginUser() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void validation() {
    if (_emailController.text.trim().isEmpty ||
        _emailController.text.trim() == '' &&
            _passwordController.text.trim().isEmpty ||
        _passwordController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('all fields are empty'),
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
      loginUser();
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
              if (constraints.maxWidth >= 600) {
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
                  'Log In',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Create a new account? ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Register here',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
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
