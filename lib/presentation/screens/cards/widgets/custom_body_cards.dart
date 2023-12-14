import 'package:card_app/data/models/cards.dart';
import 'package:card_app/presentation/screens/cards/widgets/custom_card.dart';
import 'package:flutter/material.dart';
class CustomBodyCards extends StatelessWidget {
  final List<Cards> myCards;
  const CustomBodyCards({super.key,required this.myCards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(2),
      itemCount: 10,
      itemBuilder: ((context, index) {
      return CustomCard(myCard: myCards[index],);
    }) );
  }
}