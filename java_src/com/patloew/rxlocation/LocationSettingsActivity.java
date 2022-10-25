package com.patloew.rxlocation;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import com.google.android.gms.common.api.Status;
/* loaded from: classes2.dex */
public class LocationSettingsActivity extends Activity {
    protected static final String ARG_ID = "id";
    protected static final String ARG_STATUS = "status";
    static final int REQUEST_CODE_RESOLUTION = 123;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            handleIntent();
        }
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        setIntent(intent);
        handleIntent();
    }

    void handleIntent() {
        Status status = (Status) getIntent().getParcelableExtra("status");
        try {
            status.startResolutionForResult(this, REQUEST_CODE_RESOLUTION);
        } catch (IntentSender.SendIntentException | NullPointerException e) {
            setResolutionResultAndFinish(0);
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_CODE_RESOLUTION) {
            setResolutionResultAndFinish(resultCode);
        } else {
            setResolutionResultAndFinish(0);
        }
    }

    void setResolutionResultAndFinish(int resultCode) {
        SettingsCheckHandleSingleOnSubscribe.onResolutionResult(getIntent().getStringExtra("id"), resultCode);
        finish();
    }
}
