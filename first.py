class Movie:
    def __init__(self, title):
        self.title = title
        self.watched = False

    def mark_watched(self):
        self.watched = True


class Watchlist:
    def __init__(self):
        self.movies = []

    def add_movie(self, movie):
        self.movies.append(movie)

    def show_unwatched(self):
        for movie in self.movies:
            if not movie.watched:
                print(movie.title)


movie = Movie("Inception")
watchlist = Watchlist()

watchlist.add_movie(movie)
watchlist.show_unwatched()