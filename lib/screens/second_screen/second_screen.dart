import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_bloc.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_events.dart';
import 'package:image_app/screens/second_screen/ui_elements/post_widget.dart';

import 'api/second_screen_api_service.dart';
import 'bloc/second_screen_states.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late SecondScreenBloc _secondScreenBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              _secondScreenBloc.add(FetchPosts());
            },
          )
        ],
      ),
      body:  BlocProvider<SecondScreenBloc>(
        create: (BuildContext context){
          _secondScreenBloc = SecondScreenBloc(SecondScreenApiService());
          _secondScreenBloc.add(FetchPosts());
          return _secondScreenBloc;
        },
        child: BlocConsumer<SecondScreenBloc,SecondScreenState>(
          listener:(context,state){},
          builder: (context,state){
            if(state is PostsFetchSuccessful){
              return ListView.separated(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return PostWidget(post: state.posts[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            }
            else if (state is PostsFetchFailed)
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
