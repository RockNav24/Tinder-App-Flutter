import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/data/db/entity/app_user.dart';
import 'package:tinder_app_flutter/ui/widgets/rounded_icon_button.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class SwipeCard extends StatefulWidget {
  final AppUser person;

  SwipeCard({@required this.person});

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.725,
            width: MediaQuery.of(context).size.width * 0.85,
            color: Colors.white,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(widget.person.profilePhotoPath,
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: getUserContent(context)),
              getBottomInfo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget getUserContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: Colors.white.withOpacity(.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.person.name,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                '  ${widget.person.filters}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          RoundedIconButton(
            onPressed: () {},
            iconData: Icons.person,
            iconSize: 16,
            buttonColor: kColorPrimaryVariant,
          ),
        ],
      ),
    );
  }

  Widget getBottomInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: kAccentColor,
          thickness: 1.5,
          height: 0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.white.withOpacity(.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    widget.person.bio.length > 0
                        ? widget.person.bio
                        : "No bio.",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
