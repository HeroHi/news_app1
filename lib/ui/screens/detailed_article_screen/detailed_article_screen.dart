import 'package:flutter/material.dart';
import 'package:news_app1/domain/entities/article_entity.dart';
import 'package:news_app1/ui/screens/news/view/article_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/consts/app_colors.dart';

class DetailedArticleScreen extends StatelessWidget {
  static String routeName = "DetailedArticle";
  const DetailedArticleScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    ArticleEntity article = ModalRoute.of(context)!.settings.arguments as ArticleEntity;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: Text("News Title",style: theme.textTheme.titleLarge!.copyWith(color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ArticleWidget(article: article),
            Expanded(child: Text(article.content??article.title??"some random content",style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),)),
            Spacer(),
            Text("View Full Article",style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),textAlign: TextAlign.end,),
            InkWell(
              onTap: () {
                final Uri url = Uri.parse(article.url!);
                _launchUrl(url);
              },
              child: Container(
                alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_right,color: AppColors.grey,)),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
