import 'package:alquran/app/constant/color.dart';
import 'package:alquran/app/data/models/surah.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Assalamualaikum',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            sectionLastRead(),
            sectionTabBarHome(),
          ],
        ),
      ),
    );
  }

  Widget sectionLastRead() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.LAST_READ),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                const LinearGradient(colors: [appPurpleLight1, appPurpleDark])),
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
    );
  }

  Widget sectionTabBarHome() {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              indicatorColor: appPurpleDark,
              labelColor: appPurpleDark,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Surah",
                ),
                Tab(
                  text: "Juz",
                ),
                Tab(
                  text: "Bookmark",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<List<Surah>>(
                    future: controller.getAllSurah(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text("Tidak ada data"),
                        );
                      }

                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var surah = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah);
                              },
                              leading: Container(
                                width: 36,
                                height: 36,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/shape.png"),
                                  ),
                                ),
                                child: Center(
                                  child: Text("${surah.number}"),
                                ),
                              ),
                              title: Text(surah.name?.transliteration?.id ??
                                  "Error..."),
                              subtitle: Text(
                                  "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error...'}"),
                              trailing:
                                  Text("${surah.name?.short ?? 'Error...'}"),
                            );
                          });
                    },
                  ),
                  ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/shape.png"),
                            ),
                          ),
                          child: Center(
                            child: Text("${index + 1}"),
                          ),
                        ),
                        title: Text("Juz ${index + 1}"),
                      );
                    },
                  ),
                  Center(child: Text("Bookmark")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
