import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomeField extends StatelessWidget {
  ValueChanged<String?>? onchange;
  FormFieldValidator<String?>? validator;
  TextCapitalization textcapitalization;
  String labeltext;
  TextInputType keyboardtype;
  TextInputAction textinputaction;

  CustomeField(
      {this.onchange,
      this.validator,
      required this.labeltext,
      this.textcapitalization = TextCapitalization.none,
      this.keyboardtype = TextInputType.text,
      this.textinputaction = TextInputAction.done});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: labeltext,
      textCapitalization: textcapitalization,
      decoration:
          InputDecoration(labelText: labeltext, border: OutlineInputBorder()),
      onChanged: onchange,
      validator: validator,
      keyboardType: keyboardtype,
      textInputAction: textinputaction,
    );
  }
}

// Widget CustomeField(
//     {ValueChanged<String?>? onchange,
//     FormFieldValidator<String>? validator,
//     TextCapitalization textcapitalization = TextCapitalization.none,
//     required String labeltext,
//     TextInputType keyboardtype = TextInputType.text,
//     TextInputAction textinputaction = TextInputAction.done}) {
//   return FormBuilderTextField(
//     name: labeltext,
//     textCapitalization: textcapitalization,
//     decoration:
//         InputDecoration(labelText: labeltext, border: OutlineInputBorder()),
//     onChanged: onchange,
//     validator: validator,
//     keyboardType: keyboardtype,
//     textInputAction: textinputaction,
//   );
// }
