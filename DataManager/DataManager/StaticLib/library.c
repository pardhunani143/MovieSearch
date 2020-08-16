//
//  library.c
//  StaticLib
//
//  Created by Usha on 16/08/2020.
//  Copyright © 2020 developers. All rights reserved.
//

#include "library.h"

void SortMovieRating(struct MovieList *movieList, size_t Size){
    
    int i = 0;
    int j = 0;
    struct MovieList temp;

    for (i = 1; i < Size; ++i){
        for (j = 0; j < Size - i; ++j) {
            if (movieList[j].voteAverage < movieList[j + 1].voteAverage) {
                
                temp = movieList[j];
                movieList[j] = movieList[j + 1];
                movieList[j + 1] = temp;
            }
       }
    }
}
