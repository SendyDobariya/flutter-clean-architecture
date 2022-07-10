import 'package:clean_demo/Bloc/Core/Base/base_event.dart';
import 'package:clean_demo/Bloc/Core/Const/common_const.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/Widgets/custome_button.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/Widgets/custome_field.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/bloc/user_bloc.dart';
import 'package:clean_demo/Bloc/Core/Base/base_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_demo/injection_container.dart';

class AddUserBlocPage extends StatelessWidget {
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String _nameFieldLabel = "Name";
  final String _ageFieldLabel = "Age";
  final String _emailFieldLabel = "Email";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User"),
        ),
        body: BlocListener<UserBloc, BaseState>(
          listener: (context, state) {
            if (state is UserAddedState) {
              String _name = (state as UserAddedState).user.userName;
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Added $_name")));
            }
          },
          child: BlocListener<UserBloc, BaseState>(
            listener: (context, state) {},
            child: Container(
              child: SafeArea(
                  child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  children: [
                    FormBuilder(
                        key: _formKey,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            CustomeField(
                              textcapitalization: TextCapitalization.words,
                              labeltext: _nameFieldLabel,
                              textinputaction: TextInputAction.next,
                              validator: (String? value) {
                                print("Validator name value =>");
                                if (value == "" || value == null) {
                                  return "Please enter name";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomeField(
                              labeltext: _ageFieldLabel,
                              textinputaction: TextInputAction.next,
                              keyboardtype: TextInputType.number,
                              validator: (String? value) {
                                print("Validator age value ");
                                if (value == "" || value == null) {
                                  return "Please enter age";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomeField(
                              labeltext: _emailFieldLabel,
                              textinputaction: TextInputAction.done,
                              keyboardtype: TextInputType.emailAddress,
                              validator: (String? value) {
                                print("Validator email value ");
                                if (value == "" || value == null) {
                                  return "Please enter email-id";
                                }
                                if (!RegExp(emailRex).hasMatch(value)) {
                                  return "Please enter valid email-id";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomeButton(
                                label: "Submit",
                                ontap: () async {
                                  print("Submit click");

                                  if (_formKey.currentState!
                                      .saveAndValidate()) {
                                    print("VALIDATE");
                                    FormBuilderState _state =
                                        _formKey.currentState!;

                                    UserModel _user = UserModel(
                                      userName:
                                          _state.fields[_nameFieldLabel]?.value,
                                      age: int.parse(
                                          _state.fields[_ageFieldLabel]?.value),
                                      emailId: _state
                                          .fields[_emailFieldLabel]?.value,
                                    );

                                    context
                                        .read<UserBloc>()
                                        .add(AddUserEvent(_user));
                                    await Future.delayed(
                                        Duration(milliseconds: 500));
                                    Navigator.of(context).pop([true, _user]);
                                  }
                                })
                          ],
                        ))
                  ],
                ),
              )),
            ),
          ),
        ));
  }
}
