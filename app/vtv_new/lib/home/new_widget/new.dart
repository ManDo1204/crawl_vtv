import 'package:flutter/material.dart';
import 'package:vtv_new/home/home.model.dart';

class VTVNewWidget extends StatefulWidget {

  final VTVNew vtv_new;
  const VTVNewWidget({super.key, required this.vtv_new});

  @override
  State<VTVNewWidget> createState() => _VTVNewWidgetState();
}

class _VTVNewWidgetState extends State<VTVNewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(widget.vtv_new.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: widget.vtv_new.avatar != '' ? Image.network(widget.vtv_new.avatar) : Text("No image", style: TextStyle(fontSize: 20),),
          ),

          Container(
            child: Text(widget.vtv_new.sapo),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text('Author: ${widget.vtv_new.author}'),
          ),

          Container(
            child: Text(widget.vtv_new.scraped_time),
          ),
          
        ],
      ),
    );
  }
}