package com.bsuir.cartooons

class LocaleSingleton {
    var SelectedLocale: String = "en"

    companion object{
        val instance = LocaleSingleton()
    }
}