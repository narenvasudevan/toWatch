import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'listPage.dart';

class ToWatchHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TO-DO',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 35.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'MPLUS'),
            ),
            Text(
              'TO-WATCH',
              style: TextStyle(
                  fontSize: 45.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'MPLUS'),
            ),
            Text(
              'LIST',
              style: TextStyle(
                  fontSize: 45.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'MPLUS'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(32.0),
                  ),
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListPage();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // SizedBox(
                      //   width: 10.0,
                      // ),
                      Icon(
                        MdiIcons.google,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Sign in using Google  ',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
