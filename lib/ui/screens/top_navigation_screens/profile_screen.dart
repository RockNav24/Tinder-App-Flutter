import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:tinder_app_flutter/data/db/entity/app_user.dart';
import 'package:tinder_app_flutter/data/provider/user_provider.dart';
import 'package:tinder_app_flutter/ui/screens/start_screen.dart';
import 'package:tinder_app_flutter/ui/widgets/custom_modal_progress_hud.dart';
import 'package:tinder_app_flutter/ui/widgets/input_dialog.dart';
import 'package:tinder_app_flutter/ui/widgets/rounded_button.dart';
import 'package:tinder_app_flutter/ui/widgets/rounded_icon_button.dart';
import 'package:tinder_app_flutter/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List _filters = [];
  int selectedRadio = 0;

  void logoutPressed(UserProvider userProvider, BuildContext context) async {
    userProvider.logoutUser();
    Navigator.pop(context);
    Navigator.pushNamed(context, StartScreen.id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Container(
          child: SingleChildScrollView(
            child:
                Consumer<UserProvider>(builder: (context, userProvider, child) {
              return FutureBuilder<AppUser>(
                future: userProvider.user,
                builder: (context, userSnapshot) {
                  return CustomModalProgressHUD(
                    inAsyncCall:
                        userProvider.user == null || userProvider.isLoading,
                    child: userSnapshot.hasData
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                  child: getProfileImage(
                                      userSnapshot.data, userProvider)),
                              SizedBox(height: 20),
                              Center(
                                child: Text(userSnapshot.data.name,
                                    style:
                                        Theme.of(context).textTheme.headline4),
                              ),
                              Divider(),
                              filtersSection(
                                  context, userSnapshot, userProvider),
                              SizedBox(height: 40),
                              Divider(),
                              socialMediaSection(context),
                              SizedBox(height: 40),
                              Divider(),
                              topicsSection(context, "Programming"),
                              SizedBox(height: 40),
                              Divider(),
                              recordingStyleSection(
                                  context, kRecordingStyle[0]),
                              SizedBox(height: 40),
                              Divider(),
                              podcastLengthSection(context, "1.30"),
                              SizedBox(height: 40),
                              Divider(),
                              getBio(userSnapshot.data, userProvider),
                              SizedBox(
                                height: 50,
                              ),
                              RoundedButton(
                                text: 'LOGOUT',
                                onPressed: () {
                                  logoutPressed(userProvider, context);
                                },
                              ),
                            ],
                          )
                        : Container(),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Column podcastLengthSection(BuildContext context, String length) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Podcast Length',
                style: Theme.of(context).textTheme.headline4),
            RoundedIconButton(
              onPressed: () {},
              iconData: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
            ),
          ],
        ),
        Text(
          length.toString(),
          style: profileSubTextStyle,
        ),
      ],
    );
  }

  Column recordingStyleSection(BuildContext context, recordingStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recording style',
                style: Theme.of(context).textTheme.headline4),
            RoundedIconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      setSelectedRadio(int val) {
                        setState(() {
                          selectedRadio = val;
                        });
                      }

                      return SimpleDialog(
                        children: <Widget>[
                          RadioListTile(
                            value: 1,
                            groupValue: selectedRadio,
                            activeColor: kAccentColor,
                            title: Text("Audio"),
                            onChanged: (val) {
                              setSelectedRadio(val);
                            },
                          ),
                          RadioListTile(
                            value: 2,
                            groupValue: selectedRadio,
                            title: Text("Video"),
                            activeColor: kAccentColor,
                            onChanged: (val) {
                              setSelectedRadio(val);
                            },
                          ),
                          RadioListTile(
                            value: 3,
                            groupValue: selectedRadio,
                            title: Text("Both"),
                            activeColor: kAccentColor,
                            onChanged: (val) {
                              setSelectedRadio(val);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            child: RoundedButton(
                                text: "Done",
                                onPressed: () {
                                  // todo add firebase functionality
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      );
                    });
                  },
                );
              },
              iconData: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          recordingStyle,
          style: profileSubTextStyle,
        ),
      ],
    );
  }

  Column topicsSection(BuildContext context, String topics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Topics of podcast',
                style: Theme.of(context).textTheme.headline4),
            RoundedIconButton(
              onPressed: () {},
              iconData: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
            ),
          ],
        ),
        Text(
          topics,
          style: profileSubTextStyle,
        ),
      ],
    );
  }

  Column socialMediaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Social Media', style: Theme.of(context).textTheme.headline4),
            RoundedIconButton(
              onPressed: () {},
              iconData: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            socialMediaIcon(
              context,
              kSocialMediaImages["fb"],
            ),
            socialMediaIcon(
              context,
              kSocialMediaImages["twitter"],
            ),
            socialMediaIcon(
              context,
              kSocialMediaImages["instagram"],
            ),
          ],
        )
      ],
    );
  }

  InkWell socialMediaIcon(BuildContext context, ImageProvider image) {
    return InkWell(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: MediaQuery.of(context).size.width * 0.05,
        backgroundImage: image,
        foregroundImage: image,
      ),
      onTap: () {},
    );
  }

  Column filtersSection(BuildContext context,
      AsyncSnapshot<AppUser> userSnapshot, UserProvider userProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filters', style: Theme.of(context).textTheme.headline4),
            RoundedIconButton(
              onPressed: () {
                _filters = userSnapshot.data.filters;
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: TextFieldTags(
                      initialTags: List<String>.from(_filters),
                      onDelete: (String tag) {
                        _filters.remove(tag);
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
                          if (_filters.length < 10) {
                            _filters.add(tag);
                          } else {
                            return "Maximum filters are 10";
                          }
                        }
                        return null;
                      },
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text(
                          'CANCEL',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text(
                          'SAVE',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: () {
                          userProvider.updateUserFilters(_filters);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kAccentColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
              iconData: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
            ),
          ],
        ),
        Text('${userSnapshot.data.filters.toString()}'
            .replaceAll(RegExp(r"[\[\]]"), '')),
      ],
    );
  }

  Widget getBio(AppUser user, UserProvider userProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bio', style: Theme.of(context).textTheme.headline4),
            RoundedIconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => InputDialog(
                    onSavePressed: (value) => userProvider.updateUserBio(value),
                    labelText: 'Bio',
                    startInputText: user.bio,
                  ),
                );
              },
              iconData: Icons.edit,
              iconSize: 18,
              paddingReduce: 4,
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          user.bio.length > 0 ? user.bio : "No bio.",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget getProfileImage(AppUser user, UserProvider firebaseProvider) {
    return Stack(
      children: [
        Container(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePhotoPath),
            radius: 75,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kAccentColor, width: 1.0),
          ),
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: RoundedIconButton(
            onPressed: () async {
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                firebaseProvider.updateUserProfilePhoto(
                    pickedFile.path, _scaffoldKey);
              }
            },
            iconData: Icons.edit,
            iconSize: 18,
          ),
        ),
      ],
    );
  }
}

void _launchUrl(Uri url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
