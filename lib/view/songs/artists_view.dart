import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common_widget/artists_row.dart';
import 'package:music_player/view/songs/artist_details_view.dart';
import 'package:music_player/view_model/artists_view_model.dart';

class ArtistsView extends StatefulWidget {
  const ArtistsView({super.key});

  @override
  State<ArtistsView> createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<ArtistsView> {
  final artistVM = Get.put(ArtistsViewModel());
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.sizeOf(context);
    // var cellWidth = (media.width - 40.0 - 20.0) * 0.5;
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          itemCount: artistVM.allList.length,
          itemBuilder: (context, index) {
            var aObj = artistVM.allList[index];

            return ArtistsRow(
              aObj: aObj, 
              onPressed: (){
                Get.to(() => const ArtistDetailsView());
              }, 
              onPressedMenuSelect: (selectIndex){}
            );
          }
        ),
      ),
    );
  }
}