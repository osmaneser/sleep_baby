import 'package:flutter/material.dart';
import '../../widgets/oe_custom_content_text.dart';
import '../../constants/global_constants.dart';

import 'radio_button_item.dart';

class OeRadioButton extends StatefulWidget {
  final List<RadioButtonItem> listRadioGroup;
  final Function onChanged;
  final bool isShowLabel;
  final String labelText;
  final TextStyle? labelStyle;
  final int? initValue;

  const OeRadioButton(
      {Key? key,
      required this.listRadioGroup,
      required this.onChanged,
      this.labelText = "Varsayılan",
      this.labelStyle,
      this.isShowLabel = true, this.initValue})
      : super(key: key);
  @override
  _OeRadioButtonState createState() => _OeRadioButtonState();
}

class _OeRadioButtonState extends State<OeRadioButton> {
  dynamic _radioValue;

  ThemeData? themeData;

  @override
  void initState() {
    _radioValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isShowLabel
            ? CustomContentText(
                text: widget.labelText,
              )
            : SizedBox(),
        SizedBox(
          height: 5,
        ),
        ...getRadioGroup(),
      ],
    );
  }

  List<Widget> getRadioGroup() {
    return widget.listRadioGroup
        .map(
          (e) => ListTile(
            title: GestureDetector(onTap: (){
              setState(() {
                  _radioValue = e.value;
                  widget.onChanged(e.value);
                });
            },child: e.content),
            contentPadding: EdgeInsets.all(0),
            dense: true,
            leading: Radio(
              value: e.value,
              activeColor: GlobalConstant.fontColorLive,
              groupValue: _radioValue,
              onChanged: (dynamic value) {
                setState(() {
                  _radioValue = value;
                  widget.onChanged(value);
                });
              },
            ),
          ),
        )
        .toList();
  }
}
