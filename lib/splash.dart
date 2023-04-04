import 'dart:async';

import 'package:article_pilar_teknologi/main.dart';
import 'package:article_pilar_teknologi/pages/register_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return const RegisterPage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Article'),
      ),
    );
  }
}
