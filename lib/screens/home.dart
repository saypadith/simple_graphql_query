import 'package:flutter/material.dart';
import 'package:simple_graphql_query/models/book_model.dart';
import 'package:simple_graphql_query/providers/book_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple GraphQL"),
      ),
      body: Container(
        child: FutureBuilder<List<BooksModel>>(
            future: BooksProvider.fetAllAds(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error Occurred!");
              }
              return snapshot.hasData
                  ? Center(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, idx) {
                            BooksModel item = snapshot.data![idx];
                            return Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(item.bookName),
                                  Text("Author name: " + item.author),
                                  Text("Page no. "+item.pages.toString()),
                                ],
                              ),
                            ));
                            ;
                          }),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
