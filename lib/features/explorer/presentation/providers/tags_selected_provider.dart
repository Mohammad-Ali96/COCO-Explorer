import 'package:coco_explorer/features/explorer/domain/utils/constant/categories_ids.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class TagsSelectedProvider extends ChangeNotifier {
  final Map<String, int> _tags = {};

  void addNewTag(String tag) {
    if (!_tags.containsKey(tag) && categoriesToId.containsKey(tag)) {
      _tags.putIfAbsent(tag, () => categoriesToId[tag]!);
      notifyListeners();
    }
  }

  void removeTag(String tag) {
    if (_tags.containsKey(tag)) {
      _tags.remove(tag);
      notifyListeners();
    }
  }

  List<String> get selectedTags => [..._tags.keys];
  List<int> get selectedImagesIds => [..._tags.values];
}
