import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../models/phone_number.dart';
import '../utilities/countries.dart';

// ignore: must_be_immutable
class IntlPhoneField extends StatefulWidget {
  final bool obscureText;
  final TextAlign textAlign;
  final VoidCallback? onTap;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;
  final FormFieldSetter<PhoneNumber>? onSaved;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [inputFormatters], which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted], [onSelectionChanged]:
  ///    which are more specialized input change notifications.
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<PhoneNumber>? onCountryChanged;
  final FormFieldValidator<String>? validator;
  final bool autoValidate;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType keyboardType;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  ///
  /// The [focusNode] is a long-lived object that's typically managed by a
  /// [StatefulWidget] parent. See [FocusNode] for more information.
  ///
  /// To give the keyboard focus to this widget, provide a [focusNode] and then
  /// use the current [FocusScope] to request the focus:
  ///
  /// ```dart
  /// FocusScope.of(context).requestFocus(myFocusNode);
  /// ```
  ///
  /// This happens automatically when the widget is tapped.
  ///
  /// To be notified when the widget gains or loses the focus, add a listener
  /// to the [focusNode]:
  ///
  /// ```dart
  /// focusNode.addListener(() { print(myFocusNode.hasFocus); });
  /// ```
  ///
  /// If null, this widget will create its own [FocusNode].
  ///
  /// ## Keyboard
  ///
  /// Requesting the focus will typically cause the keyboard to be shown
  /// if it's not showing already.
  ///
  /// On Android, the user can hide the keyboard - without changing the focus -
  /// with the system back button. They can restore the keyboard's visibility
  /// by tapping on a text field.  The user might hide the keyboard and
  /// switch to a physical keyboard, or they might just need to get it
  /// out of the way for a moment, to expose something it's
  /// obscuring. In this case requesting the focus again will not
  /// cause the focus to change, and will not make the keyboard visible.
  ///
  /// This widget builds an [EditableText] and will ensure that the keyboard is
  /// showing when it is tapped by calling [EditableTextState.requestKeyboard()].
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  ///
  /// See also:
  ///
  ///  * [EditableText.onSubmitted] for an example of how to handle moving to
  ///    the next/previous field when using [TextInputAction.next] and
  ///    [TextInputAction.previous] for [textInputAction].
  final void Function(String)? onSubmitted;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [Decoration.enabled] property.
  final bool enabled;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to the brightness of [ThemeData.primaryColorBrightness].
  final Brightness keyboardAppearance;

  /// Initial Value for the field.
  /// This property can be used to pre-fill the field.
  final String? initialValue;

  /// 2 Letter ISO Code
  final String? initialCountryCode;

  /// List of 2 Letter ISO Codes of countries to show. Defaults to showing the inbuilt list of all countries.
  final List<String>? countries;

  /// The decoration to show around the text field.
  ///
  /// By default, draws a horizontal line under the text field but can be
  /// configured to show an icon, label, hint text, and error text.
  ///
  /// Specify null to remove the decoration entirely (including the
  /// extra padding introduced by the decoration to save space for the labels).
  final InputDecoration? decoration;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subtitle1` text style from the current [Theme].
  final TextStyle? style;
  final bool showDropdownIcon;

  final BoxDecoration dropdownDecoration;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// Placeholder Text to Display in Searchbar for searching countries
  final String searchText;

  /// Color of the country code
  final Color? countryCodeTextColor;

  /// Color of the drop down arrow
  final Color? dropDownArrowColor;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool autofocus;

  TextInputAction? textInputAction;

  IntlPhoneField(
      {super.key, this.initialCountryCode,
      this.obscureText = false,
      this.textAlign = TextAlign.left,
      this.onTap,
      this.readOnly = false,
      this.initialValue,
      this.keyboardType = TextInputType.number,
      this.autoValidate = true,
      this.controller,
      this.focusNode,
      this.decoration,
      this.style,
      this.onSubmitted,
      this.validator,
      this.onChanged,
      this.countries,
      this.onCountryChanged,
      this.onSaved,
      this.showDropdownIcon = true,
      this.dropdownDecoration = const BoxDecoration(),
      this.inputFormatters,
      this.enabled = true,
      this.keyboardAppearance = Brightness.light,
      this.searchText = 'Search by Country Name',
      this.countryCodeTextColor,
      this.dropDownArrowColor,
      this.autofocus = false,
      this.textInputAction});

  @override
  _IntlPhoneFieldState createState() => _IntlPhoneFieldState();
}

class _IntlPhoneFieldState extends State<IntlPhoneField> {
  List<Map<String, dynamic>>? _countryList;
  Map<String, dynamic>? _selectedCountry;
  List<Map<String, dynamic>>? filteredCountries;

  FormFieldValidator<String>? validator;

  @override
  void initState() {
    super.initState();
    _countryList = widget.countries == null
        ? countries
        : countries
            .where((country) => widget.countries!.contains(country['code']))
            .toList();
    filteredCountries = _countryList;
    _selectedCountry = _countryList!.firstWhere(
        (item) => item['code'] == (widget.initialCountryCode ?? 'US'),
        orElse: () => _countryList!.first);

    /*validator = widget.autoValidate
        ? ((value) =>
            value != null && value.length != 10 ? 'Numéro invalide' : null)
        : widget.validator;*/
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    labelText: widget.searchText,
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredCountries = _countryList!
                          .where((country) => country['name']
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCountries!.length,
                    itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset(
                            'assets/flags/${filteredCountries![index]['code'].toLowerCase()}.png',
                            fit: BoxFit.cover,
                            width: 32,
                          ),
                          title: Text(
                            filteredCountries![index]['name'],
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          trailing: Text(
                            '+${filteredCountries![index]['dial_code']}',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          onTap: () {
                            _selectedCountry = filteredCountries![index];

                            if (widget.onCountryChanged != null) {
                              widget.onCountryChanged!(
                                PhoneNumber(
                                  countryISOCode: _selectedCountry!['code'],
                                  countryCode:
                                      '+${_selectedCountry!['dial_code']}',
                                  number: '',
                                ),
                              );
                            }

                            Navigator.of(context).pop();
                          },
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildFlagsButton(),
        const SizedBox(width: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: TextFormField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              initialValue: widget.initialValue,
              readOnly: widget.readOnly,
              obscureText: widget.obscureText,
              textAlign: widget.textAlign,
              onTap: () {
                if (widget.onTap != null) widget.onTap!();
              },
              controller: widget.controller,
              focusNode: widget.focusNode,
              onFieldSubmitted: (s) {
                if (widget.onSubmitted != null) widget.onSubmitted!(s);
              },
              decoration: widget.decoration,
              style: widget.style,
              onSaved: (value) {
                if (widget.onSaved != null) {
                  widget.onSaved!(
                    PhoneNumber(
                      countryISOCode: _selectedCountry!['code'],
                      countryCode: '+${_selectedCountry!['dial_code']}',
                      number: value!,
                    ),
                  );
                }
              },
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(
                    PhoneNumber(
                      countryISOCode: _selectedCountry!['code'],
                      countryCode: '+${_selectedCountry!['dial_code']}',
                      number: value,
                    ),
                  );
                }
              },
              validator: validator,
              // maxLength: _selectedCountry['max_length'],
              // maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              enabled: widget.enabled,
              keyboardAppearance: widget.keyboardAppearance,
              autofocus: widget.autofocus,
              textInputAction: widget.textInputAction,
            ),
          ),
        ),
      ],
    );
  }

  DecoratedBox _buildFlagsButton() => DecoratedBox(
        decoration: widget.dropdownDecoration,
        child: InkWell(
          borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius,
          onTap: _changeCountry,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (widget.showDropdownIcon) ...[
                  Icon(
                    Icons.arrow_drop_down,
                    color: widget.dropDownArrowColor,
                  ),
                  const SizedBox(width: 4)
                ],
                Image.asset(
                  'assets/flags/${_selectedCountry!['code'].toLowerCase()}.png',
                  width: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  '+${_selectedCountry!['dial_code']}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: widget.countryCodeTextColor),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      );
}
