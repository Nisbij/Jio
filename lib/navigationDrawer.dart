import 'package:flutter/material.dart';
import "package:my_app/custom_expansion_tile.dart" as custom;
import 'package:my_app/routes/pageRoutes.dart';
import './components/account.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color(0xff5352ed),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            child: DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Icon(
                    Icons.account_circle,
                    size: 50.0,
                    color: Colors.white,
                  )),
                  SizedBox(width: 20),
                  Text(
                    "+910000000000",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 0.2, color: Colors.white),
              )),
            ),
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(width: 1.0, color: Colors.white),
            //   )
            // ),
          ),
          ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: Align(
                child: new Text(
                  "Accounts",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                alignment: Alignment(-1.2, 0),
              ),
              onTap: () => Navigator.pushReplacementNamed(context, pageRoutes.account),
                  ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, pageRoutes.homepage),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "Notifications",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
          ),
          custom.ExpansionTile(
            headerBackgroundColor: Colors.transparent,
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            iconColor: Colors.white,
            title: Align(
              child: new Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            children: [
              ListTile(
                title: Align(
                  child: new Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Align(
                  child: new Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "FAQ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "About",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.subject,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "Terms and Conditions",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.5, 0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "Policy",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
              color: Colors.white,
            ),
            title: Align(
              child: new Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              alignment: Alignment(-1.2, 0),
            ),
          ),
        ],
      ),
    ));
  }
}
