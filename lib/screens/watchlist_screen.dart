import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import 'details_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    // Only show movies marked from the details screen.
    final watchlistedMovies = sampleMovies
        .where((movie) => movie.isWatchlisted)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: watchlistedMovies.isEmpty
          ? const Center(child: Text('No movies have been added yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: watchlistedMovies.length,
              itemBuilder: (context, index) {
                final movie = watchlistedMovies[index];

                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      movie.posterPath,
                      width: 50,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    title: Text(movie.title),
                    subtitle: Text(movie.cast.first),
                    trailing: const Icon(Icons.bookmark),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(movie: movie),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                );
              },
            ),
    );
  }
}
