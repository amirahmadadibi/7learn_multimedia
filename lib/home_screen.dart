import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_media/bloc/home_bloc.dart';
import 'package:multi_media/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return CircularProgressIndicator();
              }
              if (state is HomeDataFeteched) {
                return ListView.builder(
                  itemCount: state.contentList.length,
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
                                Text(
                                  state.contentList[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  state.contentList[index].date,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  state.contentList[index].description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
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
                            child: Image.network(
                              state.contentList[index].thumnailUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return Text('خطا');
            },
          )),
    );
  }
}
