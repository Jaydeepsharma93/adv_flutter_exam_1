import 'package:adv_flutter_exam_1/screens/controller/provider/provider.dart';
import 'package:adv_flutter_exam_1/screens/view/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    ApiProvider apiProviderFalse =
        Provider.of<ApiProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 20,
        title: Text('Recipes'),
        centerTitle: true,
      ),
      body: (apiProvider.isLoading)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 28,
                    backgroundImage: NetworkImage(
                        apiProvider.recipes!.recipe![index].image.toString()),
                  ),
                  title:
                      Text(apiProvider.recipes!.recipe![index].name.toString()),
                  trailing: Text("${apiProvider.recipes!.recipe![index].rating}"),
                  onTap: () {
                    apiProviderFalse.onChangeIndex(index);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                    ));
                  },
                ),
              ),
              itemCount: apiProvider.recipes!.recipe!.length,
            ),
    );
  }
}
