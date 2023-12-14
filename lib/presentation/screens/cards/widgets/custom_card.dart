import 'package:card_app/business_logic/cubit/cards_cubit.dart';
import 'package:card_app/constants/Styles.dart';
import 'package:card_app/constants/my_colors.dart';
import 'package:card_app/data/models/cards.dart';
import 'package:card_app/presentation/screens/update_card/update_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class CustomCard extends StatelessWidget {
  final Cards myCard;
  const CustomCard({super.key,required this.myCard});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: height*1/3,
        width: width*1/2.1,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
          begin : Alignment.topCenter,
          end : Alignment.bottomCenter,
          colors : [
              MyColors.myFeathery,
              MyColors.myGrey
      ] 
      ),
      borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomTexts(myCard: myCard, height: height),
          CustomButtons(width: width, height: height,myCardD: myCard,),
          ],
        ),
      ),
    );
  }
}

class CustomTexts extends StatelessWidget {
  const CustomTexts({
    super.key,
    required this.myCard,
    required this.height,
  });

  final Cards myCard;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Text('${myCard.name}',style: Styles.textStyle20,maxLines: 1,overflow: TextOverflow.ellipsis,),
          SizedBox(height: height*.1/3 ,),
          Text('${myCard.email}',style: Styles.textStyle16,maxLines: 2,),
        ],
      ),
    );
  }
}

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.width,
    required this.height,
    required this.myCardD
  });

  final double width;
  final double height;
  final Cards myCardD;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        width: width*.2,
        height: height*.1/2,
        child: MaterialButton(onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: ((context) => UpdateCardScreen(oldCard: myCardD,))));
        },
        child: Text('تعديل',style: Styles.textStyle14,),
        color: MyColors.myFeathery,
        ),
      ),
      SizedBox(width: width*.1/3,),
      Container(
        width: width*.2,
        height: height*.1/2,
        child: MaterialButton(onPressed: (){
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('رسالة تحذير',style: Styles.textStyle18,),
              content: const Text('هل تريد حذف هذه البطاقة بالفعل؟'),
              actions: [
                ElevatedButton(onPressed: (){
                  BlocProvider.of<CardsCubit>(context).emitDeleteCard(myCardD.id!);
                  BlocBuilder<CardsCubit,CardsState>(builder: (context,state){
                    if(state is CardsLoaded)
                      {
                        return const Text('تم الحذف');
                      }else {
                        throw Exception('Failed to delete card');
                      }
                  });
                }, child: const Text('نعم',style: Styles.textStyle14,)),
                ElevatedButton(onPressed: (){
                  GoRouter.of(context).pop();}, child: const Text('لا',style: Styles.textStyle14,)),
              ],
            )
          );
        },
        child: Text('حذف',style: Styles.textStyle14,),
        color: MyColors.myGrey,
        ),
      ),
    ],
  );
}
}