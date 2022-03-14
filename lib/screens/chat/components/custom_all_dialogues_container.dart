import 'package:flutter/material.dart';

class CustomAllDialoguesContainer extends StatelessWidget {
  const CustomAllDialoguesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      "Photo",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Сергей Петров"),
                  Spacer(),
                  Text("12 сообщеиний"),
                  Text(
                    "(1)",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("новое")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
