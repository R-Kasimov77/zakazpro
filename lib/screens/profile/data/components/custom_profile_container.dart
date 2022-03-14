import 'package:flutter/material.dart';

class CustomProfileContainer extends StatelessWidget {
  final String text;
  const CustomProfileContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/my_job_screen');
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              width: 100,
              child: Row(
                children: [
                  Icon(
                    Icons.close,
                    size: 24,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
