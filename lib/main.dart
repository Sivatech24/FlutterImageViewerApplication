import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<GalleryItem> items = [
    GalleryItem(
      imageUrl: 'https://images.pexels.com/photos/7372338/pexels-photo-7372338.jpeg?cs=srgb&dl=pexels-laura-meinhardt-7372338.jpg&fm=jpg&_gl=1*184lmxz*_ga*NzQwNTEyNzQ5LjE2OTk3ODQ0NjU.*_ga_8JE65Q40S6*MTY5OTg1OTE2MC4zLjAuMTY5OTg1OTE2Mi4wLjAuMA..',
      title: 'Swans',
      description: 'Swans in lake',
      tags: ['#swans', '#lake'],
    ),
    GalleryItem(
      imageUrl: 'https://images.pexels.com/photos/11566663/pexels-photo-11566663.jpeg?cs=srgb&dl=pexels-anna-shevchuk-11566663.jpg&fm=jpg&_gl=1*1xp275p*_ga*NzQwNTEyNzQ5LjE2OTk3ODQ0NjU.*_ga_8JE65Q40S6*MTY5OTg1OTE2MC4zLjAuMTY5OTg1OTE2Mi4wLjAuMA..',
      title: 'Nature',
      description: 'Natural Environments',
      tags: ['#nature', '#green'],
    ),
    GalleryItem(
      imageUrl: 'https://images.pexels.com/photos/18512532/pexels-photo-18512532.jpeg?cs=srgb&dl=pexels-line-knipst-18512532.jpg&fm=jpg&_gl=1*1xp275p*_ga*NzQwNTEyNzQ5LjE2OTk3ODQ0NjU.*_ga_8JE65Q40S6*MTY5OTg1OTE2MC4zLjAuMTY5OTg1OTE2Mi4wLjAuMA..',
      title: 'MountainView',
      description: 'Green Environments and moutains view',
      tags: ['#mountain', '#green'],
    ),
    GalleryItem(
      imageUrl: 'https://images.pexels.com/photos/18936548/pexels-photo-18936548.jpeg?cs=srgb&dl=pexels-david-pohl-18936548.jpg&fm=jpg&_gl=1*1xp275p*_ga*NzQwNTEyNzQ5LjE2OTk3ODQ0NjU.*_ga_8JE65Q40S6*MTY5OTg1OTE2MC4zLjAuMTY5OTg1OTE2Mi4wLjAuMA..',
      title: 'Falls',
      description: 'Falls From the mountain',
      tags: ['#Nature', '#Falls'],
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GalleryItemWidget(item: items[index]);
        },
      ),
    );
  }
}

class GalleryItem {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> tags;

  GalleryItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tags,
  });
}

class GalleryItemWidget extends StatelessWidget {
  final GalleryItem item;

  GalleryItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            item.imageUrl,
            height: 200.0, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(item.description),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: item.tags.map((tag) {
                    return Chip(label: Text(tag));
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
