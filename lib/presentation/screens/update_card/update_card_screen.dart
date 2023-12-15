import 'package:card_app/business_logic/cubit/cards_cubit.dart';
import 'package:card_app/constants/my_colors.dart';
import 'package:card_app/constants/styles.dart';
import 'package:card_app/data/models/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class UpdateCardScreen extends StatefulWidget {
  final Cards oldCard;
  const UpdateCardScreen({super.key, required this.oldCard});
  @override
  State<UpdateCardScreen> createState() => _UpdateCardScreenState();
}

class _UpdateCardScreenState extends State<UpdateCardScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textFieldControllerName = TextEditingController();
  TextEditingController _textFieldControllerContent = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardsCubit>(context).emitUpdateCard(Cards(
                name: "${_textFieldControllerName.text}",
                email: "${_textFieldControllerContent.text}",
                gender: "Male",
                status: "Active"),
                widget.oldCard.id!
                );
  }
  Widget bulidBlocWidget()
  {
    return BlocBuilder<CardsCubit,CardsState>(
    builder: (context,state)
    {
      if (state is UpdaetCard){
        return Center(child: Text('yessssss')) ;
      }else{
        return showLoadingIndicator();
      }
    }
    );
  }
    
  Widget showLoadingIndicator()
  {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myFeathery,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBeige,
      appBar: AppBar(
        title: const Text(
          'تعديل بيانات بطاقة',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
        elevation: 7,
        shadowColor: MyColors.myGrey,
      ),
      
    body:Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _textFieldControllerName,
                    decoration:  InputDecoration(
                    labelText: ' عنوان البطاقة ',
                    hintText: widget.oldCard.name,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل عنوان البطاقة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: _textFieldControllerContent,
                    decoration:  InputDecoration(
                    labelText: ' محتوى البطاقة ',
                    hintText: widget.oldCard.email,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل محتوى البطاقة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  Row(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.myFeathery),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              bulidBlocWidget();
              // Do something with the form dat
              print('Text name: ${_textFieldControllerName.text} Text content : ${_textFieldControllerContent.text}');
            }
          },
          child: Text('تعديل',style: Styles.textStyle14.copyWith(color: MyColors.myWhite),),
        ),

        SizedBox(width: 5,),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop();
            },
          child: Text('خروج'),
        ),
      ],
    ),
                ],
              ),
            ),
        ),
      ],
    ),
    );
  }
}