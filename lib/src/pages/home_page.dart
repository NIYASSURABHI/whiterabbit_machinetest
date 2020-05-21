import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:api_to_sqlite_flutter/src/pages/details.dart';
import 'package:api_to_sqlite_flutter/src/providers/db_provider.dart';
import 'package:api_to_sqlite_flutter/src/providers/employee_api_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
 // final List<Employee> employee;
  @override
  void initState() {
    _loadFromApi().then((value){
      print('Async done');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),

        ],

      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmployeeApiProvider();
    await apiProvider.getAllEmployees();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }



  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {


                return ListTile(
                  onTap: ()=>{
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Details(itemHol:snapshot.data[index] ),
                  ),
                  )
                  },
                  leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: snapshot.data[index].avatar != null ? NetworkImage(snapshot.data[index].avatar) :  NetworkImage('https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg')
                  ),
                  title: Text('Name: ${snapshot.data[index].phone}'),
                  subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
                );


            },
          );
        }
      },
    );
  }
}

//getItemAndNavigate(String item, BuildContext context){
//  Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) => Details(itemHolder : item)
//      )
//  );
//}
