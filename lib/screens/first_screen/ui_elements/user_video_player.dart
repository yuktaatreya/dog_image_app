import 'package:flutter/material.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:video_player/video_player.dart';
class UserVideoPlayer extends StatefulWidget {
  final UserImage userImage;
  const UserVideoPlayer({Key? key,required this.userImage}) : super(key: key);

  @override
  _UserVideoPlayerState createState() => _UserVideoPlayerState();
}

class _UserVideoPlayerState extends State<UserVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;
  IconData videoIcon=Icons.pause;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    print(widget.userImage.url);
      _videoPlayerController =
      VideoPlayerController.network(widget.userImage.url);
      _initializeVideoPlayerFuture = _videoPlayerController.initialize();
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),),
              Positioned(
                child: IconButton(onPressed:changeVideoIcon,
                  icon: Icon(videoIcon,color: Colors.white,),),
              )],);
        } else {
          return Center(
            child: Container(
              height: (MediaQuery.of(context).size.height)/2,
              color: Colors.grey[300],),
          );
        }
      },
    );
  }

  // void checkVideoEnd(){
  //   if(_videoPlayerController.value.position == _videoPlayerController.value.duration) {
  //     setState(() {
  //       _videoPlayerController.pause();
  //       videoIcon=Icons.play_arrow;
  //     });
  //   }
  // }
  void changeVideoIcon(){
    setState(() {
      if(_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        videoIcon=Icons.play_arrow;
      }
      else {
        _videoPlayerController.play();
        videoIcon=Icons.pause;
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
