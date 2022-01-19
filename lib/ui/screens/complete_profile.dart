import 'package:flutter/material.dart';

import 'package:tinder_app_flutter/ui/widgets/profile_heading.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class CompleteProfileScreen extends StatefulWidget {
  static String id = 'completeProfileScreen';
  const CompleteProfileScreen({Key key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeading(
                    icon: Icons.photo,
                    title: 'Gallery',
                    iconIcon: Icons.upload,
                    iconText: 'Upload',
                  ),
                  const Divider(),
                  SizedBox(
                    height: 300,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        );
                      },
                    ),
                  ),
                  const ProfileHeading(
                    icon: Icons.person,
                    title: 'My Info',
                    iconIcon: Icons.edit,
                    iconText: 'Edit',
                  ),
                  const Divider(),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Select your identity',
                            style: greyTextBold,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '0/4 Profile Questions',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ProfileHeading(
                    icon: Icons.location_pin,
                    title: 'Location',
                  ),
                  const Divider(),
                  const ProfileHeading(
                    icon: Icons.filter_alt,
                    title: 'Filters',
                    iconIcon: Icons.edit,
                    iconText: 'Edit',
                  ),
                  const Divider(),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Set yout match filters...',
                            style: greyTextBold,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '0 Filters applied',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
