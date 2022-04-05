// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
    Project({
        this.data,
        this.totalRecords,
    });

    List<Datum> data;
    int totalRecords;

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalRecords": totalRecords,
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.createdDate,
        this.admin,
        this.member,
        this.sprint,
    });

    String id;
    String name;
    DateTime createdDate;
    List<String> admin;
    List<String> member;
    List<Sprint> sprint;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        createdDate: DateTime.parse(json["createdDate"]),
        admin: List<String>.from(json["admin"].map((x) => x)),
        member: List<String>.from(json["member"].map((x) => x)),
        sprint: List<Sprint>.from(json["sprint"].map((x) => Sprint.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdDate": createdDate.toIso8601String(),
        "admin": List<dynamic>.from(admin.map((x) => x)),
        "member": List<dynamic>.from(member.map((x) => x)),
        "sprint": List<dynamic>.from(sprint.map((x) => x.toJson())),
    };
}

class Sprint {
    Sprint({
        this.id,
        this.name,
        this.startDate,
        this.dueDate,
        this.task,
    });

    dynamic id;
    String name;
    DateTime startDate;
    DateTime dueDate;
    List<String> task;

    factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
        id: json["_id"],
        name: json["name"],
        startDate: DateTime.parse(json["startDate"]),
        dueDate: DateTime.parse(json["dueDate"]),
        task: List<String>.from(json["task"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "startDate": startDate.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
        "task": List<dynamic>.from(task.map((x) => x)),
    };
}
