import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_online_c4/home/radio/data_response.dart';
import 'package:islami_online_c4/home/radio/radio_item.dart';
import 'package:islami_online_c4/main.dart';
import 'package:islami_online_c4/model/radio_response.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  Future<RadioResponse>? radioResponse;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    radioResponse = DataResponse.fetchRadio();
    audioPlayer = AudioPlayer();
  }

  play(String url) async {
    await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: FutureBuilder<RadioResponse>(
        future: radioResponse,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Image.asset(
                  'assets/images/radio_image.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * .3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: double.infinity,
                  child: PageView.builder(
                      itemCount: snapshot.data?.radios!.length ?? 0,
                      itemBuilder: (context, index) {
                        return RadioItem(
                          item: snapshot.data!.radios![index],
                          pause: pause,
                          play: play,
                        );
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: IconButton(
                onPressed: () {
                  radioResponse = DataResponse.fetchRadio();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: MyThemeData.primaryColor,
                  size: 40,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: MyThemeData.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
