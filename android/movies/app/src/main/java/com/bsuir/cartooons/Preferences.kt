package com.bsuir.cartooons

import android.R.attr.name
import android.R.id.edit
import android.content.Context
import android.content.Context.MODE_PRIVATE
import android.content.SharedPreferences



class Preferences {
    private val FONT_STYLE = "FONT_STYLE"
    private val FONT_FAMILY = "FONT_FAMILY"

    private val context: Context

    constructor(context: Context){
        this.context = context
    }

    protected fun open(): SharedPreferences {
        return context.getSharedPreferences("prefs", Context.MODE_PRIVATE)
    }

    protected fun edit(): SharedPreferences.Editor {
        return open().edit()
    }

    fun getFontStyle(): FontStyle {
        return FontStyle.valueOf(
            open().getString(
                FONT_STYLE,
                FontStyle.Medium.name
            )
        )
    }

    fun getFontFamily(): FontFamily {
        return FontFamily.valueOf(
            open().getString(
                FONT_FAMILY,
                FontFamily.SansSerif.name
            )
        )
    }

    fun setFontFamily(family: FontFamily){
        edit().putString(FONT_FAMILY, family.name).commit()
    }

    fun setFontStyle(style: FontStyle) {
        edit().putString(FONT_STYLE, style.name).commit()
    }
}