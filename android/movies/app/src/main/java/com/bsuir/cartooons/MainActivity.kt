package com.bsuir.cartooons

import android.view.Menu
import android.view.MenuItem
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.bsuir.cartooons.models.Cartoon
import kotlinx.android.synthetic.main.activity_main.*
import java.util.Locale;
import android.os.Bundle;
import android.content.Intent;
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.ValueEventListener
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import kotlin.collections.ArrayList
import kotlin.collections.HashMap


class MainActivity : AppCompatActivity(), IFilterable, View.OnClickListener {

    override fun onClick(p0: View?) {
        if(p0 != null){
            this.onViewVideo(p0)
        }
    }

    override fun filter(author: String, minutesDuration: String, hoursDuration: String) {
        filteredCartoons = ArrayList(cartoons)

        if(author != ""){
            filteredCartoons = filteredCartoons?.filter { cartoon -> cartoon.author == author }
        }

        if(minutesDuration != "" || hoursDuration != ""){
            var minutesDurationInt = 0;
            var hoursDurationInt = 0;

            try {
                minutesDurationInt = minutesDuration.toInt()
            }
            catch (e: Exception){

            }

            try {
                hoursDurationInt = hoursDuration.toInt()
            }
            catch (e: Exception){

            }

            if(minutesDurationInt != 0 || hoursDurationInt != 0){
                val seconds = minutesDurationInt * 60 + hoursDurationInt * 60 * 60
                filteredCartoons = filteredCartoons?.filter { cartoon -> cartoon.durationSeconds <= seconds }
            }
        }
        cartoonRecyclerAdapter.submitList(this, filteredCartoons!!)
        cartoonRecyclerAdapter.notifyDataSetChanged()
        recycler_view.adapter = cartoonRecyclerAdapter
    }

    companion object{
        var instance: MainActivity? = null
    }

    private lateinit var cartoonRecyclerAdapter: CartoonRecyclerAdapter
    private var jsonSerializer: JsonFileSerializer = JsonFileSerializer()

    override fun onResume() {
        if(previousLocale != LocaleSingleton.instance.SelectedLocale || previousFont !=
            Preferences(this).getFontStyle().getResId()
            || previousFontFamily != Preferences(this).getFontFamily().getResId()){
            finish()
            startActivity(intent)
        }

        super.onResume()
    }

    var previousLocale: String = ""
    var previousFont: Int = 0;
    var previousFontFamily: Int = 0;

    override fun onCreate(savedInstanceState: Bundle?) {
        instance = this
        previousLocale = LocaleSingleton.instance.SelectedLocale
        previousFont = Preferences(this).getFontStyle().getResId()
        previousFontFamily = Preferences(this).getFontFamily().getResId()

        resources.configuration.setLocale(Locale(previousLocale))
        resources.updateConfiguration(resources.configuration, resources.displayMetrics)
        theme.applyStyle(previousFont, true);
        theme.applyStyle(previousFontFamily, true);

        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)
        initRecyclerView()
        addDataSet(jsonSerializer)
    }

    private fun onViewVideo(view: View){
        val itemPosition = recycler_view.getChildLayoutPosition(view)
        var cartoon = filteredCartoons?.get(itemPosition)

        if(cartoon == null){
            return
        }

        val intent = Intent(this, video_activity::class.java).apply {
            putExtra("URL", cartoon.link)
        }

        startActivity(intent)
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        val inflater = menuInflater
        inflater.inflate(R.menu.menu, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId){
            R.id.settings -> {
                val intent = Intent(this, settings_activity::class.java).apply {

                }
                startActivity(intent)
            }
            R.id.filter -> {
                val intent = Intent(this, filter_activity::class.java).apply {

                }
                startActivity(intent)
            }
            R.id.addNewCartoon -> {
                val intent = Intent(this, add_new_cartoon::class.java).apply {

                }
                startActivity(intent)
            }

        }

        return true
    }

    var cartoons: ArrayList<Cartoon>? = null
    var filteredCartoons: List<Cartoon>? = null

    private lateinit var database: DatabaseReference

    fun writeNewCartoon(cartoon: Cartoon){
        database.child("movies").child(cartoon.id.toString()).setValue(cartoon).addOnSuccessListener {
            cartoons?.add(cartoon)
            cartoonRecyclerAdapter.submitList(this, cartoons!!)
            cartoonRecyclerAdapter.notifyDataSetChanged()
            recycler_view.adapter = cartoonRecyclerAdapter
        }
    }


    private fun addDataSet(jsonSerializer: JsonFileSerializer) {
        database = Firebase.database.reference
        database.child("movies").addValueEventListener(object: ValueEventListener {
            override fun onDataChange(dataSnapshot: DataSnapshot) {
                var resultingMovies = ArrayList<Cartoon>()
                // Get Post object and use the values to update the UI
                val movies = dataSnapshot.value
                        as List<HashMap<String, Any>>

                for(movie in movies){
                    var ratingLong = movie["rating"] as? Long
                    var ratingDouble = movie["rating"] as? Double

                    if(ratingLong != null){
                        ratingDouble = ratingLong?.toDouble()
                    }

                    resultingMovies.add(Cartoon(movie["name"] as String, movie["author"] as String,
                        movie["durationSeconds"] as Long, ratingDouble!!, movie["genre"] as String,
                        movie["link"] as String, movie["thumbnailLink"] as String, movie["id"] as Long))
                }

                filteredCartoons = ArrayList<Cartoon>(resultingMovies)
                cartoons = ArrayList(resultingMovies)
                cartoonRecyclerAdapter.submitList(this@MainActivity, filteredCartoons!!)
                cartoonRecyclerAdapter.notifyDataSetChanged()
                recycler_view.adapter = cartoonRecyclerAdapter
            }

            override fun onCancelled(databaseError: DatabaseError) {
                // Getting Post failed, log a message

                // ...
            }
        })
    }



    private fun initRecyclerView(){

        recycler_view.apply {
            layoutManager = LinearLayoutManager(this@MainActivity)
            val topSpacingDecorator = TopSpacingItemDecoration(30)
            addItemDecoration(topSpacingDecorator)
            cartoonRecyclerAdapter = CartoonRecyclerAdapter()
            adapter = cartoonRecyclerAdapter
        }
    }


}























