import 'package:card_app/data/models/cards.dart';
import 'package:card_app/constants/strings.dart';
import 'package:dio/dio.dart';

class CardsWebServises{
  late Dio dio;

  CardsWebServises(){
    BaseOptions options = BaseOptions(
    baseUrl : BaseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30) ,
    receiveTimeout: const Duration(seconds: 30) ,
    headers: {"authorization": "Bearer $token",}
    );
    dio = Dio(options);
  }


  Future<List<dynamic>> getAllCards() async{
    try{
          Response response = await dio.get('users');
          print(response.data.toString());
          return response.data;
    }
    catch(e){
      print(e.toString());
      return [];
    }
  }
  Future<void> createNewCard(Cards newCard) async {
    try {
      await dio.post('users',
      data: newCard.toJson(),
      );
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to get card: $e');
    }
  }

    Future<void> updateCard(Cards newCard , int cardId) async {
    try {
      await dio.put('users/$cardId',
      data: newCard.toJson(),
      );
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to get card: $e');
    }
  }

  Future<void> deleteCard(int cardId) async {
    try {
      await dio.delete('users/$cardId');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to get card: $e');
    }
  }
}