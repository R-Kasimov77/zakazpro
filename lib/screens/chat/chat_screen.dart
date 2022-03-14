import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      "Photo",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Диалог с пользователем",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("Меркушев Сергей", style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 150,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Text(
                                        "photo",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text("Александр"),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Text(
                                        "Перейти в профиль",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text("+7(918)323-44-55"),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            "позвонить",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        height: 38,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.menu,
                      size: 38,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Text("У вас еще нет сообщений с \nэтим пользователем..."),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              height: 200,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Загрузить фото",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10),
                                      child: Center(
                                        child: Container(
                                          child: Center(child: Text("Из галлереи")),
                                          height: 44,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10),
                                      child: Center(
                                        child: Container(
                                          child: Center(child: Text("сделать фото с камеры")),
                                          height: 44,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.green.shade600,
                        ),
                      ),
                      prefixIcon: Icon(Icons.attach_file),
                      hintText: "ваш текст"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
