import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/resources/data/dto/badges_preview_model.dart';

final badgePreviewListProvider = Provider<List<BadgesPreviewModel>>((ref) {
  return [
    BadgesPreviewModel(
      title: "Global Learning Lab Leadership Academy Train-The-Trainer",
      path: "Laurel_Wreath_Badge_F.png",
    ),
    BadgesPreviewModel(
      title: "Global Learning Lab Global",
      path: "Laurel_Wreath_Badge_G.png",
    ),
    BadgesPreviewModel(
      title: "Global Learning Lab Global Trainer",
      path: "Laurel_Wreath_Badge_GT.png",
    ),
    BadgesPreviewModel(
      title: "Global Learning Lab Master Trainer",
      path: "Laurel_Wreath_Badge_MT.png",
    ),
    BadgesPreviewModel(
      title: "Global Learning Lab Sustainable Master Trainer",
      path: "Laurel_Wreath_Badge_SMT.png",
    ),
  ];
});
