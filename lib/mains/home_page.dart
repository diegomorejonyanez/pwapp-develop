
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myProfilePicture =
      'https://th.bing.com/th/id/R881434f403f86ed30da92956e8497c24?rik=UqimhWXh7flAww&riu=http%3a%2f%2fcdn2.upsocl.com%2fwp-content%2fuploads%2fimmujer%2f2015%2f01%2fiStock_000036462246_Large.jpg&ehk=0EvkSwFnHCiI1hAOaQLqCe21pqZiSmf9dWOe%2fKDH9mU%3d&risl=&pid=ImgRaw';
  List<Map<dynamic, dynamic>> historiesList = [
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'profile': '',
      'name': 'Cristina',
      'location': 'Ubicación'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'profile': '',
      'name': 'Cristina',
      'location': 'Ubicación'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'profile': '',
      'name': 'Cristina',
      'location': 'Ubicación'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'profile': '',
      'name': 'Cristina',
      'location': 'Ubicación'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'profile': '',
      'name': 'Cristina',
      'location': 'Ubicación'
    }
  ];

  List<Map<dynamic, dynamic>> peopleList = [
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'name': 'Ramona',
      'location': 'Ubicación',
      'age': '21'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'name': 'Ramona',
      'location': 'Ubicación',
      'age': '21'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'name': 'Ramona',
      'location': 'Ubicación',
      'age': '21'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'name': 'Ramona',
      'location': 'Ubicación',
      'age': '21'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'name': 'Ramona',
      'location': 'Ubicación',
      'age': '21'
    },
    {
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'name': 'Ramona',
      'location': 'Ubicación',
      'age': '21'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Historias',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                InkWell(child: Text('Ver todas'))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(myProfilePicture),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      Text('Mi historia')
                    ],
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(80)),
                width: MediaQuery.of(context).size.width - 110,
                height: 100,
                child: FutureBuilder(
                    initialData: historiesList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisCount: 1,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: historiesList.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<dynamic, dynamic> history =
                                historiesList[index];
                            return InkWell(
                                child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            history['image'],
                                          )),
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Text(history['name'])
                              ],
                            ));
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder(
                    initialData: peopleList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                  crossAxisSpacing: 20),
                          scrollDirection: Axis.vertical,
                          itemCount: peopleList.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<dynamic, dynamic> people = peopleList[index];
                            return InkWell(
                                child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(people['image']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        people['name'] + ' ' + people['age'],
                                        style: TextStyle(fontSize: 12),
                                      )),
                                ],
                              ),
                            ));
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          )
        ],
      ),
    );
  }
}
