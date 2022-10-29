import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getandpost/Cubit/GetApi/get_cubit.dart';
import 'package:getandpost/Cubit/PostApi/post_cubit.dart';
import 'package:getandpost/Model/Model.dart';
import 'package:getandpost/Views/GetApi.dart';

class PostHomePage extends StatefulWidget {
  const PostHomePage({Key key}) : super(key: key);

  @override
  State<PostHomePage> createState() => _PostHomePageState();
}

class _PostHomePageState extends State<PostHomePage> {
  TextEditingController _state = TextEditingController();
  TextEditingController _capital = TextEditingController();
  ModelApi _modelApi = ModelApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _state,
                    decoration: const InputDecoration(
                      hintText: 'Enter State',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _capital,
                    decoration: const InputDecoration(
                      hintText: 'Enter Capital',
                    ),
                  ),
                  SizedBox(height: 20,),
                  BlocListener<PostCubit, PostState>(
                    listener: (context, state) {
                     if(state is PostLoading){
                       return Center(child: CircularProgressIndicator(),);
                     }else if( state is PostLoaded){
                       const snackBar = SnackBar(content: Text('Loaded'));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       Navigator.push(context,MaterialPageRoute(
                         builder: (context) =>
                             BlocProvider<GetCubit>(
                                 create: (context) => GetCubit()..getCubitApi(),
                               child: GetHomePage(),
                               ),));
                     }
                    },
                    child: ElevatedButton(onPressed: () {
                      _modelApi.state = _state.text.trim().toUpperCase();
                      _modelApi.capital = _capital.text.trim().toLowerCase();
                      BlocProvider.of<PostCubit>(context).postCubit(_modelApi);
                    }, child: Text('Send Data')),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
