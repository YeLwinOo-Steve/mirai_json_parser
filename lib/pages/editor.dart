import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:json_editor/json_editor.dart';
import 'package:mirai/mirai.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  Object? jsonStr = {
    "type": "scaffold",
    "appBar": {
      "type": "appBar",
      "title": {
        "type": "text",
        "data": "Text Field",
        "style": {"color": "#ffffff", "fontSize": 21}
      },
      "backgroundColor": "#4D00E9"
    },
    "backgroundColor": "#ffffff",
    "body": {
      "type": "scrollView",
      "child": {
        "type": "container",
        "padding": {"left": 12, "right": 12, "top": 12, "bottom": 12},
        "child": {
          "type": "column",
          "mainAxisAlignment": "center",
          "crossAxisAlignment": "center",
          "children": [
            {"type": "sizedBox", "height": 24},
            {
              "type": "textField",
              "maxLines": 1,
              "keyboardType": "text",
              "textInputAction": "done",
              "textAlign": "start",
              "textCapitalization": "none",
              "textDirection": "ltr",
              "textAlignVertical": "top",
              "obscureText": false,
              "cursorColor": "#FC3F1B",
              "style": {"color": "#000000"},
              "decoration": {
                "hintText": "What do people call you?",
                "filled": true,
                "icon": {
                  "type": "icon",
                  "iconType": "cupertino",
                  "icon": "person_solid",
                  "size": 24
                },
                "hintStyle": {"color": "#797979"},
                "labelText": "Name*",
                "fillColor": "#F2F2F2"
              },
              "readOnly": false,
              "enabled": true
            },
            {"type": "sizedBox", "height": 24},
            {
              "type": "textField",
              "maxLines": 1,
              "keyboardType": "text",
              "textInputAction": "done",
              "textAlign": "start",
              "textCapitalization": "none",
              "textDirection": "ltr",
              "textAlignVertical": "top",
              "obscureText": false,
              "cursorColor": "#FC3F1B",
              "style": {"color": "#000000"},
              "decoration": {
                "hintText": "Where can we reach you?",
                "filled": true,
                "icon": {
                  "type": "icon",
                  "iconType": "cupertino",
                  "icon": "phone_solid",
                  "size": 24
                },
                "hintStyle": {"color": "#797979"},
                "labelText": "Phone number*",
                "fillColor": "#F2F2F2"
              },
              "readOnly": false,
              "enabled": true
            },
            {"type": "sizedBox", "height": 24},
            {
              "type": "textField",
              "maxLines": 1,
              "keyboardType": "text",
              "textInputAction": "done",
              "textAlign": "start",
              "textCapitalization": "none",
              "textDirection": "ltr",
              "textAlignVertical": "top",
              "obscureText": false,
              "cursorColor": "#FC3F1B",
              "style": {"color": "#000000"},
              "decoration": {
                "hintText": "Your email address",
                "filled": true,
                "icon": {
                  "type": "icon",
                  "iconType": "material",
                  "icon": "email",
                  "size": 24
                },
                "hintStyle": {"color": "#797979"},
                "labelText": "Email",
                "fillColor": "#F2F2F2"
              },
              "readOnly": false,
              "enabled": true
            },
            {"type": "sizedBox", "height": 24},
            {
              "type": "sizedBox",
              "height": 100,
              "child": {
                "type": "textField",
                "expands": true,
                "cursorColor": "#FC3F1B",
                "style": {"color": "#000000"},
                "decoration": {
                  "filled": true,
                  "hintStyle": {"color": "#797979"},
                  "labelText": "Life story",
                  "fillColor": "#F2F2F2"
                },
                "readOnly": false,
                "enabled": true
              }
            },
            {"type": "sizedBox", "height": 24},
            {
              "type": "textField",
              "maxLines": 1,
              "keyboardType": "text",
              "textInputAction": "done",
              "textAlign": "start",
              "textCapitalization": "none",
              "textDirection": "ltr",
              "textAlignVertical": "top",
              "obscureText": true,
              "cursorColor": "#FC3F1B",
              "style": {"color": "#000000"},
              "decoration": {
                "filled": true,
                "suffixIcon": {
                  "type": "icon",
                  "iconType": "cupertino",
                  "icon": "eye",
                  "size": 24
                },
                "hintStyle": {"color": "#797979"},
                "labelText": "Password*",
                "fillColor": "#F2F2F2"
              },
              "readOnly": false,
              "enabled": true
            },
            {"type": "sizedBox", "height": 24},
            {
              "type": "textField",
              "maxLines": 1,
              "keyboardType": "text",
              "textInputAction": "done",
              "textAlign": "start",
              "textCapitalization": "none",
              "textDirection": "ltr",
              "textAlignVertical": "top",
              "obscureText": true,
              "cursorColor": "#FC3F1B",
              "style": {"color": "#000000"},
              "decoration": {
                "filled": true,
                "suffixIcon": {
                  "type": "icon",
                  "iconType": "cupertino",
                  "icon": "eye",
                  "size": 24
                },
                "hintStyle": {"color": "#797979"},
                "labelText": "Re-type password*",
                "fillColor": "#F2F2F2"
              },
              "readOnly": false,
              "enabled": true
            },
            {"type": "sizedBox", "height": 48},
            {
              "type": "elevatedButton",
              "child": {"type": "text", "data": "Submit"},
              "style": {
                "backgroundColor": "#4D00E9",
                "padding": {"top": 8, "left": 12, "right": 12, "bottom": 8}
              },
              "onPressed": {}
            }
          ]
        }
      }
    }
  };
  Object? jsonData;
  Widget? miraiWidget = null;
  double uiWidth = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    uiWidth = MediaQuery.sizeOf(context).width / 2.0;
  }

  void run() {
    setState(() {
      jsonData = jsonStr;
      miraiWidget = makeWidget();
    });
  }

  Widget? makeWidget() {
    return Mirai.fromJson(jsonData as Map<String, dynamic>?, context);
  }

  void showCopySuccessToast() {
    Fluttertoast.showToast(
        msg: "JSON copied successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        webShowClose: true,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        webBgColor: "#00b09b",
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      JsonEditorTheme(
                        themeData: JsonEditorThemeData(
                          lightTheme: JsonTheme.light(),
                          darkTheme: JsonTheme.dark(),
                        ),
                        child: JsonEditor.object(
                          object: jsonStr,
                          onValueChanged: (value) {
                            jsonStr = jsonDecode(value.toString());
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                visualDensity: VisualDensity.compact,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.dark_mode,
                                  size: 18,
                                ),
                              ),
                              IconButton(
                                visualDensity: VisualDensity.compact,
                                onPressed: () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: jsonStr.toString()));
                                  showCopySuccessToast();
                                },
                                icon: const Icon(
                                  Icons.copy_outlined,
                                  size: 18,
                                ),
                              ),
                              FilledButton.icon(
                                onPressed: run,
                                icon: const Icon(
                                  Icons.play_arrow,
                                  size: 18,
                                ),
                                label: const Text('Run'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                height: double.maxFinite,
                width: uiWidth,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.teal.shade100,
                  child: miraiWidget ??
                      const Center(
                        child: Text('UI Output'),
                      ),
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
            left: MediaQuery.sizeOf(context).width - uiWidth - 13,
            bottom: MediaQuery.sizeOf(context).height * 0.3,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (uiWidth >= MediaQuery.sizeOf(context).width * 0.2) {
                  setState(() {
                    uiWidth -= details.delta.dx;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 0.4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: SvgPicture.asset(
                  'assets/horizontal_drag.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
