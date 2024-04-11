import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/telescope_peovider.dart';
import 'package:flutter_application_2/utils/widget_functions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class BrandPage extends StatelessWidget {
  static const String routerName = 'brand';
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showSingleTextInputDialog(
            context: context, 
            title: 'Add Brand', 
            onSubmit: (value){
              EasyLoading.show(status: 'Please waite');
              Provider.of<TelescopeProvider>(context, listen: false)
              .addBrand(value)
              .then((value){
                EasyLoading.dismiss();
                showMsg(context, 'Brand added successfully');
              }); 
            });
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<TelescopeProvider>(
        builder: (context, provider, child) => 
        provider.brandList.isEmpty ?
        const Center(child: Text('No brands found')) :
        ListView.builder(
          itemCount: provider.brandList.length,
          itemBuilder: (context, index) {
          final brand = provider.brandList[index];
            return ListTile(
              title: Text(brand.name),
            );
        })        
      )
    );
  }
}
