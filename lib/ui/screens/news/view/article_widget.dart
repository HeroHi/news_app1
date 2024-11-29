import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app1/generated/assets.dart';

import '../../../../domain/entities/article_entity.dart';

class ArticleWidget extends StatefulWidget {
  final ArticleEntity article;
  final String _defaultImageUrl =
      "https://c8.alamy.com/comp/PR1RFW/news-logo-illustration-PR1RFW.jpg";
  const ArticleWidget({super.key, required this.article});

  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
              imageUrl: widget.article.urlToImage ?? widget._defaultImageUrl,
              placeholder: (context, url) =>
                  Center(child: Image.asset(Assets.imagesLogo)),
              errorWidget: (context, url, error) => Center(
                    child: Image.asset(Assets.imagesLogo),
                  )),
          Text(
            widget.article.source!.name!,
            style: theme.textTheme.displaySmall,
          ),
          Text(widget.article.title!,
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 14))
        ],
      ),
    );
  }
}
