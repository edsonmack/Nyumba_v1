import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockButtonWidget extends StatefulWidget {
  const BlockButtonWidget({
    super.key,
    required this.color,
    required this.text,
    this.callBack,
  });

  final Color color;
  final String text;
  final FutureOr<dynamic> Function()? callBack;

  @override
  State<BlockButtonWidget> createState() => _BlockButtonWidgetState();
}

class _BlockButtonWidgetState extends State<BlockButtonWidget> {
  bool loadingState = false;

  Widget _setUpButtonChild() {
    final defaultText = Text(
      widget.text,
      style: Theme.of(context).textTheme.headline6?.merge(const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )),
    );

    if (loadingState == true) {
      return const SizedBox(
        width: 15,
        height: 15,
        child: Center(
          child: CupertinoActivityIndicator(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return defaultText;
    }
  }

  Future<void> _handleSubmit() async {
    setState(() {
      loadingState = true;
    });
    // call function
    await widget.callBack?.call();
    setState(() {
      loadingState = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: _handleSubmit,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      color: widget.color,
      disabledElevation: 0,
      disabledColor: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      minWidth: size.width,
      child: _setUpButtonChild(),
    );
  }
}
