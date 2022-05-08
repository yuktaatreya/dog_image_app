import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/screens/first_screen/api/first_screen_api_service.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_bloc.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_events.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_states.dart';
import 'package:image_app/screens/first_screen/ui_elements/user_image_widget.dart';
import 'package:image_app/screens/second_screen/second_screen.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late FirstScreenBloc _firstScreenBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dogs"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              _firstScreenBloc.add(FetchUserImage());
            },
          )
        ],
      ),
      body: BlocProvider<FirstScreenBloc>(
        create: (BuildContext context){
          _firstScreenBloc = FirstScreenBloc(FirstScreenApiService());
          _firstScreenBloc.add(FetchUserImage());
          return _firstScreenBloc;
        },
        child: BlocConsumer<FirstScreenBloc,FirstScreenState>(
          listener:(context,state){},
          builder: (context,state){
            if(state is ImageFetchSuccessful){
              return UserImageWidget(userImage: state.userImage,firstScreenBloc: _firstScreenBloc,);
            }
            else if (state is ImageFetchFailed)
              return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Some error occurred, please check your internet connection!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontSize: 17),),
                  )
              );
            else return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
