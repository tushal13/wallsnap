import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../controllers/api_controller.dart';
import '../components/tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Apicontroller>(builder: (context, pro, _) {
        List data = pro.data;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34)),
                    labelText: "Search Your WallSnap's",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (val) {
                    pro.Search(val: val);
                    Navigator.of(context).pushNamed('Wall', arguments: val);
                  },
                ),
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('WallSnap', arguments: data[index]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Tile(
                            imageUrl: data[index]['largeImageURL'],
                            index: index,
                            height: 300,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
