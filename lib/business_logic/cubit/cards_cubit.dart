import 'package:bloc/bloc.dart';
import 'package:card_app/data/models/cards.dart';
import 'package:card_app/data/repository/cards_repository.dart';
import 'package:meta/meta.dart';
part 'cards_state.dart';
class CardsCubit extends Cubit<CardsState> {
  final CardsRepository cardsRepository;
  List<Cards> cards = [];
  CardsCubit(this.cardsRepository) : super(CardsInitial());
  List<Cards> getAllCards() {
    cardsRepository.gteAllCards().then((cards) {
      emit(CardsLoaded(cards));
    });
    return cards;
  }
  Future<void> emitCreateNewCard(Cards newCard) async{
      emit(CreateNewCard(newCard));
  }

  Future<void> emitUpdateCard(Cards myCard , int cardId) async{
      emit(UpdaetCard(myCard,cardId));
  }

    Future<void> emitDeleteCard(int cardId) async{
      emit(DeleteCard(cardId));
  }
}
