import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/customer/presentation/bloc/user_bloc.dart';
import 'package:flutter_assignment/features/customer/presentation/widgets/loader_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';
import '../widgets/my_error_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserBloc userBloc;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        userBloc.add(FetchUsers(offset: userBloc.offset));
      }
    });
  }

  void _onSearchChanged(String query) {
    userBloc.add(SearchUsers(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(hintText: 'Search by name'),
          onChanged: _onSearchChanged,
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return LoaderWidget();
          } else if (state is UserLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(state.userList[index].image),
                  ),
                  title: Text(state.userList[index].fullName),
                  subtitle: Text(state.userList[index].email),
                );
              },
            );
          } else {
            return MyErrorWidget();
          }
        },
      ),
    );
  }
}
