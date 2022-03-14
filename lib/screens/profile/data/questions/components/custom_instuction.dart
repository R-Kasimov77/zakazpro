import 'package:flutter/material.dart';

class CustomInstruction extends StatelessWidget {
  final String text;
  CustomInstruction({Key? key, required this.text}) : super(key: key);

  final ValueNotifier<bool> isOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOpen,
      builder: (context, str, _) {
        return Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(text),
                  Spacer(),
                  RotatedBox(
                    quarterTurns: isOpen.value ? 2 : 4,
                    child: InkWell(
                      onTap: () {
                        isOpen.value = !isOpen.value;
                      },
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
              if (isOpen.value)
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "инструкция:",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
