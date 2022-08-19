import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String msg;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? overflow;


  const AppText({Key? key, required this.msg,this.style,this.textAlign,this.maxLine,this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: style,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
    );
  }
}

