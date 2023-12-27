


import 'package:flutter/material.dart';
import 'package:tareq_khashaneh/models/article_model.dart';
import 'package:tareq_khashaneh/view/widgets/image_container.dart';

class ArticleCardHor extends StatelessWidget {
  const ArticleCardHor({
    super.key,
    required this.article,
  });

  final ArticleModel article;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageContainer(
            width: 80,
            height: 80,
            imageUrl: article.urlToImage,
            margin: EdgeInsets.all(10),
            borderRaduis: 5,
            
            ),
      
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text(
                article .title ?? "no title",
                maxLines: 2,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                        fontWeight: FontWeight.bold,
                       ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Text(
                      "by ${article .author ?? ''}",
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall),
                  Text(
                      article .publishedAt !=
                              null
                          ? "${DateTime.now().difference(DateTime.parse(article .publishedAt!)).inHours} hours ago "
                          : "",
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall),
                  const SizedBox(
                    width: 5,
                  ),
                
                ],
              )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        // Text(
        //     article[index].publishedAt != null
        //         ? "${DateTime.now().difference(DateTime.parse(article[index].publishedAt!)).inHours} hours ago "
        //         : "",
        //     maxLines: 2,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodySmall),
        // const SizedBox(
        //   height: 5,
        // ),
        // Text("by ${article[index].author ?? ''}",
        //     maxLines: 2,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodySmall),
      ],
    );
  }
}
