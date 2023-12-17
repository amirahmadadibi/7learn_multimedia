import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_media/bloc/home_bloc.dart';
import 'package:multi_media/bloc/home_event.dart';
import 'package:multi_media/home_screen.dart';
import 'package:multi_media/podcast_screen.dart';
import 'package:multi_media/video_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (contect) {
          var bloc = HomeBloc();
          bloc.add(HomeInit());
          return bloc;
        },
        child: HomeScreen(),
      ),
    );
  }
}

