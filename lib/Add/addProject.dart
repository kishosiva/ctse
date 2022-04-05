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
    
ProjectController projectController =Get.put(ProjectController());

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
                "${createdDate.toLocal()}".split(' ')[0],
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
                    onPressed:  () {
                      
                     if (projectController.isProcessing.value == false) {
                                
                                saveProject(
                                   projectController.pronameEditingController.text,
                                   createdDate.toLocal(),
                                   projectController.adminEditingController.text,
                                   projectController.memberEditingController.text,
                                   );
                              }
                              
                              
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
                      onPressed: () {},
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
  void saveProject(String name, DateTime createdDate, String admin, String member) {
    projectController.saveProject(
        {'name': name, 'createdDate': createdDate, 'admin': admin, 'member': member});
    Get.back();
  }
}

_selectDate(BuildContext context) {}
