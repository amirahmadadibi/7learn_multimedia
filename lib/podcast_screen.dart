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
        body: SafeArea(
      child: Stack(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 260,
                  height: 350,
                  child: Image.asset('assets/images/test.png'),
                ),
                Text(
                  'قهرمانان کتاب',
                  style: TextStyle(
                      fontFamily: 'vazir',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    'در این پادکست، ما داستان‌های معروف و شخصیت‌های دوست‌داشتنی کتاب‌های کودکان را معرفی می‌کنیم. از "هری پاتر" گرفته تا "ماتیلدا"، هر قهرمان کتاب داستان جذاب خودش را دارد.',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'vazir', fontSize: 16)),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('assets/images/icon_backward.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset('assets/images/icon_play.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset('assets/images/icon_forward.png'),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              left: 20,
              top: 20,
              child: Image.asset('assets/images/icon_back.png'))
        ],
      ),
    ));
  }
}
