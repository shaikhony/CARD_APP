import 'package:card_app/business_logic/cubit/cards_cubit.dart';
import 'package:card_app/constants/Styles.dart';
import 'package:card_app/constants/app_router.dart';
import 'package:card_app/constants/my_colors.dart';
import 'package:card_app/data/models/cards.dart';
import 'package:card_app/presentation/screens/cards/widgets/custom_body_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  late List<Cards> allCards;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CardsCubit>(context).getAllCards();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<CardsCubit>(context).close();
  }
  Widget buildBlocWidget(){
  return BlocBuilder<CardsCubit,CardsState>(builder: (context,state)
  {
    if(state is CardsLoaded)
    {
      allCards = (state).cards;
      return CustomBodyCards(myCards : allCards);
    }
    else{
          return showLodingIndicatot();
    }
  });
}
Widget showLodingIndicatot()
{
  return const Center(child: CircularProgressIndicator(
    color: MyColors.myFeathery,
  ),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBeige,
      appBar: AppBar(
        title: const Text(
          'البطاقات',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
        elevation: 7,
        shadowColor: MyColors.myGrey,
        actions: [
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.addCard);
          }, icon: const Icon(Icons.add_circle_outline_rounded),iconSize: 35,color: MyColors.myGrey,),
        ],
      ),
      
      body: buildBlocWidget(),
    );
  }
}