import 'package:coco_explorer/features/explorer/domain/utils/constant/categories_ids.dart';
import 'package:flutter/material.dart';

class TagsSelectedProvider extends ChangeNotifier {
  final Map<String, int> tags = {};

  void addNewTag(String tag) {
    if (!tags.containsKey(tag) && categoriesToId.containsKey(tag)) {
      tags.putIfAbsent(tag, () => categoriesToId[tag]!);
      notifyListeners();
    }
  }

  void removeTag(String tag) {
    if (tags.containsKey(tag)) {
      tags.remove(tag);
      notifyListeners();
    }
  }

  List<String> get selectedTags => [...tags.keys];
}
