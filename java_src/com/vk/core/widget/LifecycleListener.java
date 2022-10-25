package com.vk.core.widget;

import android.app.Activity;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
/* loaded from: classes2.dex */
public class LifecycleListener {
    private static int uniqueIds = 0;
    private final int uniqueId;

    public LifecycleListener() {
        int i = uniqueIds;
        uniqueIds = i + 1;
        this.uniqueId = i;
    }

    public final String getUniqueId() {
        return String.valueOf(this.uniqueId);
    }

    public void onActivityResult(@NonNull String instanceId, int requestCode, int resultCode, @Nullable Intent data) {
    }

    public void onActivityStarted(@NonNull Activity activity) {
    }

    public void onActivityResumed(@NonNull Activity activity) {
    }

    public void onActivityPaused(@NonNull Activity activity) {
    }

    public void onActivityStopped(@NonNull Activity activity) {
    }

    public void onActivityDestroyed(@NonNull Activity activity) {
    }

    public void onCreateOptionsMenu(@NonNull Menu menu, @NonNull MenuInflater inflater) {
    }

    public void onPrepareOptionsMenu(@NonNull Menu menu) {
    }

    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        return false;
    }

    public void onRequestPermissionsResult(@NonNull String instanceId, int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
    }

    public final Boolean handleRequestedPermission(@NonNull String permission) {
        return null;
    }
}
