import 'package:butter/Models/Category.dart';
import 'package:butter/Services/category_service.dart';
import 'package:butter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Categories_screen extends StatefulWidget {
  const Categories_screen({Key? key}) : super(key: key);

  @override
  _Categories_screenState createState() => _Categories_screenState();
}

class _Categories_screenState extends State<Categories_screen> {
  var _categoryName = TextEditingController();
  var _categorydesc = TextEditingController();

  var category = Category();
  var categoryservices = CategoryServices();
  _showdialogbox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(onPressed: () {}, child: Text("Cancel")),
              FlatButton(
                  onPressed: () {
                    category.name = _categoryName.text;
                    category.description = _categorydesc.text;
                    categoryservices.saveCategory(category);
                  },
                  child: Text("Save"))
            ],
            title: Text("Category Form"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryName,
                    decoration: InputDecoration(
                        labelText: "Category Name",
                        hintText: "Enter your category name"),
                  ),
                  TextField(
                    controller: _categorydesc,
                    decoration: InputDecoration(
                        labelText: "Category Description",
                        hintText: "Enter your category Description"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        leading: RaisedButton(
          color: Colors.purple,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (contex) {
              return HomeScreen();
            }));
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Center(child: Text("here the categories can be viewed")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showdialogbox(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
