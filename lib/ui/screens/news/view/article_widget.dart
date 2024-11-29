import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/article_entity.dart';

class ArticleWidget extends StatefulWidget {
  final ArticleEntity article;
  const ArticleWidget({super.key,required this.article});

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
          CachedNetworkImage(imageUrl: widget.article.urlToImage!,placeholder: (context, url) => CircularProgressIndicator(),),
          Text(widget.article.source!.name!,style: theme.textTheme.displaySmall,),
          Text(widget.article.title!,style: theme.textTheme.titleLarge!.copyWith(fontSize: 14))
        ],
      ),
    );
  }
}
