import 'package:bloc_api_practice/app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../models/UserModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = context.read<AppBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is UserInitialState) {
            return UserInitialUI();
          } else if (state is UserLoadingState) {
            return UserLoadinUI();
          } else if (state is UsersLoadedState) {
            return UsersLoadedUI(state.list);
          } else if (state is UserErrorState) {
            return UserErrorUI();
          } else {
            return Center(child: Text('error'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appBloc.add(FetchUsersEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget UserInitialUI() {
  return Center(
    child: Text('Click to Load Data'),
  );
}

Widget UserLoadinUI() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget UsersLoadedUI(List<UserModel> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            print(list[index].id.toString());
          },
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  list[index].id.toString(),
                ),
              ),
              title: Text(list[index].username.toString()),
            ),
          ),
        ),
      );
    },
  );
}

Widget UserErrorUI() {
  return Container(
    color: Colors.red,
    child: Text('Builder Error '),
  );
}
