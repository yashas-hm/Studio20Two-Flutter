import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailAndAddress extends StatelessWidget {
  List<Widget> createWidgets(BuildContext context) {
    final textData = ['Email : ', 'Address : ', 'Phone : '];
    final description = [
      'mystudio20two@gmail.com',
      'Daffodils Plaza, 204, South Bopal, Ahmedabad, Gujarat 380058',
      '9979004750'
    ];
    final List<Function> functions = [
      () async {
        final url = 'mailto:${description[0]}';
        if (await canLaunch(url))
          await launch(url);
        else
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Some Error Occurred'),
            ),
          );
        print(description[0]);
      },
      () async {
        final url =
            'https://www.google.com/maps/place/Studio20Two/@23.02263,72.4718266,15z/data=!4m5!3m4!1s0x0:0xcfd1676906bad61d!8m2!3d23.02263!4d72.4718266';
        if (await canLaunch(url))
          await launch(url);
        else
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Some Error Occurred'),
            ),
          );
        print(description[1]);
      },
      () {},
    ];

    List<Widget> widgets = [];
    final screenSize = MediaQuery.of(context).size;
    for (int i = 0; i < 3; i++) {
      widgets.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              textData[i],
              style: TextStyle(
                fontSize: screenSize.aspectRatio*7+2,
                color: Colors.blueGrey,
              ),
            ),
            InkWell(
              hoverColor: Colors.blueGrey,
              onTap: () => functions[i](),
              child: Text(
                description[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.aspectRatio*7,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
      widgets.add(
        SizedBox(
          height: screenSize.aspectRatio*7,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: createWidgets(context),
      ),
    );
  }
}
