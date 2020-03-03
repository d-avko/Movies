package com.bsuir.cartooons

enum class FontStyle {
    Small(R.style.FontStyle_Small, "Small"),
    Medium(R.style.FontStyle_Medium, "Medium"),
    Large(R.style.FontStyle_Large, "Large");

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