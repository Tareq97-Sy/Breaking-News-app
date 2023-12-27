import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tareq_khashaneh/controllers/article_details_controller.dart';
import 'package:tareq_khashaneh/core/dimesnsions.dart';
import 'package:tareq_khashaneh/models/article_model.dart';
import 'package:tareq_khashaneh/view/widgets/app_bar.dart';
import 'package:tareq_khashaneh/view/widgets/image_container.dart';

import '../widgets/custome_tag.dart';

class ArticleDetailsPage extends StatelessWidget {
  ArticleDetailsPage({super.key});
  final ArticleDetailsController adc = Get.put(ArticleDetailsController());
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      imageUrl: adc.article!.urlToImage,
      width: double.infinity,
      height: Get.height,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(appBar: AppBar()),
        body: ListView(
          children: [
            adc.article != null
                ? _NewsHeadLine(
                    article: adc.article!,
                  )
                : Center(
                    child: Text("Error in Navigation"),
                  ),
            Container(
              height: Get.height * 0.5,
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CustomeTag(
                            backgroundColor: Colors.black.withAlpha(150),
                            children: [
                              const CircleAvatar(
                                  radius: 10,
                                  backgroundImage:
                                      AssetImage("assets/images/profile.png")),
                               SizedBox(
                                width: Dimensions.width7,
                              ),
                              Expanded(
                                child: Text("${adc.article!.author ?? ''}",
                                    maxLines: 2,
                                    
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white))
                              ),
                            ]),
                      ),
                       SizedBox(width: Dimensions.width10,),
                      Expanded(
                        child: CustomeTag(
                            backgroundColor: Colors.grey.shade200,
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.grey,
                              ),
                              Text(
                                  adc.article!.publishedAt != null
                                      ? "${DateTime.now().difference(DateTime.parse(adc.article!.publishedAt!)).inHours} hours ago "
                                      : "",
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ]),
                      )
                    ],
                  ),
                   SizedBox(height: Dimensions.height20,),
                  Text(
                    adc.article!.title ?? '',
                     style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                     )
                  ),
                   SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: Text(
                      adc.article!.content ?? '',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.5,
                       )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NewsHeadLine extends StatelessWidget {
  const _NewsHeadLine({
    super.key,
    required this.article,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(Dimensions.height20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.15,
          ),
          CustomeTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Expanded(
              child: Text(
                article.name ?? 'article name',
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            )
          ]),
           SizedBox(
            height: Dimensions.height10,
          ),
          Text(
            article.title ?? '',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(
                      color: Colors.white,
                      backgroundColor: Colors.grey[500]),
          ),
          Text(
            article.description ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
                      color: Colors.white,
                      backgroundColor: Colors.grey[500]),
          )
        ],
      ),
    );
  }
}
