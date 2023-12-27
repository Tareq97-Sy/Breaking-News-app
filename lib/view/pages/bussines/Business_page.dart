import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareq_khashaneh/controllers/bussines_controller.dart';
import 'package:tareq_khashaneh/core/dimesnsions.dart';
import 'package:tareq_khashaneh/core/routes.dart';
import 'package:tareq_khashaneh/models/article_model.dart';
import 'package:tareq_khashaneh/view/widgets/custome_tag.dart';
import 'package:tareq_khashaneh/view/widgets/image_container.dart';

import '../../widgets/article_card.dart';

class BusinessPage extends StatelessWidget {
  BusinessPage({super.key});

  final BussinesController bc = Get.put(BussinesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        extendBodyBehindAppBar: false,
        body: Obx(
          () => bc.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(children: [
                  _NewsOfTheDay(
                    aricle: bc.articles.elementAt(0),
                  ),
                  _BreakingNews(
                    articles: bc.articles,
                  )
                ]),
        ));
  }
}

class _BreakingNews extends StatelessWidget {
  _BreakingNews({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Breaking News",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
              Text("More", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          SizedBox(
              height: Dimensions.height250,
              child: Obx(
                () => articles.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                      // separatorBuilder: ()=> S,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.articleDetailsRoute,
                                  arguments: articles[index]);
                            },
                            child: ArticleCardHor(article: articles[index]),
                          );
                        }),
              ))
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    super.key,
    required this.aricle,
  });
  final ArticleModel aricle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ImageContainer(
        height: Get.height * 0.6,
        width: double.infinity,
        padding: EdgeInsets.all(Dimensions.height20),
        imageUrl: aricle.urlToImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeTag(backgroundColor: Colors.grey.withAlpha(150), children: [
              Text(
                "News of the Day",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              )
            ]),
             SizedBox(
              height: Dimensions.height10,
            ),
            Text(aricle.title ?? '',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.25)),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Row(
                  children: [
                    Text(
                      "Learn More",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                )),
             SizedBox(
              width: Dimensions.width10,
            ),
            const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
