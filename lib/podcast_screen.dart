import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:multi_media/data/content.dart';

class PodcastScreen extends StatefulWidget {
  Content contetn;
  PodcastScreen({required this.contetn, super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  bool isPlaying = false;
  AudioPlayer palyer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    palyer.setUrl(widget.contetn.contentUrl);
  }

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
                  child: Image.network(
                    widget.contetn.thumnailUrl,
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
                  height: 320,
                  child: Image.network(
                    widget.contetn.thumnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    widget.contetn.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: 'vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(widget.contetn.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'vazir', fontSize: 16)),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('assets/images/icon_backward.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (isPlaying) {
                            setState(() {
                              isPlaying = false;
                            });
                            palyer.pause();
                          } else {
                            setState(() {
                              isPlaying = true;
                            });
                            palyer.play();
                          }
                        },
                        child: (isPlaying)
                            ? Image.asset('assets/images/icon_pause.png')
                            : Image.asset('assets/images/icon_play.png')),
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
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/images/icon_back.png')))
        ],
      ),
    ));
  }

  @override
  void dispose() {
    palyer.stop();
    super.dispose();
  }
}
