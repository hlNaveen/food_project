import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utility/dimention.dart';
import '../../widgets/dialogwidgetadduser.dart';

class Admin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text('Welcome Admin',style: TextStyle(fontSize: 25),),
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.grey[700],
            child: ListView(
              children: [
                Container(
                  height: Dimensions.height10*7,
                  child:Row(
                    children: [
                      Icon(Icons.account_circle,size: 60,),
                      SizedBox(
                        width: Dimensions.width30*2,
                      ),
                      Container(
                        height: Dimensions.height10*4,
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.white)),
                        ),
                      )
                    ],
                  ) ,
                ),
                SizedBox(
                  height: Dimensions.height20*2,
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return MyDialog();
                          }
                      );
                    },
                    child: Text('Create New Admin Account',style: TextStyle(fontSize: 18,color: Colors.white),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        side: MaterialStateProperty.all(BorderSide.none)
                    ),
                  ),
                  trailing: Icon(Icons.add_box_rounded,size: 40,),
                  onTap: (){},
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: (){},
                    child: Text('Update Password',style: TextStyle(fontSize: 18,color: Colors.white),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        side: MaterialStateProperty.all(BorderSide.none)
                    ),
                  ),
                  trailing: Icon(Icons.password_outlined,size: 40,),
                  onTap: (){},
                )
              ],
            ),
          ),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    height: 400,
                    width: 350,
                    child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Text('Admin Tools',style: TextStyle(fontSize: 25,color: Colors.black),),
                          Container(
                            height: Dimensions.height20*2,
                          ),
                          Container(
                            height: 50,
                            width: 270,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.grey[700]
                            ),
                            child: OutlinedButton(
                              onPressed: (){},
                              child: Text('Manage Orders',style: TextStyle(fontSize: 18,color: Colors.white),),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10*5,
                          ),
                          Container(
                            height: Dimensions.height10*5,
                            width: 270,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.grey[700]
                            ),
                            child: OutlinedButton(
                              onPressed: (){},
                              child: Text('Update Menu',style: TextStyle(fontSize: 18,color: Colors.white),),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10*5,
                          ),
                          Container(
                            height: Dimensions.height10*5,
                            width: 270,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.grey[700]
                            ),
                            child: OutlinedButton(
                              onPressed: (){},
                              child: Text('Manage Reviews',style: TextStyle(fontSize: 18,color: Colors.white),),
                            ),
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}