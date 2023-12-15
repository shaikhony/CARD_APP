import 'package:card_app/business_logic/cubit/cards_cubit.dart';
import 'package:card_app/constants/my_colors.dart';
import 'package:card_app/constants/styles.dart';
import 'package:card_app/data/models/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});
  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textFieldControllerName = TextEditingController();
  TextEditingController _textFieldControllerContent = TextEditingController();
  @override
  void initState() {
    super.initState();
                  BlocProvider.of<CardsCubit>(context).emitCreateNewCard(Cards(
                name: "${_textFieldControllerName.text}",
                email: "${_textFieldControllerContent.text}",
                gender: "Male",
                status: "Active"));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<CardsCubit>(context).close();
  }
  Widget bulidBlocWidget()
  {
    return BlocBuilder<CardsCubit,CardsState>(
    builder: (context,state)
    {
      if (state is CreateNewCard){
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
          'إضافة بطاقة',
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
                    decoration: InputDecoration(
                    labelText: ' عنوان البطاقة ',
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
                    decoration: InputDecoration(
                    labelText: ' محتوى البطاقة ',
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
              // Do something with the form data
              print('Text name: ${_textFieldControllerName.text} Text content : ${_textFieldControllerContent.text}');
            }
          },
          child: Text('إضافة',style: Styles.textStyle14.copyWith(color: MyColors.myWhite),),
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