import 'package:flutter/material.dart';
import 'package:zakazpro/logic/profile/cubit/profile_cubit.dart';

class CustomPersonData extends StatefulWidget {
  final String text;
  final Icon icon;
  const CustomPersonData({Key? key, required this.text, 
  required this.icon
  })
      : super(key: key);

  @override
  State<CustomPersonData> createState() => _CustomPersonDataState();
}

class _CustomPersonDataState extends State<CustomPersonData> {
  final cubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 24,
          ),
          widget.icon
        ],
      ),
    );
  }
}
