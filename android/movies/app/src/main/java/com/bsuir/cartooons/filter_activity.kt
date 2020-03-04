package com.bsuir.cartooons

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import java.util.*

class filter_activity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        resources.configuration.setLocale(Locale(LocaleSingleton.instance.SelectedLocale))

        resources.updateConfiguration(resources.configuration, resources.displayMetrics)

        super.onCreate(savedInstanceState)
        theme.applyStyle(Preferences(this).getFontStyle().getResId(), true);
        theme.applyStyle(Preferences(this).getFontFamily().getResId(), true);

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
