import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    Key key,
    this.onTextInput,
    this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.redAccent,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'अ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ा',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ि',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ी',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ु',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ू',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ृ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'े',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ै',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ो',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ौ',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'ब',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'भ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ड',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ध',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ढ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ग',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'घ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ह',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ज',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'झ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'य',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'क',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ख',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'म',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'न',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ञ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ण',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ङ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ल',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'प',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'फ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'र',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'स',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ष',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'श',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'च',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'छ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: ' ',
            flex: 4,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'त',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ट',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'थ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'ठ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'व',
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Container(
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key key,
    this.onBackspace,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: Container(
              child: Center(
                child: Icon(Icons.backspace),
              ),
            ),
          ),
        ),
      ),
    );
  }
}