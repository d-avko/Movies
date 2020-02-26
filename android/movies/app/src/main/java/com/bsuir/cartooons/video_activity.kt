package com.bsuir.cartooons

import android.os.Bundle
import android.widget.MediaController
import android.widget.VideoView
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity


class video_activity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_video)

        val videoView = findViewById<VideoView>(R.id.videoView);

        val url = intent?.extras?.get("URL") as String?

        if(url == null){
            showErrorDialog()
            return
        }

        val mediaController = MediaController(this)
        mediaController.setAnchorView(videoView)
        videoView.setMediaController(mediaController)
        videoView.setVideoPath(url)
        videoView.setOnErrorListener { mediaPlayer, i, i2 -> showErrorDialog(); true }
        videoView.start();
    }

    fun showErrorDialog(){
        val builder = AlertDialog.Builder(this@video_activity)

        builder.setTitle("Error")

        // Display a message on alert dialog
        builder.setMessage("Video doesn't have the trailer.")

        // Display a neutral button on alert dialog
        builder.setNeutralButton("OK"){_,_ ->
           finish()
        }

        // Finally, make the alert dialog using builder
        val dialog: AlertDialog = builder.create()

        // Display the alert dialog on app interface
        dialog.show()
    }
}
