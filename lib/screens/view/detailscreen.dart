import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    ApiProvider apiProviderFalse =
        Provider.of<ApiProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            apiProvider.recipes!.recipe![apiProvider.index].name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 380,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(apiProvider
                            .recipes!.recipe![apiProvider.index].image
                            .toString()),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'instructions :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(apiProvider.recipes!.recipe![apiProvider.index]
                      .instructions![index]),
                ),
                itemCount: apiProvider
                    .recipes!.recipe![apiProvider.index].instructions!.length,
              ),
            ),
            Text(
              'ingredients :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) => Text(apiProvider
                    .recipes!.recipe![apiProvider.index].ingredients![index]),
                itemCount: apiProvider
                    .recipes!.recipe![apiProvider.index].ingredients!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
