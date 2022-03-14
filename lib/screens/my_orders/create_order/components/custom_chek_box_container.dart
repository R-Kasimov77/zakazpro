import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({Key? key}) : super(key: key);

  final ValueNotifier<bool> isOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOpen,
      builder: (context, str, _) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(value: false, onChanged: (context) {}),
                Text("Сварка"),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RotatedBox(
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
                )
              ],
            ),
            if (isOpen.value)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (context) {}),
                        Text("Трубы")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (context) {}),
                        Text("металокаркас")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (context) {}),
                        Text("Забор")
                      ],
                    ),
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}
