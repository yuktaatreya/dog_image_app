import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_bloc.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_events.dart';
import 'package:image_app/screens/first_screen/ui_elements/user_video_player.dart';
import 'package:image_app/screens/second_screen/second_screen.dart';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';
class UserImageWidget extends StatefulWidget {
  final UserImage userImage;
  final FirstScreenBloc firstScreenBloc;
  const UserImageWidget({Key? key,required this.userImage,required this.firstScreenBloc}) : super(key: key);

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImageWidget> {
  late String extension;

  @override
  void initState() {
    super.initState();
   extension = path.extension(widget.userImage.url);
  }
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: extension==".mp4"? UserVideoPlayer(userImage: widget.userImage):
            Container(
              height: (MediaQuery.of(context).size.height)/2,
              child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                fadeInDuration: Duration(seconds: 0),
                imageUrl: widget.userImage.url,
                placeholder: (context, _) => Container(color: Colors.grey[300],),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
              onPressed:()async {
                widget.firstScreenBloc.add(SaveUserImage(widget.userImage));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );},
            child: Icon(Icons.arrow_forward_ios),
          ),
        )
      ],
    );
  }
}
