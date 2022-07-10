import 'package:coco_explorer/features/explorer/presentation/providers/tags_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagWidget extends StatelessWidget {
  final String tag;

  const TagWidget({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TagsSelectedProvider>(context, listen: false)
            .removeTag(tag);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(tag),
      ),
    );
  }
}
