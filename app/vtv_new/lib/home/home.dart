import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtv_new/common/auth_token.model.dart';
import 'package:vtv_new/common/list_new_model.dart';
import 'package:vtv_new/home/home.bloc.dart';
import 'package:vtv_new/home/home.model.dart';
import 'package:vtv_new/home/new_widget/new.dart';
import 'package:vtv_new/home/new_widget/new_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String access_token = '';
  HomeBloc home_bloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    access_token = context.read<AuthData>().access;
    load_data();
  }

  List<VTVNew> list_vtv_new = [];
  List<VTVNewWidget> list_vtv_new_widget = [];
  ListVTVNew list_new_provider = ListVTVNew(list_vtv_new: []);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Title(
                title: 'International news',
                color: Colors.blue,
                child: const Text('International news'),
              ),
              automaticallyImplyLeading: false,
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: load_data, child: Text('Refresh')),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: list_vtv_new_widget.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: list_vtv_new_widget[index],
                          onTap: () => {open_detail(list_vtv_new[index])},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ],
              ),
            )));
  }

  Future<void> load_data() async {
    list_vtv_new = await home_bloc.get_new_bloc(access_token);
    list_new_provider.get_data(list_vtv_new);
    parsing_news(list_vtv_new);
  }

  void parsing_news(List<VTVNew> list_new) {
    for (int i = 0; i < list_new.length; i++) {
      list_vtv_new_widget.add(VTVNewWidget(vtv_new: list_new[i]));
    }
    if (mounted) {
      setState(() {});
    }
  }

  void open_detail(VTVNew vtv_new) {
    print('---------Open new: ${vtv_new.title}');

    Navigator.pushNamed(
      context,
      VTVNewDetailScreen.routeName,
      arguments: NewDetailArgument(vtv_new: vtv_new),
    );
  }
}
