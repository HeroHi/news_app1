import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({super.key});

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
          Container(
            child: CachedNetworkImage(imageUrl: 'https://i.ytimg.com/vi/zXPCuYFFl1I/maxresdefault.jpg',),
          ),
          Text("Source",style: theme.textTheme.displaySmall,),
          Text("Title",style: theme.textTheme.titleLarge!.copyWith(fontSize: 14))
        ],
      ),
    );
  }
}
