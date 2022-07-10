import 'package:clean_demo/SqlWithGetX/Core/Const/common_const.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/GetX/user_controller.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/Widgets/custome_button.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/Widgets/custome_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AddUserSqlPage extends StatefulWidget {
  AddUserSqlPage({Key? key}) : super(key: key);

  @override
  _AddUserSqlPageState createState() => _AddUserSqlPageState();
}

class _AddUserSqlPageState extends State<AddUserSqlPage> {
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String _nameFieldLabel = "Name";
  final String _ageFieldLabel = "Age";
  final String _emailFieldLabel = "Email";
  final controller = Get.find<UserController>();

  UserModel _user = UserModel(userName: '', emailId: '', age: 0);

  @override
  void initState() {
    if (Get.arguments != null) {
      _user = Get.arguments;
    }

    super.initState();
  }

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
              _formKey.currentState?.save();
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
                          initialValue: _user.userName,
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
                          initialValue:
                              _user.age == 0 ? '' : _user.age.toString(),
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
                          initialValue: _user.emailId,
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
                        if (Get.arguments == null)
                          CustomeButton(
                              label: "Add",
                              ontap: () {
                                print("Add click");

                                if (_formKey.currentState!.saveAndValidate()) {
                                  print("VALIDATE");
                                  FormBuilderState _state =
                                      _formKey.currentState!;

                                  _user = UserModel(
                                    userName:
                                        _state.fields[_nameFieldLabel]?.value,
                                    age: int.parse(
                                        _state.fields[_ageFieldLabel]?.value),
                                    emailId:
                                        _state.fields[_emailFieldLabel]?.value,
                                  );
                                  controller.addUserGetX(user: _user);
                                }
                              }),

//UPDATE
                        if (Get.arguments != null)
                          CustomeButton(
                              label: "Update",
                              ontap: () {
                                print("Update click");

                                if (_formKey.currentState!.saveAndValidate()) {
                                  print("VALIDATE");
                                  FormBuilderState _state =
                                      _formKey.currentState!;

                                  _user = UserModel(
                                      userName:
                                          _state.fields[_nameFieldLabel]?.value,
                                      age: int.parse(
                                          _state.fields[_ageFieldLabel]?.value),
                                      emailId: _state
                                          .fields[_emailFieldLabel]?.value,
                                      userId: _user.userId);

                                  controller.updateUsergetX(user: _user);
                                }
                              })
                      ],
                    ))
              ],
            ),
          )),
        ));
    ;
  }
}
