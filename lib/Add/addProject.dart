import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ctse_frontend/Api/api.dart';
import 'package:ctse_frontend/controller/project_controller.dart';
import 'package:ctse_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Add_project extends StatefulWidget {
  const Add_project({Key key}) : super(key: key);

  @override
  State<Add_project> createState() => _Add_projectState();
}

// ignore: camel_case_types
class _Add_projectState extends State<Add_project> {
  DateTime createdDate = DateTime.now();

  String id;
  String name;
  String admin;
  String member;
  List add = ["ddd,dcac,dcec"];
  List add1 = ["dd,sass,ssss"];

  List<TextEditingController> controllers = [];

  List<TextEditingController> _color = [];
  List<TextEditingController> _brand = [];

  @override
  void initState() {
    print(add);
    print(add1);
    print(createdDate);

    // add.add(projectController.adminEditingController);
    // add1.add(projectController.adminEditingController);

    super.initState();
  }

  ProjectController projectController = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SprintPage(
                title: 'Projects',
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: new Container(
            child: new Center(
                child: new Column(children: [
              Text("Create Project ", style: TextStyle(fontSize: 20)),
              new Padding(padding: EdgeInsets.only(top: 50.0)),
              new TextFormField(
                controller: projectController.pronameEditingController,
                decoration: new InputDecoration(
                  labelText: "Enter Project Name",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              new Text(
                "${createdDate.toLocal()}",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: Colors.grey,
                ),
                onPressed: () => _selectDate(context),
              ),
              SizedBox(
                height: 30,
              ),
              new TextFormField(
                controller: projectController.adminEditingController,
                decoration: new InputDecoration(
                  labelText: "Admin",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              new TextFormField(
                controller: projectController.memberEditingController,
                decoration: new InputDecoration(
                  labelText: "Members",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    // ignore: deprecated_member_use
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 20,
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () async {
                              addFavourite();
                              // if (projectController.isProcessing.value ==
                              //     false) {
                              //   saveProject(
                              //     projectController
                              //         .pronameEditingController.text,
                              //     createdDate.toLocal(),
                              //     projectController.adminEditingController.text,
                              //     projectController
                              //         .memberEditingController.text,
                              //   );
                              // }
                            },
                            child: Text(
                              projectController.isProcessing.value == true
                                  ? 'Processing'
                                  : 'Create',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Align(
                    alignment: Alignment.bottomCenter,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () async {
                        signUp();
                      },
                      child:
                          const Text('Cancel', style: TextStyle(fontSize: 20)),
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ])),
          )),
    );
  }

  void addFavourite() async {
    setState(() {
      //   _isLoading = true;
    });
    try {
      var data = {
        "id": 11111,
        "name": "sssss",
        "createdDate": "2022-04-09",
        "admin": add,
        "member": add1,
      };
      var res = await CallApi().postData(data, '');
      var body = json.decode(res.body);
      print(body);

      // bodyErrorFav = body['message'];

      if (body != null) {
        print("sucess");
      } else {}
    } catch (e) {
      print(e);
    }
    setState(() {
      //  _isLoading = false;
    });
  }

  void saveProject(
      String name, DateTime createdDate, String admin, String member) {
    projectController.saveProject({
      'name': name,
      'createdDate': createdDate,
      'admin': admin,
      'member': member
    });
    Get.back();
  }

  Future signUp() async {
    if (projectController.adminEditingController.text.isNotEmpty) {
      // var response =
      //     await http.post('http://192.168.8.103:8080/api/v1/projects', body: {
      //   "name": "sssss",
      //   "createdDate": "2022-04-09",
      //   "admin": add,
      //   "member": add1,
      // });

      var response = await http.post(Uri.parse("http://192.168.8.103:8080/api/v1/projects"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": "sssss",
        "createdDate": "2022-04-09",
        "admin": add,
        "member": add1,
        }));

    print("response menu " + response.body.toString());
     //var link = json.decode(response.body);

      //print(verifylink);
      print("dddd");

      // showToast(
      //     "Thanks for registering with Flutter localhost. Please click this link to complete this registation",
      //     duration: 4,
      //     gravity: Toast.CENTER);
    } else {
      // showToast("Enter Username and password first",
      //     duration: 3, gravity: Toast.TOP);
    }
  }
}

_selectDate(BuildContext context) {}
