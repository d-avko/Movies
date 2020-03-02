package com.bsuir.cartooons
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import androidx.appcompat.app.AppCompatActivity
import java.util.*
import kotlin.collections.ArrayList


class settings_activity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        resources.configuration.setLocale(Locale(LocaleSingleton.instance.SelectedLocale))

        resources.updateConfiguration(resources.configuration, resources.displayMetrics)

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_settings_activity)

        LANGUAGES.add(resources.getString(R.string.settings_en))
        LANGUAGES.add(resources.getString(R.string.settings_by))
        LanguagesMap.add("en")
        LanguagesMap.add("by")

        val adapter = ArrayAdapter<String>(
            this,
            android.R.layout.simple_spinner_dropdown_item, LANGUAGES
        )

        val textView = findViewById<Spinner>(R.id.languages_dropdown)
        textView.adapter = adapter
        textView.isSelected = false;
        textView.setSelection(0,false)

        textView.onItemSelectedListener = object: AdapterView.OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                if(LanguagesMap.indexOf(resources.configuration.locale.language) != position){
                    LocaleSingleton.instance.SelectedLocale = LanguagesMap[position]
                    finish()
                    startActivity(intent)
                }
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {

            }
        };
    }

    private var LANGUAGES = ArrayList<String>()
    private val LanguagesMap = ArrayList<String>()
}
