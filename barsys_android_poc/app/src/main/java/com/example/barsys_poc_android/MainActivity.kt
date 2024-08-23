package com.example.barsys_poc_android

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : AppCompatActivity() {
//    lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

//        flutterEngine = FlutterEngine(this)
//
//        flutterEngine.dartExecutor.executeDartEntrypoint(
//            DartExecutor.DartEntrypoint.createDefault()
//        )
//
//        FlutterEngineCache
//            .getInstance()
//            .put("my_engine_id", flutterEngine)

        val myButton = findViewById<Button>(R.id.myButton)

        myButton.setOnClickListener {
            val intent = FlutterActivity
                .withNewEngine()
                .initialRoute("random:data=25, heartSteel=true")
                .build(this)
            startActivity(intent)
        }
    }
}