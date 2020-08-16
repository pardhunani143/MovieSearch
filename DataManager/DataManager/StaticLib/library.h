//
//  library.h
//  StaticLib
//
//  Created by Usha on 16/08/2020.
//  Copyright © 2020 developers. All rights reserved.
//

#ifndef library_h
#define library_h

#include <stdio.h>

struct MovieList {
    char* posterPath;
    char* originalTitle;
    double voteAverage;
    char* releaseDate;
};


void SortMovieRating(struct MovieList *movieList, size_t Size);




#endif /* library_h */
