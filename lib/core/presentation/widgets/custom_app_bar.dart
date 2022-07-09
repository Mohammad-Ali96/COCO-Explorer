import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool useCustomIconForActions;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Widget? flexibleSpace;

  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
    this.leading,
    this.useCustomIconForActions = true,
    this.title,
    this.actions,
    this.centerTitle,
    this.flexibleSpace,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> newActions = [];
    if (actions == null) {
      newActions = [];
    } else {
      if (useCustomIconForActions) {
        newActions.addAll(
          actions!
              .map(
                (action) => CustomAppBarIcon(
                  child: action,
                ),
              )
              .toList(),
        );
        newActions.add(const SizedBox(width: 16.0));
      } else {
        newActions = actions!;
      }
    }
    return AppBar(
      leading: leading != null
          ? CustomAppBarIcon(
              child: leading!,
            )
          : null,
      title: title,
      centerTitle: centerTitle,
      actions: newActions,
      flexibleSpace: flexibleSpace,
    );
  }
}

class CustomAppBarIcon extends StatelessWidget {
  final Widget child;

  const CustomAppBarIcon({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 6.0, bottom: 6.0),
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
