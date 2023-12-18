import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_media/bloc/home_bloc.dart';
import 'package:multi_media/bloc/home_state.dart';
import 'package:multi_media/podcast_screen.dart';
import 'package:multi_media/video_screen.dart';

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
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeDataFeteched) {
                return ListView.builder(
                  itemCount: state.contentList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (state.contentList[index].isVideo) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                    video_url:
                                        state.contentList[index].contentUrl,
                                  )));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PodcastScreen(
                                    contetn: state.contentList[index],
                                  )));
                        }
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.contentList[index].title,
                                      style: TextStyle(
                                          fontFamily: 'vazir',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        state.contentList[index].date,
                                        style: TextStyle(
                                            fontFamily: 'vazir', fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        state.contentList[index].description,
                                        style: TextStyle(
                                            fontFamily: 'vazir', fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.network(
                                      state.contentList[index].thumnailUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Color.fromARGB(125, 0, 0, 0)),
                                  child: (state.contentList[index].isVideo)
                                      ? Image.asset(
                                          'assets/images/icon_mini_video.png')
                                      : Image.asset(
                                          'assets/images/icon_mini_podcast.png'),
                                )
                              ],
                            )
                          ],
                        ),
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
