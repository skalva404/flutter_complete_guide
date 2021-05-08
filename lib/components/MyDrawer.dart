import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function _selectDestination;

  MyDrawer(this._selectDestination);

  Drawer build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Sunil Kalva",
                style: TextStyle(
                    fontSize: 25.0,
                    decorationStyle: TextDecorationStyle.solid,
                    color: Colors.deepPurple),
              ),
              accountEmail: Text("skalva404@gmail.com",
                  style: TextStyle(
                      fontSize: 15.0,
                      decorationStyle: TextDecorationStyle.solid,
                      color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.android
                        ? Colors.blue
                        : Colors.red,
                child: Text(
                  "SK",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: Text(
              'Color Quiz',
              style: TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              _selectDestination(0);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Animal Quiz',
              style: TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
            trailing: Icon(Icons.zoom_in_sharp, color: Colors.green),
            onTap: () {
              _selectDestination(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Dish Quiz',
              style: TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
            trailing: Icon(Icons.zoom_in_sharp, color: Colors.green),
            onTap: () {
              _selectDestination(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
