import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_controller.dart';

class WallSnapSetting extends StatelessWidget {
  const WallSnapSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("Home");
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
        title: Text(
          'SETTINGS',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        backgroundColor: Provider.of<Apicontroller>(context).isDark
            ? Colors.transparent.withOpacity(0)
            : Colors.white,
      ),
      body: Consumer<Apicontroller>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text(
                  'Dark Theme',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  'Better for eyesight & battery life',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                ),
                value: provider.isDark,
                onChanged: (val) {
                  provider.setisDark(val);
                },
              ),
              SwitchListTile(
                title: Text(
                  'Editors Choice',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "Select images that have received an Editor's Choice award.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                ),
                value: provider.iseditorschoice,
                onChanged: (val) {
                  provider.setiseditorschoice(val);
                },
              ),
              SwitchListTile(
                title: Text(
                  'Safe Search',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "A flag indicating that only images suitable for all ages should be returned.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                ),
                value: provider.issafesearch,
                onChanged: (val) {
                  provider.setissafesearch(val);
                  print("value:$val");
                },
              ),
              ListTile(
                title: Text(
                  'About ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "WallSnap & V1.0.1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                ),
              ),
              ListTile(
                title: Text(
                  'Copyright Information',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "All the Wallpaper are property of WallSnap's walls. you can use it for your personal use only. any distribution or sharing is not allowed without the permission of the owner",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'More',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Provider.of<Apicontroller>(context).isDark
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Ask a Question',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'F A Q',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
