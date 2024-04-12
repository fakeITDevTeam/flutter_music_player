import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common/color_extension.dart';
import 'package:music_player/common_widget/recommended_cell.dart';
import 'package:music_player/common_widget/title_section.dart';
import 'package:music_player/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: (){}, 
          icon: Image.asset(
            "assets/img/menu.png", 
            width: 25, 
            height: 25, 
            fit: BoxFit.contain,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 38,                
                decoration: BoxDecoration(
                  color: const Color(0xFF292E4B),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: TextField(
                  controller: homeVM.txtSearch.value,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 30,
                      child: Image.asset(
                        "assets/img/search.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: TColor.primaryText28,
                      ),
                    ),
                    hintText: "Search song album",
                    hintStyle: TextStyle(
                      color: TColor.primaryText28,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(title: "Hot Recommended"),
            SizedBox(
              height: 195,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10, 
                  vertical: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: homeVM.hostRecommendedArr.length,
                itemBuilder: (context, index) {
                  var mObj = homeVM.hostRecommendedArr[index];

                  return RecommendedCell(mObj: mObj);
                }
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}