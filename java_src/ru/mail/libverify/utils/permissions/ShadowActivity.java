package ru.mail.libverify.utils.permissions;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.NonNull;
import com.facebook.internal.NativeProtocol;
@TargetApi(23)
/* loaded from: classes3.dex */
public class ShadowActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            requestPermissions(getIntent().getStringArrayExtra(NativeProtocol.RESULT_ARGS_PERMISSIONS), Integer.valueOf(getIntent().getIntExtra("request_id", 0)).intValue());
        }
    }

    @Override // android.app.Activity
    public void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr) {
        a.a(i, strArr, iArr);
        finish();
    }
}
