import 'package:alquran/app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al Quran Apps'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Assalamualaikum',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => Get.toNamed(Routes.LAST_READ),
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [appPurpleLight1, appPurpleDark])),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -52,
                    right: 0,
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        "assets/images/alquran.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.menu_book_rounded,
                              color: appWhite,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Terakhir dibaca",
                              style: TextStyle(
                                color: appWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Al-Fatihah",
                          style: TextStyle(
                            color: appWhite,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "Juz 1 | Ayat 5",
                          style: TextStyle(
                            color: appWhite,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          DefaultTabController(
            length: 3,
            child: TabBar(tabs: [
              Tab(
                child: Text(
                  "Surah",
                  style: TextStyle(
                    color: appPurpleDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Juz",
                  style: TextStyle(
                    color: appPurpleDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Bookmark",
                  style: TextStyle(
                    color: appPurpleDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
      // body: FutureBuilder<List<Surah>>(
      //   future: controller.getAllSurah(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: Text("Tidak ada data"),
      //       );
      //     }
      //
      //     return ListView.builder(
      //         itemCount: snapshot.data!.length,
      //         itemBuilder: (context, index) {
      //           var surah = snapshot.data![index];
      //           return ListTile(
      //             onTap: (){
      //               Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
      //             },
      //             leading: CircleAvatar(
      //               child: Text("${surah.number}"),
      //             ),
      //             title: Text(surah.name?.transliteration?.id ?? "Error..."),
      //             subtitle: Text("${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error...'}"),
      //             trailing: Text("${surah.name?.short ?? 'Error...'}"),
      //           );
      //         });
      //   },
      // ),
    );
  }
}
