import 'package:clean_demo/GetX/Core/Const/common_const.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/GetX/user_controller.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/Widgets/custome_button.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/Widgets/custome_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AddUserGetXPage extends StatefulWidget {
  AddUserGetXPage({Key? key}) : super(key: key);

  @override
  _AddUserGetXPageState createState() => _AddUserGetXPageState();
}

class _AddUserGetXPageState extends State<AddUserGetXPage> {
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String _nameFieldLabel = "Name";
  final String _ageFieldLabel = "Age";
  final String _emailFieldLabel = "Email";
  final controller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User"),
        ),
        body: Container(
          child: SafeArea(
              child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                            print("Validator name value =>$value");
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
                            print("Validator age value $value");
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
                            print("Validator email value $value");
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
                            ontap: () {
                              print("Submit click");

                              if (_formKey.currentState!.validate()) {
                                print("VALIDATE");
                                FormBuilderState _state =
                                    _formKey.currentState!;

                                UserModel _user = UserModel(
                                  userName:
                                      _state.fields[_nameFieldLabel]?.value,
                                  age: int.parse(
                                      _state.fields[_ageFieldLabel]?.value),
                                  emailId:
                                      _state.fields[_emailFieldLabel]?.value,
                                );
                                controller.addUserGetX(user: _user);
                                Get.back();
                                // Navigator.of(context).pop([true, _user]);
                              }
                            })
                      ],
                    ))
              ],
            ),
          )),
        ));
  }
}
