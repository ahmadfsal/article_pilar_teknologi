import 'package:article_pilar_teknologi/helper/global_method_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.label,
    this.isMandatory = true,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.prefix,
    this.hintText,
    this.fillColor,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? label;
  final bool isMandatory;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? hintText;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!GlobalMethodHelper.isEmpty(label))
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black54, fontSize: 14.0),
                children: [
                  TextSpan(text: '$label '),
                  if (isMandatory)
                    const TextSpan(
                      text: '*',
                      style: TextStyle(color: Color(0xFFC30052)),
                    )
                ],
              ),
            ),
          if (!GlobalMethodHelper.isEmpty(label)) const SizedBox(height: 4.0),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator ??
                (String? value) {
                  if (GlobalMethodHelper.isEmpty(value)) {
                    return '${label ?? hintText} tidak boleh kosong';
                  }
                  return null;
                },
            decoration: InputDecoration(
              errorMaxLines: 2,
              isDense: true,
              hintText: hintText,
              filled: GlobalMethodHelper.isEmpty(fillColor) ? false : true,
              fillColor: fillColor,
              hintStyle: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 12.0,
              ),
              border: OutlineInputBorder(
                borderSide: GlobalMethodHelper.isEmpty(fillColor)
                    ? const BorderSide(color: Colors.grey)
                    : BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              prefix: prefix,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
