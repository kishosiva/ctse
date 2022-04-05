// ignore_for_file: curly_braces_in_flow_control_structures, sized_box_for_whitespace
import 'package:ctse_frontend/View/SprintTaskPage.dart';
import 'package:ctse_frontend/View/TicketPage.dart';
import 'package:flutter/material.dart';
import 'package:ctse_frontend/colors/colors.dart';
import 'Add/addProject.dart';
import 'Edit/editProject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SprintPage(title: 'ScrumBoard'),
    );
  }
}

class SprintPage extends StatefulWidget {
  const SprintPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<SprintPage> createState() => _SprintPageState();
}

class _SprintPageState extends State<SprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 150,
                width: 300,
                child: Image.asset('assets/images/scrum.jpg')),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 400,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SprintTaskPage(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              children: const <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.book,
                                    color: Colors.green,
                                  ),
                                  title: Text(
                                    'Projects',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 260, top: 70),
                                child: Row(children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: Colors.teal,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Edit_Project(),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.green1,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Add_project(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: colors.Navbarcolor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SprintPage(
                            title: '',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.home_outlined),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Edit",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //right
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TicketPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.book),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ticket",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.settings
                            // color: Colors.black,
                            ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
