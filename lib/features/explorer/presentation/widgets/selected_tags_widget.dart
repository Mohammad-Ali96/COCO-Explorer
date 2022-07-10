import 'package:coco_explorer/features/explorer/presentation/providers/tags_selected_provider.dart';
import 'package:coco_explorer/features/explorer/presentation/widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SelectedTagsWidget extends StatelessWidget {
  const SelectedTagsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TagsSelectedProvider>(
      builder: (ctx, provider, child) {
        return Container(
          constraints: const BoxConstraints(
            maxHeight: 140,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              padding: provider.selectedTags.isEmpty
                  ? EdgeInsets.zero
                  : const EdgeInsets.all(8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    provider.selectedTags.map((tag) => TagWidget(tag: tag)).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
