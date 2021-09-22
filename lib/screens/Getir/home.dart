import 'package:flutter/material.dart';
import 'package:getir_clone/screens/custome_widgets/bottom_bar.dart';
import 'package:getir_clone/screens/custome_widgets/widgets.dart';
import 'package:getir_clone/screens/Getir/widgets/widgets.dart';
import 'package:getir_clone/utilities/colors.dart';
import 'package:getir_clone/utilities/sizes.dart';
import 'widgets/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: CustomColors.white2,

        appBar: CustomAppBar(context: context, text:'getir'),
        body: ListView(children: [
          const AddressBar(),
          Image.network(
            'https://cdn.getir.com/misc/611e4a50c270af509cd486b5_banner_en_1629375136600.jpeg',
          ),

          const MainCategories(),
          Padding(
            padding:  EdgeInsets.all(CustomSizes.padding5),
            child: const CategoriesList(),
          ),
        ]),
    bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),);
  }

}


