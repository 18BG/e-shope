import 'package:e_shope/utilities/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../components/intl_phone_field.dart';
import '../models/phone_number.dart';
import '../utilities/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final bool? requiresInfo;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? hintTextColor;
  final bool? enabled;
  final bool? isPasswordField;
  final TextInputType? keyboardType;
  final Function(PhoneNumber)? onPhoneNumberChanged;
  final String? phoneNumber;
  final bool? autoFocus;
  final String? phoneIsoCode;
  final Color? color;
  final IconButton? suffixIcon;
  final List<Widget> children;
  const CustomTextField(
      {Key? key,
      this.label,
      this.controller,
      this.requiresInfo = false,
      this.children = const [],
      this.autoFocus = false,
      this.color,
      this.enabled = false,
      this.hintText = "BG",
      this.hintTextColor,
      this.isPasswordField = false,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.onPhoneNumberChanged,
      this.phoneIsoCode,
      this.phoneNumber,
      this.suffixIcon,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Opacity(
        opacity: enabled! ? 1.0 : .8,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  label ?? "",
                  style: textStyle.apply(
                      fontSizeDelta: -4,
                      fontWeightDelta: 2,
                      color: TinyColor.fromColor(primaryColorDark)
                          .color
                          .withOpacity(.75)),
                  overflow: TextOverflow.ellipsis,
                ),
                if (requiresInfo!)
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        color: primaryColor,
                        size: 24,
                      ))
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            if (children.isNotEmpty)
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(
                  8,
                ),
                decoration: BoxDecoration(
                  color: TinyColor(
                    color ?? Colors.grey.withOpacity(.089),
                  ).color,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [...children.toList()],
                ),
              ),
            if (children.isEmpty)
              Container(
                padding: EdgeInsets.all(
                  keyboardType == TextInputType.multiline ? 8 : 2,
                ),
                decoration: BoxDecoration(
                  color: TinyColor(
                    color ?? Colors.grey.withOpacity(.089),
                  ).color,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: keyboardType == TextInputType.phone
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: IntlPhoneField(
                          searchText: 'Nom du pays',
                          showDropdownIcon: false,
                          // autoValidate: false,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              errorStyle: textStyle.apply(
                                fontSizeDelta: -6,
                                color: Colors.red,
                              ),
                              hintText: ''),
                          initialCountryCode: phoneIsoCode,
                          initialValue: phoneNumber,

                          onChanged: onPhoneNumberChanged,
                        ),
                      )
                    : TextFormField(
                        autofocus: autoFocus!,
                        minLines:
                            keyboardType == TextInputType.multiline ? 6 : 1,
                        maxLines: keyboardType == TextInputType.visiblePassword
                            ? 1
                            : 15,
                        enabled: enabled,
                        onTap: onTap,
                        controller: controller,
                        validator: validator,
                        obscureText: isPasswordField!,
                        cursorColor: primaryColor,
                        keyboardType: keyboardType,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: hintText,
                          labelText: label,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
