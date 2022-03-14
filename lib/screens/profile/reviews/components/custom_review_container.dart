import 'package:flutter/material.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 6, left: 6, bottom: 12, top: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text( 
                        "photo",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Юрий  Сардаров",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 40,
                  )
                ],
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis eleifend ex. Nulla et \nmetus ac ante porttitor sollicitudin.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
