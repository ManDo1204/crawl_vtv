import 'package:flutter/material.dart';
import 'package:vtv_new/home/home.model.dart';
import 'package:html/parser.dart';

class NewDetailArgument {
  final VTVNew vtv_new;

  NewDetailArgument({required this.vtv_new});
}

class VTVNewDetailScreen extends StatefulWidget {
  const VTVNewDetailScreen({super.key});

  static const String routeName = '/detail';

  @override
  State<VTVNewDetailScreen> createState() => _VTVNewDetailScreenState();
}

class _VTVNewDetailScreenState extends State<VTVNewDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as NewDetailArgument;

    var content = _parseHtmlString(arg.vtv_new.content);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Text(
              arg.vtv_new.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('Author: ${arg.vtv_new.author}'),
            ),
            Text(arg.vtv_new.scraped_time),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: arg.vtv_new.avatar != ''
                  ? Image.network(arg.vtv_new.avatar)
                  : const Text(
                      "No image",
                      style: TextStyle(fontSize: 20),
                    ),
            ),
            Text(arg.vtv_new.sapo),
            const SizedBox(
              height: 30,
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
          ],
        ),
      ),
    ));
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
