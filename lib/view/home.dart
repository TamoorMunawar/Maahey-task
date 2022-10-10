import 'package:flutter/material.dart';
import 'package:maheey_task/constant/app_large_text.dart';
import 'package:maheey_task/controller/brewery_controller.dart';
import 'package:maheey_task/model/Brewery.dart';
import 'package:maheey_task/view/detail_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ApiService().getProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          title: const Text("Maahey Task"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLargeText(
                      text: "Set your Intrest",
                      color: Colors.black,
                      size: 26,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppLargeText(
                      text:
                          "You will gain more information about your goals in your dashboard",
                      color: Colors.black,
                      size: 10,
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  future: ApiService().getProducts(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        height: 500,
                        width: 330,
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductDetails(
                                                              brewery: snapshot
                                                                      .data![
                                                                  index])));
                                            },
                                            icon: Icon(Icons.square_outlined)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data![index].name!),
                                            Text(snapshot.data![index].id!)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                              brewery: snapshot.data![index])));
                                },
                              );
                            })),
                      );
                    }
                  })),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Text("Continue"),
                  ))
            ],
          ),
        ));
  }
}
