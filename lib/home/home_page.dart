import 'package:flutter/material.dart';
import 'package:rest_full_api/model/cat_model.dart';
import 'package:rest_full_api/service/crud_service.dart';

class CatImageList extends StatelessWidget {
  const CatImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CatImage>>(
      future: fetchCatImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<CatImage> catImages = snapshot.data!;
          return ListView.builder(
            itemCount: catImages.length,
            itemBuilder: (context, index) {
              final cat = catImages[index];
              final breed = cat.breeds.isNotEmpty ? cat.breeds[0] : null;

              return ListTile(
                title: breed != null
                    ? Text(breed.name)
                    : const Text('Unknown Breed'),
                subtitle: breed != null ? Text(breed.description) : null,
                leading: Image.network(cat.url),
              );
            },
          );
        } else {
          return const Center(child: Text('No data found.'));
        }
      },
    );
  }
}
