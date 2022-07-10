import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomeField extends StatelessWidget {
  ValueChanged<String?>? onchange;
  String? initialValue;
  FormFieldValidator<String>? validator;
  TextCapitalization textcapitalization;
  String labeltext;
  TextInputType keyboardtype;
  TextInputAction textinputaction = TextInputAction.done;

  CustomeField(
      {required String this.labeltext,
      ValueChanged<String?>? this.onchange,
      String? this.initialValue,
      FormFieldValidator<String>? this.validator,
      TextCapitalization this.textcapitalization = TextCapitalization.none,
      TextInputType this.keyboardtype = TextInputType.text,
      TextInputAction this.textinputaction = TextInputAction.done});

  @override
  Widget build(BuildContext context) {
    print("initialValue => $initialValue");
    return FormBuilderTextField(
      name: labeltext,
      initialValue: initialValue,
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
//     String? initialValue,
//     FormFieldValidator<String>? validator,
//     TextCapitalization textcapitalization = TextCapitalization.none,
//     required String labeltext,
//     TextInputType keyboardtype = TextInputType.text,
//     TextInputAction textinputaction = TextInputAction.done}) {
//   return FormBuilderTextField(
//     name: labeltext,
//     initialValue: initialValue,
//     textCapitalization: textcapitalization,
//     decoration:
//         InputDecoration(labelText: labeltext, border: OutlineInputBorder()),
//     onChanged: onchange,
//     validator: validator,
//     keyboardType: keyboardtype,
//     textInputAction: textinputaction,
//   );
// }
