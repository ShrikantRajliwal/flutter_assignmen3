class TaskData {
  String? title;
  String? description;
  String? date;

  TaskData({this.description, this.title,this.date});
}

List<TaskData> getData() {
  return [
    TaskData(title: "Grocery Shopping", description: "some random description",date: "12/02/2022"),
    TaskData(title: "Project Presentation", description: "some random description",date: "12/02/2022"),
    TaskData(title: "Book Appointment", description: "some random description",date: "12/02/2022"),
    TaskData(title: "Pay Bills", description: "some random description",date: "12/02/2022"),
  ];
}
