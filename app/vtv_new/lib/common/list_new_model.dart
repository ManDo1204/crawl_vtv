
import 'package:vtv_new/home/home.model.dart';

class ListVTVNew {

  List<VTVNew> list_vtv_new;

  ListVTVNew({required this.list_vtv_new});

  void get_data(List<VTVNew> list_new){
    list_vtv_new = list_new;
  }
}