import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'back_arrow.dart';

class ScreenTitleBar extends StatefulWidget {
  ScreenTitleBar({super.key, required this.title, this.isTrue});
  final title;
  bool? isTrue;

  @override
  State<ScreenTitleBar> createState() => _ScreenTitleBarState();
}

class _ScreenTitleBarState extends State<ScreenTitleBar> {
  final List<String> items = [
    'All categories',
    'Man',
    'Woman',
    'Children',
    'Chemises',
    'Kepis',
    'Pantalon',
    'Complets',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: const BoxDecoration(color: Colors.black12),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: backArrow,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Text(widget.title),
          Spacer(),
          widget.isTrue == true
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Filtrer',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      iconStyleData: IconStyleData(icon: Icon(null)),
                      buttonStyleData: ButtonStyleData(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(
                          //borderRadius: BorderRadius.circular(14),
                          color: Colors.grey,
                        ),
                        offset: const Offset(-20, 0),
                        // scrollbarTheme: ScrollbarThemeData(
                        //   //radius: const Radius.circular(40),
                        //   thickness: MaterialStateProperty.all<double>(6),
                        //   thumbVisibility: MaterialStateProperty.all<bool>(true),
                        // ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                )
              : Center(),
        ],
      ),
    );
  }
}
