package com.bsuir.cartooons

enum class FontFamily {
    SansSerif(R.style.FontFamily_SansSerif, "Sans serif"),
    MonoSpaced(R.style.FontFamily_Monospace, "Monospaced"),
    SansSerifLight(R.style.FontFamily_SansSerifLight, "Sans serif light");

    private var resId: Int = 0;
    private var title: String = "";

    fun getResId() : Int {
        return resId;
    }

    fun getTitle(): String {
        return title;
    }

    constructor( resId: Int, title: String){
        this.resId = resId;
        this.title = title;
    }
}