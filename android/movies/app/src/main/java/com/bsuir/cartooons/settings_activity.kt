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
        theme.applyStyle(Preferences(this).getFontStyle().getResId(), true);
        theme.applyStyle(Preferences(this).getFontFamily().getResId(), true);
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_settings_activity)

        LANGUAGES.add(resources.getString(R.string.settings_en))
        LANGUAGES.add(resources.getString(R.string.settings_by))

        FONT_SIZES.add(resources.getString(R.string.settings_fontsize_small))
        FONT_SIZES.add(resources.getString(R.string.settings_fontsize_medium))
        FONT_SIZES.add(resources.getString(R.string.settings_fontsize_large))

        FONT_FAMILIES.addAll(FontFamily.values().map{value -> value.getTitle()})

        LanguagesMap.add("en")
        LanguagesMap.add("by")

        val adapter = ArrayAdapter<String>(
            this,
            android.R.layout.simple_spinner_dropdown_item, LANGUAGES
        )

        val languagesSpinner = findViewById<Spinner>(R.id.languages_dropdown)
        languagesSpinner.adapter = adapter
        languagesSpinner.isSelected = false;
        languagesSpinner.setSelection(0,false)

        val fontSizesSpinner = findViewById<Spinner>(R.id.font_sizes_spinner)
        val fontFamiliesSpinner = findViewById<Spinner>(R.id.font_family_spinner)

        fontSizesSpinner.adapter = ArrayAdapter<String>(
            this,
            android.R.layout.simple_spinner_dropdown_item, FONT_SIZES
        )

        fontFamiliesSpinner.adapter = ArrayAdapter<String>(
            this,
            android.R.layout.simple_spinner_dropdown_item, FONT_FAMILIES
        )

        languagesSpinner.onItemSelectedListener = object: AdapterView.OnItemSelectedListener{
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

        var prefs = Preferences(this)

        fontSizesSpinner.setSelection(prefs.getFontStyle().ordinal);

        fontSizesSpinner.onItemSelectedListener = object: AdapterView.OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                prefs.setFontStyle(FontStyle.values()[id.toInt()])
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {

            }
        };

        fontFamiliesSpinner.setSelection(prefs.getFontFamily().ordinal);

        fontFamiliesSpinner.onItemSelectedListener = object: AdapterView.OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                prefs.setFontFamily(FontFamily.values()[id.toInt()])
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {

            }
        };


    }

    private var LANGUAGES = ArrayList<String>()
    private var FONT_SIZES = ArrayList<String>()
    private var FONT_FAMILIES = ArrayList<String>()
    private val LanguagesMap = ArrayList<String>()
}
