import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './bottom_bar_column.dart';
import './mail_and_address.dart';
import '../screens/about_us_screen.dart';
import '../screens/contact_us_screen.dart';

class BottomBar extends StatelessWidget {

  void openUrl(BuildContext context, String url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Some Error Occurred'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height / 6,
      margin: EdgeInsets.only(top: screenSize.height),
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(screenSize.aspectRatio * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: screenSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomBarColumn(
                      size: 3,
                      textData: ['ABOUT', 'Contact Us', 'About Us'],
                      functions: [
                        () => Navigator.of(context)
                            .pushNamed(ContactUsScreen.routeName),
                        () => Navigator.of(context)
                            .pushNamed(AboutUsScreen.routeName)
                      ],
                    ),
                    BottomBarColumn(
                      size: 3,
                      textData: ['HELP', 'FAQ', 'Developer Info'],
                      functions: [
                        () {},
                        () => openUrl(
                              context,
                              'https://www.linkedin.com/in/yashashm08052001/',
                            ),
                      ],
                    ),
                    BottomBarColumn(
                      size: 3,
                      textData: ['SOCIAL', 'Instagram', 'Spotify'],
                      functions: [
                        () => openUrl(
                            context, 'https://www.instagram.com/studio20two/'),
                        () => openUrl(context,
                            'https://open.spotify.com/artist/4qoIKtmQpvXsdv3fcynOxD?si=be-FC3zcRxWcFnhj-IpBog&utm_source=copy-link'),
                      ],
                    ),
                    SizedBox(
                      height:
                          screenSize.height / 6 - screenSize.aspectRatio * 8.3,
                      child: VerticalDivider(
                        thickness: 1.5,
                        color: Colors.blueGrey,
                      ),
                    ),
                    MailAndAddress(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width,
              child: Divider(
                thickness: 1.5,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              'Copyright © 2020 | STUDIO20TWO',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: screenSize.aspectRatio * 7,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
