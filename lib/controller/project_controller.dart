import 'package:ctse_frontend/model/project_model.dart';
import 'package:ctse_frontend/service/project_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ProjectController extends GetxController {
  var ProjectTask = List<Datum>.empty(growable: true).obs;
  var page = 0;
  var size = 4;
  var isDataProcessing = false.obs;

  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  TextEditingController pronameEditingController;
  TextEditingController adminEditingController;
  TextEditingController memberEditingController;
  
  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMoreProject(page);
    paginateProject();
     // To Save  Task
    pronameEditingController = TextEditingController();
    adminEditingController = TextEditingController();
    memberEditingController = TextEditingController();
  }

  Future<Project> getProjects(int page, int size) {
    return ProjectService.getProjects(page, size);
  }

  // For Pagination
  void paginateProject() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreProject(page);
      }
    });
  }

// Save Data
  void saveProject(Map data) {
    try {
      isProcessing(true);
      ProjectService().saveProject(data).then((resp) {
        // ignore: unrelated_type_equality_checks
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);
          showSnackBar("Add Project", "Project Added", Colors.green);
          ProjectTask.clear();
          refreshList();
        } else {
          showSnackBar("Add Project", "Failed to Add Project", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
  
  // Get More data
  void getMoreProject(var page) {
    try {
      getProjects(page, size).then((resp) {
        if (resp != null) {
          ProjectTask.addAll(resp.data);
          print("Service length : " + ProjectTask.length.toString());
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("Message", "No more items", Colors.black);
        }
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), Colors.pink);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), Colors.pink);
    }
  }

  // common snack bar
  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  // Refresh List
  void refreshList() async {
    page = 0;
    getProjects(page, size);
  }
  // clear the controllers
  void clearTextEditingControllers() {
    pronameEditingController.clear();
    adminEditingController.clear();
    memberEditingController.clear();
   
  }
  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    pronameEditingController.dispose();
    adminEditingController.dispose();
    memberEditingController.dispose();
   
    
  }
}
