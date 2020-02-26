package com.bsuir.cartooons

import android.content.Context
import com.bsuir.cartooons.models.Cartoon

class DataSource{

    companion object{

        fun createDataSet(context: Context, jsonSerializer: JsonFileSerializer): ArrayList<Cartoon>{
            val deserialized = jsonSerializer.deserialize(context)

            if(deserialized != null){
                return deserialized
            }

            val list = ArrayList<Cartoon>()
            list.add(
                Cartoon(
                    "How To Train Your Dragon: The Hidden World!",
                    "Not Disney",
                    7200,
                    5.0,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://i0.wp.com/www.thehollywoodoutsider.com/wp-content/uploads/how-to-train-your-dragon-3.1-e1549636317616.jpg?resize=660%2C330&ssl=1"
                )
            )
            list.add(
                Cartoon(
                    "Alita: Battle Angel",
                    "Disney",
                    5400,
                    3.4,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://thedigitalweekly.com/wp-content/uploads/2020/02/mv5bmzrlzgmxzmitmzk1zs00mdi4lwi2zgitmdhhmja0mje3zdazxkeyxkfqcgdeqxvynzi1nzmxnzm40._v1_sx1777_cr001777999_al_-696x391.jpg"
                )
            )

            list.add(
                Cartoon(
                    "Lego Movie 2: The Second Part",
                    "Disney",
                    7800,
                    3.2,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "Wonder Park",
                    "Disney",
                    6800,
                    3.2,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "Pokémon Detective Pikachu",
                    "Disney",
                    6000,
                    3.2,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "Shaun The Sheep Movie 2: Farmageddon",
                    "Disney",
                    5400,
                    3.2,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "The Secret Life Of Pets 2",
                    "Disney",
                    3900,
                    3.2,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "Toy Story 4",
                    "Disney",
                    3000,
                    3.2,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "How To Train Your Dragon: The Hidden World",
                    "Disney",
                    7800,
                    2.4,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "Playmobil: The Movie",
                    "Disney",
                    9300,
                    3.9,
                    "Adventure",
                    "https://www.w3schools.com/html/mov_bbb.mp4",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )
            list.add(
                Cartoon(
                    "Angry Birds 2",
                    "Disney",
                    5900,
                    4.87,
                    "Adventure",
                    "",
                    "https://m.media-amazon.com/images/M/MV5BZmE3ZmYwNTgtNTBmOC00NGU1LWJjNzktOTVhMjEzODFmOGFlXkEyXkFqcGdeQXdhZHppdGE@._V1_UX477_CR0,0,477,268_AL_.jpg"
                )
            )

            jsonSerializer.serialize(context, list)
            return list
        }
    }
}