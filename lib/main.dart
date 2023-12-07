import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFFF5F5F5),
          appBar: AppBar(
            toolbarHeight: 86,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Center(
              child: SizedBox(
                height: 36,
                width: 148,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('asdfasdfasd'),
                          Text('asdfasdfasd'),
                          Text('asdfasdfasd'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 150,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
