package me.grishka.appkit;

import android.app.Activity;
import android.os.Bundle;
import android.support.v7.app.AppCompatCallback;
import android.support.v7.app.AppCompatDelegate;
/* loaded from: classes3.dex */
public class LiteAppCompatActivity extends Activity {
    protected AppCompatDelegate delegate;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        this.delegate = AppCompatDelegate.create(this, (AppCompatCallback) null);
        this.delegate.installViewFactory();
        getWindow().setCallback(this);
        super.onCreate(savedInstanceState);
    }
}
