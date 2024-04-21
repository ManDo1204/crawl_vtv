

import 'package:vtv_new/home/home.model.dart';
import 'package:vtv_new/home/home.service.dart';

class HomeBloc {
  const HomeBloc();

  Future<dynamic> get_new_bloc (String access_token) async {

    HomeService service = HomeService();
    late List<VTVNew> response_data;
    try {
      response_data = await service.get_new_service(access_token);
    } on Exception catch (e) {
      print(e);
      return "Server error!";
    }

    return response_data;
  }
}