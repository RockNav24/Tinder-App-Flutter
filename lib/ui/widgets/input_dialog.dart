import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/ui/widgets/bordered_text_field.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class InputDialog extends StatefulWidget {
  final String labelText;
  final Function(String) onSavePressed;
  final String startInputText;

  @override
  _InputDialogState createState() => _InputDialogState();

  InputDialog(
      {@required this.labelText,
      @required this.onSavePressed,
      this.startInputText = ''});
}

class _InputDialogState extends State<InputDialog> {
  String inputText = '';
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.startInputText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(16.0),
      content: BorderedTextField(
        textCapitalization: TextCapitalization.sentences,
        labelText: widget.labelText,
        autoFocus: true,
        keyboardType: TextInputType.text,
        onChanged: (value) => {inputText = value},
        textController: textController,
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(
            'CANCEL',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: Text(
            'SAVE',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            widget.onSavePressed(inputText);
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kAccentColor),
          ),
        ),
      ],
    );
  }
}
