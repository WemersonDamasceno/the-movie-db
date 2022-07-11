import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/tmdb_logo.JPEG',
          height: 80,
        ),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
