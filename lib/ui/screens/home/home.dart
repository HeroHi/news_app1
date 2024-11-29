import 'package:flutter/material.dart';
import 'package:news_app1/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app1/ui/screens/home/tabs/settings/settings_tab.dart';


import '../../../generated/assets.dart';
import '../../../utils/consts/app_colors.dart';
import '../../widgets/custom_drawer.dart';

class Home extends StatefulWidget {
  static String routeName = "Home";
  int currentTabIndex = 0;
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [
    const CategoriesTab(),
    const SettingsTab(),
  ];
  late ThemeData theme;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(ModalRoute.of(context) != null){
        widget.currentTabIndex = ModalRoute.of(context)!.settings.arguments as int? ?? 0;
      }
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(onItemTab: (index){
        widget.currentTabIndex = index;
        setState(() {});
      }),
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            image: DecorationImage(image: AssetImage(Assets.imagesPattern))),
        child: tabs[widget.currentTabIndex],
      ),
    );
  }


}
