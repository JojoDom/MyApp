import 'package:get/get.dart';
import 'package:dio/dio.dart' as dioi;
import 'package:my_app/controllers/cat_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DashBoardController extends GetxController {
  final dio = dioi.Dio();
  var isLoading = false.obs;
  var catImage = ''.obs;
  void onInit() async {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    super.onInit();
  }

  getCat() async {
    isLoading(true);
    await dio.get('https://api.thecatapi.com/v1/images/search').then((value) {
      var response = Cat.fromJson(value.data);
      catImage.value = response.url;
      isLoading(false);
    });
  }
}
