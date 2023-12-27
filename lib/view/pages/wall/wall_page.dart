import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareq_khashaneh/controllers/wall_controller.dart';
import 'package:tareq_khashaneh/core/routes.dart';
import 'package:tareq_khashaneh/models/article_model.dart';
import 'package:tareq_khashaneh/view/widgets/custome_tag.dart';
import 'package:tareq_khashaneh/view/widgets/image_container.dart';

class WallPage extends StatelessWidget {
   WallPage({super.key});

  final WallController wallc = Get.put(WallController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: false,
      body: 
        Obx(
          () => wallc.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(children: [
                  _NewsOfTheDay(
                    aricle: wallc.articles.elementAt(1),
                  ),
                  _BreakingNews(
                    articles: wallc.articles,
                  )
                ]),
        )
    );
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
            height: 20,
          ),
          SizedBox(
            height: 250,
            child:   Obx(() =>    articles.isEmpty 
            ? Center(child: CircularProgressIndicator(),) 
            :  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                              Get.toNamed(AppRoutes.articleDetailsRoute,
                                  arguments: articles[index]);
                            },
                    child: Container(
                      width: Get.width * 0.5,
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                              width: Get.width * 0.5,
                              imageUrl: articles[index].urlToImage),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            articles[index].title ?? "no title",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.5,
                                 
                                    ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                             articles[index].publishedAt != null? "${DateTime.now().difference(DateTime.parse(articles[index].publishedAt!)).inHours} hours ago " : "",
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("by ${articles[index].author ?? '' }",
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  );
                }),
             
      )
          )
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
        height: Get.height * 0.5,
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        imageUrl: aricle.urlToImage ,
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
                    .copyWith(color: Colors.black),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(aricle.title ?? '',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                       backgroundColor: Colors.grey[500],
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
                          .copyWith(
                               backgroundColor: Colors.grey[500],
                                    color: Colors.white,),
                          
                    ),
                  ],
                )),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
              shadows: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.white
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
