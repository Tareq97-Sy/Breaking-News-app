

import 'package:get/get.dart';
import 'package:tareq_khashaneh/models/article_model.dart';

class ArticleDetailsController extends GetxController{

   ArticleModel? article ;
  @override
  void onInit() {
    article = Get.arguments;
    super.onInit();
  }
}