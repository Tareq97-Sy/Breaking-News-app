import 'package:get/get.dart';
import 'package:tareq_khashaneh/data/api.dart';
import 'package:tareq_khashaneh/models/article_model.dart';
import 'package:dio/dio.dart' as dio;

class BussinesController extends GetxController {
  RxList<ArticleModel> articles = RxList([]);
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
 void fetchData()async{
    isLoading = true;
    _fetchData();
  }
  void _fetchData() async {
    dio.Dio dioo = dio.Dio();
    try {
      dio.Response response = await dioo.get("${Api.apiUrl}/top-headlines", queryParameters: {
      "country" :"us",
      "category": "business",
      "apiKey" : Api.apiKey
      });
      List<ArticleModel> temp = [];
      if(response.statusCode == 200 && response.data['status'] == "ok")
      {
        print("articles ${response.data}");
        List<dynamic> articlesJson = response.data['articles'];
        for(var aj in articlesJson)
        {
          temp.add(ArticleModel.fromJson(aj));
        }
        articles = temp.obs;
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        print("data ${e.response!.data}");
        print("headers ${e.response!.headers}");
        print("requestOptions ${e.response!.requestOptions}");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print("requestOptions ${e.requestOptions}");
        print("error message ${e.message}");
      }
    }
    isLoading = false;
  }
  
  final RxBool _isLaoding  = RxBool(false);
  set isLoading(bool isLoading) => _isLaoding.value = isLoading;
  bool get isLoading => _isLaoding.value; 
}
