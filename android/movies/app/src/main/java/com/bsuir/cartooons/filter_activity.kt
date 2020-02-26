package com.bsuir.cartooons

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText

class filter_activity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_filter)
    }

    fun onFilter(view: View){
        val studioText = findViewById<EditText>(R.id.studio_text)
        val minutes = findViewById<EditText>(R.id.filter_minutes)
        val hours = findViewById<EditText>(R.id.filter_hours)

        MainActivity.instance?.filter(studioText.text.toString(),
            minutes.text.toString(),
            hours.text.toString());

        finish()
    }
}
