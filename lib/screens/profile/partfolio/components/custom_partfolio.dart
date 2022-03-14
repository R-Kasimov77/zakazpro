import 'package:flutter/material.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class CustomParfolio extends StatelessWidget {
  const CustomParfolio({Key? key}) : super(key: key);

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "Сварщик",
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/review_screen');
                        },
                        child: Icon(Icons.border_color_outlined)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis eleifend ex. Nulla et \nmetus ac ante porttitor sollicitudin.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ScaleAnimationContainer(
                      onPressed: () {},
                      child: Icon(
                        Icons.photo_outlined,
                        color: Colors.black,
                        size: 54,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
