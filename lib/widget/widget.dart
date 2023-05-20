import 'package:flutter/material.dart';

class ShowData extends StatelessWidget {
 const ShowData({Key? key, required this.onPressed}) : super(key: key);

 final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Text(
                'press to show  file in console',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Botton(
          onPressed: onPressed,
          text: 'Show File',
        ),
      ],
    );
  }
}

class Botton extends StatelessWidget {
  Botton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  void Function() onPressed;
  String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
      ),
      onPressed: onPressed,
      child: Text(
        text!,
        style:const TextStyle(fontSize: 20),
      ),
    );
  }
}