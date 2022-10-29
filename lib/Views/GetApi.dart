import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getandpost/Cubit/GetApi/get_cubit.dart';

class GetHomePage extends StatefulWidget {
  const GetHomePage({Key key}) : super(key: key);

  @override
  State<GetHomePage> createState() => _GetHomePageState();
}

class _GetHomePageState extends State<GetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: RefreshIndicator(
          displacement: 100,
          onRefresh: ()async{
            BlocProvider.of<GetCubit>(context).getCubitApi();

          },
          child: BlocBuilder<GetCubit,GetState>(
            builder: (context, state) {
              if (state is GetLoaded) {
                var data = state.getModelAPi;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(data[index].state.toString()),
                        subtitle: Text(data[index].capital.toString()),
                      ),
                    );
                  },
                );
              }else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ));
  }
}