import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class FilterScreen extends StatefulWidget {
  final Function(List) onChanged;

  FilterScreen({@required this.onChanged});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List filters = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'filters',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              child: TextFieldTags(
                onDelete: (String tag) {
                  filters.remove(tag);
                  widget.onChanged(filters);
                },
                onTag: (String tag) {},
                tagsStyler: TagsStyler(
                  tagTextStyle: TextStyle(color: Colors.white70),
                  tagDecoration: BoxDecoration(color: kAccentColor),
                  tagCancelIcon: const Icon(
                    Icons.cancel,
                    size: 18.0,
                  ),
                ),
                textFieldStyler: TextFieldStyler(),
                validator: (tag) {
                  if (tag.length <= 0) {
                    return "Too short";
                  } else if (tag.length > 20) {
                    return "Too long";
                  } else {
                    if (filters.length < 10) {
                      filters.add(tag);
                      widget.onChanged(filters);
                    } else {
                      return "Maximum filters are 10";
                    }
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
