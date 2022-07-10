import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/core/data/utils/configuration.dart';
import 'package:coco_explorer/features/explorer/domain/utils/constant/categories_ids.dart';
import 'package:coco_explorer/features/explorer/presentation/providers/tags_selected_provider.dart';
import 'package:coco_explorer/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class COCOImagesSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final categories = categoriesToId.keys.toList();

    final filteredCategories = categories
        .where((element) => element.contains(query) || query.contains(element))
        .toList();

    final String imageBaseUrl = getIt<Configuration>().imagesBaseUrl;
    return ListView.builder(
      itemCount: filteredCategories.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: SizedBox(
            width: 42,
            child: CachedNetworkImage(
              imageUrl:
                  '$imageBaseUrl/${categoriesToId[filteredCategories[index]]}.jpg',
              height: 40,
            ),
          ),
          title: Text(filteredCategories[index]),
          onTap: () {
            Provider.of<TagsSelectedProvider>(context, listen: false)
                .addNewTag(filteredCategories[index]);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => null;

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget buildResults(BuildContext context) => const SizedBox();
}
