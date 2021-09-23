import 'package:flutter/material.dart';
import 'package:getir_clone/models/meal.dart';
import 'package:getir_clone/screens/custome_widgets/texts.dart';
import 'package:getir_clone/screens/custome_widgets/widgets.dart';
import 'package:getir_clone/screens/GetirFood/meal/widgets/widgets.dart';
import 'package:getir_clone/screens/GetirFood/resturant_details/widgets/widgets.dart';
import 'package:getir_clone/utilities/colors.dart';
import 'package:getir_clone/utilities/sizes.dart';
import 'widgets/image_viewer.dart';

class Meal extends StatefulWidget {
  const Meal({Key? key}) : super(key: key);

  @override
  State<Meal> createState() => _MealState();
}
enum SingingCharacter { lafayette, jefferson }
class _MealState extends State<Meal> {
  int mealsNumber = 0;
  int _site = 0 ;
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white1,
      appBar: CustomAppBarWithIcons(context:context,text:'getirfood',widget:
      const BasketCard(value: 200,fromWhichPage: 0)),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: CustomSizes.height6),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ImageViewer()),
                    );
                  },
                  child: Image.network(
                      "https://cdn.getiryemek.com/cuisines/1619220348726_480x300.jpeg",height: getScreenHeight()/2,
                  fit:BoxFit.fill),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.all(CustomSizes.padding5),
                    child:  MealDetails(meal: mealList[0]),
                  ),
                ),
                /// MEALS DETAILS
                SizedBox(height: CustomSizes.verticalSpace),


                SizedBox(height: CustomSizes.verticalSpace*2),

                MealChoices(site: _site,header:'Ekstra Nakzeme Terchi',widget:Column(
                    children:[

                      RadioBox(text: 'Ekstra CheddarPeynir',groupValue: _site,value1: 1),
                      RadioBox(text: 'Pastırma',groupValue: _site,value1: 2)

                    ]
                )),
                SizedBox(height: CustomSizes.verticalSpace*2),
                MealChoices(site: _site,header:'Ekstra Nakzeme Terchi',widget:Column(
                    children:[

                      RadioBox(text: 'Ekstra CheddarPeynir',groupValue: _site,value1: 1),
                      RadioBox(text: 'Pastırma',groupValue: _site,value1: 2)

                    ]
                )),
                SizedBox(height: CustomSizes.verticalSpace*2),

                MealChoices(site: _site,header:'Ekstra Nakzeme Terchi',widget:Column(
                    children:[

                      RadioBox(text: 'Ekstra CheddarPeynir',groupValue: _site,value1: 1),
                      RadioBox(text: 'Pastırma',groupValue: _site,value1: 2)

                    ]
                )),
                SizedBox(height: CustomSizes.verticalSpace*3),
                Padding(
                  padding: EdgeInsets.all(CustomSizes.padding5),
                  child: CustomText(
                    text: "If you want to add a note : ",
                    fontSize: CustomSizes.header5,
                    color: CustomColors.black.withOpacity(0.5),
                    isCenter: false,
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Add a note ',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: CustomSizes.height8 * 1.5,
                          horizontal: CustomSizes.height8),
                    ),
                  ),
                ),
                /// ADDING NOTE
                SizedBox(height: CustomSizes.verticalSpace),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ContainerIcon(
                      whichBox: 1,
                      widget: Icon(
                        Icons.minimize_sharp,
                        color: CustomColors.primary,
                        size: CustomSizes.iconSize,
                      ),
                      function: () {
                        setState(() {
                          mealsNumber > 0 ? mealsNumber-- : mealsNumber;
                        });
                      }),
                  ContainerIcon(
                      whichBox: 3,
                      isRounded: true,
                      color: CustomColors.primary,
                      widget: CustomText(
                        text: ' ${mealsNumber} ',
                        color: CustomColors.white,
                        fontSize: CustomSizes.header4,
                        fontWeight: FontWeight.bold,
                      ),
                      function: () {}),
                  ContainerIcon(
                      whichBox: 2,
                      widget: Icon(Icons.add,
                          color: CustomColors.primary,
                          size: CustomSizes.iconSize),
                      function: () {
                        setState(() {
                          mealsNumber = mealsNumber + 1;
                        });
                      }),
                ]),

                SizedBox(height:CustomSizes.height6/4)
              ],
            ),
          ),

          /// MEALS COUNT
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,

              child: SizedBox(
                height: CustomSizes.height6,
                child: Padding(
                  padding: EdgeInsets.all(CustomSizes.padding5),
                  child: Row(children: [
                    Expanded(
                      flex: 7,
                      child: ContainerIcon(
                          whichBox: 1,
                          isRounded: true,
                          color: CustomColors.primary,
                          widget: CustomText(
                            text: 'Add To Basket',
                            color: CustomColors.white,
                            fontSize: CustomSizes.header4,
                            fontWeight: FontWeight.bold,
                          ),
                          function: () {}),
                    ),
                    Expanded(
                      flex: 4,
                      child: ContainerIcon(
                          whichBox: 2,
                          isRounded: true,
                          color: CustomColors.white,
                          widget: CustomText(
                            text: '₺ 420,00',
                            color: CustomColors.primary,
                            fontSize: CustomSizes.header3,
                            fontWeight: FontWeight.bold,
                          ),
                          function: () {}),
                    ),
                  ]),
                ),
              ),
            ),
          )
          /// ADD TO BASKET
        ],
      ),
    );
  }
}


class MealChoices extends StatelessWidget {
  const MealChoices({
    Key? key,
    required int site, required this.header,required this.widget,
  }) : _site = site, super(key: key);

  final int _site;
  final String header ;
  final Widget widget ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left:CustomSizes.padding2),
          child: CustomText(text:header,color: CustomColors.black.withOpacity(0.5),fontSize:CustomSizes.header5,isCenter:false),
        ),
        SizedBox(height: CustomSizes.verticalSpace),

        Card(
            margin: EdgeInsets.zero,

            child:widget
        ),
      ],
    );
  }
}

class RadioBox extends StatefulWidget {
   RadioBox({Key? key,required this.text, required this.groupValue,required this.value1}) : super(key: key);

   final String text ;
   int groupValue;
    int value1;

  @override
  State<RadioBox> createState() => _RadioBoxState();
}

class _RadioBoxState extends State<RadioBox> {
  @override
  Widget build(BuildContext context) {
    return  Row(
     children:[
       Radio<int>(
         value: widget.value1,
         groupValue: widget.groupValue,
         onChanged: (int? value) {
           setState(() {
             widget.groupValue = value!;
           });
         },

       ),
       CustomText(text:widget.text,color: CustomColors.black.withOpacity(0.5),fontSize:CustomSizes.header5,isCenter:false),

     ]
    );
  }
}

