import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../Controller/ebook_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final BookController _controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eBook'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return
          ListView.builder(
          itemCount: _controller.bookList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Html(data: _controller.bookList[index].bookTitle),
              trailing: ElevatedButton(
                child:const Text("PDF"),
                onPressed:(){
                  Get.snackbar(
                "PDF",
                "Open PDF ...",
                  icon: const Icon(Icons.picture_as_pdf_sharp, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blue,
                  borderRadius: 20,
                  margin: const EdgeInsets.all(15),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 4),
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.easeOutBack,
                );}
              ),
            );
          },
        );
      }),
    );
  }
}
