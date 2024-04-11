import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/telescope_peovider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewTelescopePage extends StatefulWidget {
  static const String routerName = 'viewtelescope';
  const ViewTelescopePage({super.key});

  @override
  State<ViewTelescopePage> createState() => _ViewTelescopePageState();
}

class _ViewTelescopePageState extends State<ViewTelescopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telescopes')),
      body: Consumer<TelescopeProvider>(
        builder: (context, provider, child) => ListView.builder(
            itemCount: provider.telescopeList.length,
            itemBuilder: (context, index) {
              final telescope = provider.telescopeList[index];
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const CircularProgressIndicator(
                                strokeWidth: 0.4,
                                color: Colors.grey,
                              ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          imageUrl: telescope.thumbnail.downloadUrl),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              telescope.brand.name,
                              style:
                                  const TextStyle(fontSize: 16, color: Colors.black, overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              telescope.model,
                              style: const TextStyle(color: Colors.grey, fontSize: 16, overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
