package com.bsuir.cartooons.models

data class Cartoon(

    public var name : String,
    public var author : String,
    public var durationSeconds: Int,
    public var rating: Double,
    public var genre: String,
    public var link: String,
    public var thumbnailLink: String

) {

    override fun toString(): String {
        return "Cartoon(name='$name', image='$thumbnailLink', creator='$author')"
    }


}
























