import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareq_khashaneh/controllers/apple_controller.dart';
import 'package:tareq_khashaneh/controllers/bussines_controller.dart';
import 'package:tareq_khashaneh/controllers/tesla_controller.dart';
import 'package:tareq_khashaneh/controllers/wall_controller.dart';
import 'package:tareq_khashaneh/core/dimesnsions.dart';
import 'package:tareq_khashaneh/core/routes.dart';
import 'package:tareq_khashaneh/models/article_model.dart';
import 'package:tareq_khashaneh/view/widgets/article_card.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<ArticleModel> allArticles;

  final AppleController ac = Get.find();

  final TeslaController tc = Get.find();

  final BussinesController bc = Get.find();

  final WallController wc = Get.find();

  late List<ArticleModel> filterArticles = [];
  @override
  void initState() {
    allArticles = [];
    allArticles.addAll(ac.articles);
    allArticles.addAll(tc.articles);
    allArticles.addAll(bc.articles);
    allArticles.addAll(wc.articles);

    filterArticles = getQuarterFromList(allArticles, 2);
    super.initState();
  }

  List<ArticleModel> getQuarterFromList(
      List<ArticleModel> articles, int quarter) {
    int quarterSize = (articles.length / 4).ceil();

    int startIndex = (quarter - 1) * quarterSize;
    int endIndex = startIndex + quarterSize;
    return filterArticles = articles.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _DiscoverNews(
            allArticles: allArticles,
            search: search,
          ),
          SizedBox(
            height: Dimensions.height250,
            child: ListView.builder(
              itemCount: filterArticles.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.articleDetailsRoute,
                          arguments: filterArticles[index]);
                    },
                    child: ArticleCardHor(article: filterArticles[index]));
              },
            ),
          )
        ],
      ),
    );
  }

  void search(List<ArticleModel> articles) {
    setState(() {
      filterArticles = articles;
    });
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
    required this.allArticles,
    required this.search,
  });
  final List<ArticleModel> allArticles;
  final Function(List<ArticleModel>) search;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Discover",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text("News from all over the world",
              style: Theme.of(context).textTheme.bodySmall),
           SizedBox(
            height: Dimensions.height20,
          ),
          TextFormField(
            onChanged: (value) {
              search(allArticles
                  .where((item) =>
                      item.title!.toLowerCase().contains(value.toLowerCase()))
                  .toList());
            },
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none)),
          ),
           SizedBox(
            height: Dimensions.height10,
          ),
        ],
      ),
    );
  }
}
