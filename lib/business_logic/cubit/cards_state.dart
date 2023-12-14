part of 'cards_cubit.dart';

@immutable
abstract class CardsState {}

class CardsInitial extends CardsState {}

class CardsLoaded extends CardsState{
  final List<Cards> cards;
  CardsLoaded(this.cards);
}
class CreateNewCard extends CardsState{
  final Cards newCard;
  CreateNewCard(this.newCard);
}
class UpdaetCard extends CardsState{
  final Cards myCard;
  final int cardId;
  UpdaetCard(this.myCard,this.cardId);
}
class DeleteCard extends CardsState{
  final int cardId;
  DeleteCard(this.cardId);
}
