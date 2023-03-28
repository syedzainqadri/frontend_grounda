// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class TextEditor extends StatelessWidget {
  TextEditor({required this.controller, Key? key}) : super(key: key);

  // final QuillEditorController controller = QuillEditorController();
  dynamic controller;

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
  ];

  final _toolbarColor = const Color.fromARGB(255, 234, 234, 234);
  final _backgroundColor = const Color.fromARGB(255, 255, 255, 255);
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black54, fontWeight: FontWeight.normal);
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.teal, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ToolBar(
          toolBarColor: _toolbarColor,
          padding: const EdgeInsets.all(8),
          iconSize: 25,
          iconColor: _toolbarIconColor,
          activeIconColor: Colors.purple.shade300,
          controller: controller,
          customButtons: const [],
        ),
        Flexible(
          fit: FlexFit.tight,
          child: QuillHtmlEditor(
            text: "",
            hintText:
                'Add Description here n Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum Loreim Impresum',
            controller: controller,
            isEnabled: true,
            minHeight: 150,
            textStyle: _editorTextStyle,
            hintTextStyle: _hintTextStyle,
            hintTextAlign: TextAlign.start,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 150),
            hintTextPadding: EdgeInsets.zero,
            backgroundColor: _backgroundColor,
            onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
            onTextChanged: (text) => debugPrint('widget text change $text'),
            onEditorCreated: () => debugPrint('Editor has been loaded'),
            onSelectionChanged: (sel) =>
                debugPrint('index ${sel.index}, range ${sel.length}'),
          ),
        ),
      ],
    );
  }

  Widget textButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: _toolbarIconColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: _toolbarColor),
          )),
    );
  }

  ///[getHtmlText] to get the html text from editor
  void getHtmlText() async {
    String? htmlText = await controller.getText();
    debugPrint(htmlText.toString());
  }

  ///[setHtmlText] to set the html text to editor
  void setHtmlText(String text) async {
    await controller.setText(text);
  }

  ///[insertNetworkImage] to set the html text to editor
  void insertNetworkImage(String url) async {
    await controller.embedImage(url);
  }

  ///[insertVideoURL] to set the video url to editor
  ///this method recognises the inserted url and sanitize to make it embeddable url
  ///eg: converts youtube video to embed video, same for vimeo
  void insertVideoURL(String url) async {
    await controller.embedVideo(url);
  }

  /// to set the html text to editor
  /// if index is not set, it will be inserted at the cursor postion
  void insertHtmlText(String text, {int? index}) async {
    await controller.insertText(text, index: index);
  }

  /// to clear the editor
  void clearEditor() => controller.clear();

  /// to enable/disable the editor
  void enableEditor(bool enable) => controller.enableEditor(enable);

  /// method to un focus editor
  void unFocusEditor() => controller.unFocus();
}
