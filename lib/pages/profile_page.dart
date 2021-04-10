import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodiu/pages/home_page.dart';
import 'package:foodiu/providers/my_provider.dart';

import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        title: const Text('Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: myProvider.fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data()!;
            return Center(
              child: Column(
                children: [
                  Text('Full Name: ${data['firstName']} ${data['lastName']}'),
                  Text('Email: ${data['email']}'),
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
