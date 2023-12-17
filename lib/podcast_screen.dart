import 'package:flutter/material.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 3,
                child: Image.asset(
                  'assets/images/test.png',
                  fit: BoxFit.cover,
                )),
            Expanded(flex: 2, child: Container())
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(33, 255, 255, 255),
            Color.fromARGB(247, 255, 255, 255),
            Color(0xffffffff)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            children: [
              Container(
                width: 260,
                height: 350,
                child: Image.asset('assets/images/test.png'),
              ),
              Text('قهرمانان کتاب'),
              Text(
                  'در این پادکست، ما داستان‌های معروف و شخصیت‌های دوست‌داشتنی کتاب‌های کودکان را معرفی می‌کنیم. از "هری پاتر" گرفته تا "ماتیلدا"، هر قهرمان کتاب داستان جذاب خودش را دارد.'),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.play_arrow),
                  Icon(Icons.play_arrow),
                  Icon(Icons.play_arrow),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
