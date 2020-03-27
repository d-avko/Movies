package com.bsuir.cartooons

import android.app.Activity
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.google.firebase.ktx.Firebase
import com.google.firebase.storage.ktx.storage
import androidx.core.app.ActivityCompat.startActivityForResult
import android.provider.MediaStore
import android.content.Intent
import androidx.core.app.ComponentActivity
import androidx.core.app.ComponentActivity.ExtraData
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.net.Uri
import android.widget.EditText
import androidx.appcompat.app.AlertDialog
import com.bsuir.cartooons.models.Cartoon
import com.google.firebase.storage.FirebaseStorage
import java.lang.Exception


class add_new_cartoon : AppCompatActivity() {

    lateinit var storage : FirebaseStorage
    val selectVideoCode = 2
    val selectImageCode = 3
    var uploadedImageUri : Uri? = null
    var uploadedVideoUri : Uri? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_new_cartoon)
        storage = Firebase.storage
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (resultCode != Activity.RESULT_OK) {
            return
        }

        var fileUri: Uri? = data?.getData() ?: return

        when(requestCode){
            selectImageCode -> {
                var task = storage.getReference().child(fileUri?.lastPathSegment!!)
                    .putFile(fileUri)

                task.addOnFailureListener{exception -> run {
                    val builder = AlertDialog.Builder(this@add_new_cartoon)

                    builder.setTitle(resources.getString(R.string.video_error_caption))

                    // Display a message on alert dialog
                    builder.setMessage(exception.localizedMessage)

                    builder.show()
                } }

                task.addOnSuccessListener {snapshot ->
                    val builder = AlertDialog.Builder(this@add_new_cartoon)

                    builder.setTitle("Success")

                    // Display a message on alert dialog
                    builder.setMessage("Successfully uploaded your image.")

                    builder.show()

                    snapshot.storage.downloadUrl.addOnSuccessListener { uri ->
                        uploadedImageUri = uri
                    }
                }
            }
            selectVideoCode -> {
                var task = storage.getReference().child(fileUri?.lastPathSegment!!)
                    .putFile(fileUri)

                task.addOnFailureListener{exception -> run {
                    val builder = AlertDialog.Builder(this@add_new_cartoon)

                    builder.setTitle(resources.getString(R.string.video_error_caption))

                    // Display a message on alert dialog
                    builder.setMessage(exception.localizedMessage)

                    builder.show()
                } }

                task.addOnSuccessListener {snapshot ->
                    val builder = AlertDialog.Builder(this@add_new_cartoon)

                    builder.setTitle("Success")

                    // Display a message on alert dialog
                    builder.setMessage("Successfully uploaded your video.")

                    builder.show()

                    snapshot.storage.downloadUrl.addOnSuccessListener { uri ->
                        uploadedVideoUri = uri
                    }
                }
            }
        }
    }

    fun onUploadVideo(view: View){
        val intent = Intent(Intent.ACTION_PICK, MediaStore.Video.Media.EXTERNAL_CONTENT_URI)
        startActivityForResult(intent, selectVideoCode)
    }

    fun onUploadImage(view: View){
        val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
        startActivityForResult(intent, selectImageCode)
    }

    fun onAddCartoon(view: View){
        val nameView = findViewById<EditText>(R.id.nameLabel)
        val authorView = findViewById<EditText>(R.id.authorLabel)
        val ratingView = findViewById<EditText>(R.id.ratingLabel)

        val durationMinutesView = findViewById<EditText>(R.id.durationMinutesLabel)
        val durationHoursView = findViewById<EditText>(R.id.durationHoursLabel)

        if(uploadedImageUri == null || uploadedVideoUri == null){
            val builder = AlertDialog.Builder(this@add_new_cartoon)

            builder.setTitle("Error")

            builder.setMessage("Upload a video and an image and try again.")

            builder.show()

            return
        }

        try {
            val rating = ratingView.text.toString().toDouble()
            val durationMinutes = durationMinutesView.text.toString().toLong()
            val durationHours = durationHoursView.text.toString().toLong()

            val newCartoon = Cartoon(nameView.text.toString(), authorView.text.toString(),
                durationMinutes * 60 + durationHours * 60 * 60, rating,
                "", uploadedVideoUri.toString(), uploadedImageUri.toString(), Math.random().toLong())

            MainActivity.instance?.writeNewCartoon(newCartoon)
        }
        catch (e: Exception){
            val builder = AlertDialog.Builder(this@add_new_cartoon)

            builder.setTitle("Error")

            builder.setMessage("Some fields did contain errors.")

            builder.show()
        }
    }
}
