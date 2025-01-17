import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'abstract_section.dart';
import 'cupertino_settings_section.dart';
import 'settings_tile.dart';

import 'defines.dart';

// ignore: must_be_immutable
class SettingsSection extends AbstractSection {
  final List<AbstractTile>? tiles;
  final TextStyle? titleTextStyle;
  final int? maxLines;
  final Widget? subtitle;
  final EdgeInsetsGeometry subtitlePadding;

  SettingsSection({
    Key? key,
    String? title,
    Widget? titleWidget,
    EdgeInsetsGeometry titlePadding = defaultTitlePadding,
    this.maxLines,
    this.subtitle,
    this.subtitlePadding = defaultTitlePadding,
    this.tiles,
    this.titleTextStyle,
  })  : assert(maxLines == null || maxLines > 0),
        super(
          key: key,
          title: title,
          titleWidget: titleWidget,
          titlePadding: titlePadding,
        );

  @override
  Widget build(BuildContext context) {
    return CupertinoSettingsSection(
      tiles!,
      header: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null || titleWidget != null)
            titleWidget ??
                Text(
                  title!,
                  style: titleTextStyle,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
          if (subtitle != null)
            Padding(
              padding: subtitlePadding,
              child: subtitle,
            ),
        ],
      ),
      headerPadding: titlePadding!,
    );
  }
}
