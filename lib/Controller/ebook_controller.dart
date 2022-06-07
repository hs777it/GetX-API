import 'package:get/get.dart';

import '../Models/ebook.dart';
import '../Services/services.dart';

class BookController extends GetxController {
  var isLoading = true.obs;
  var bookList = <Ebook>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    isLoading(true);
    try {
      var ebooks = await DataServices.getEbooks();
      bookList.value = ebooks;
    } finally {
      isLoading(false);
    }
  }
}
