import 'package:flutter/material.dart';

class CustomAnswerContainer extends StatelessWidget {
  const CustomAnswerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "Сегодня в 18:19",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.photo,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Text("Сергей Петров", style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis eleifend ex. Nulla et metus ac ante porttitor sollicitudin.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
