import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemTab;
  const CustomDrawer({super.key,required this.onItemTab});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24),
            height: MediaQuery.sizeOf(context).height * 0.18,
            color: AppColors.primary,
            child: Center(
              child: Text(
                "News App!",
                style: theme.textTheme.titleLarge!
                    .copyWith(color: AppColors.white),
              ),
            ),
          ),
          _buildDrawerListItem(Icons.list,"Categories",0,context,theme),
          const SizedBox(height: 10,),
          _buildDrawerListItem(Icons.settings, "Settings",1,context,theme)
        ],
      ),
    );
  }
  Widget _buildDrawerListItem(IconData icon,String text,int tabIndex,BuildContext context,ThemeData theme) {
    return InkWell(
      onTap: (){
        onItemTab(tabIndex);
      },
      child: Row(
        children: [
          Icon(icon,size: 40,),
          Text(text,style: theme.textTheme.titleLarge!.copyWith(color: AppColors.drawerItemColor),)
        ],
      ),
    );
  }
}
