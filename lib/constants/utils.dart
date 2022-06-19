import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

 // https://stackoverflow.com/questions/66833689/flutter-no-scaffoldmessenger-widget-found ----> this link fixed
/*ScaffoldMessenger.of(context).showSnackBar( old code there was a error that "" Flutter : No ScaffoldMessenger widget found ""
    SnackBar(
      content: Text(text),
    ),
  );*/
