import 'package:flutter/material.dart';

main(){
  runApp(MyDialog());
}

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New Admin'),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                hintText:'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: (){},
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: Text('Close'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
