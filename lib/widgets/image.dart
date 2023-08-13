import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart' show kTransparentImage;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const  ListTile(
            title: Text('Image from asset'),
          ),
          Card(
            child: Image.asset('images/imgOne.png'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Image from URL'),
          ),
          Card(
            child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: 'https://images.unsplash.com/photo-1688383213635-9bc2fc25103d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Cached network image'),
          ),
          CachedNetworkImage(
              imageUrl: 'https://images.unsplash.com/photo-1661956600684-97d3a4320e45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
            placeholder: (context, url){
                return const Center(
                  child: CircularProgressIndicator(),
                );
            },
            errorWidget: (context, url, error){
                return const Icon(Icons.error);
            },
          ),
          const Divider(),
          const ListTile(
            title: Text('Extended Image'),
            subtitle: Text('Get the same random image every time based on ocean!'),
          ),
          ExtendedImage.network(
            'https://images.unsplash.com/photo-1682687982423-295485af248a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          )
        ],
      ),
    );
  }
}
