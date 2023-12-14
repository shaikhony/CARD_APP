import 'package:card_app/data/models/cards.dart';
import 'package:card_app/data/web_services/cards_web_services.dart';

class CardsRepository{
  final CardsWebServises cardsWebServices;
  CardsRepository(this.cardsWebServices);
  Future<List<Cards>> gteAllCards() async{
    final cards = await cardsWebServices.getAllCards();
    return cards.map((card) =>Cards.fromJson(card)).toList();
  }
  Future<void> CreateNewCard(Cards newCard) async{
    await cardsWebServices.createNewCard(newCard);
  }
  Future<void> updateCard(Cards myCard , int cardId) async{
    await cardsWebServices.updateCard(myCard , cardId);
  }
  Future<void> deleteCard(int cardId) async{
    await cardsWebServices.deleteCard(cardId);
  }
}