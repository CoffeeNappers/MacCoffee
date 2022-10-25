package com.vkontakte.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.os.Build;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.vkontakte.android.VKAlertDialog;
/* loaded from: classes2.dex */
public class ActivityUtils {
    public static void setBeamLink(Activity act, String link) {
        NfcAdapter nfc;
        if (Build.VERSION.SDK_INT >= 14 && (nfc = NfcAdapter.getDefaultAdapter(act)) != null) {
            NdefMessage msg = new NdefMessage(new NdefRecord[]{NdefRecord.createUri(Uri.parse("https://m.vk.com/" + link))});
            nfc.setNdefPushMessage(msg, act, new Activity[0]);
        }
    }

    public static boolean requireGoogleMaps(final Activity act, boolean finishOnDismiss) {
        if (!haveGoogleMaps(act)) {
            boolean isAmazonDevice = Build.MANUFACTURER.toLowerCase().contains("amazon");
            AlertDialog.Builder builder = new VKAlertDialog.Builder(act).setTitle(R.string.maps_not_available).setMessage(isAmazonDevice ? R.string.sync_not_supported : R.string.maps_not_available_descr).setNegativeButton(R.string.close, (DialogInterface.OnClickListener) null);
            if (!isAmazonDevice) {
                builder.setPositiveButton(R.string.open_google_play, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.ActivityUtils.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=com.google.android.apps.maps"));
                        intent.addFlags(268435456);
                        act.startActivity(intent);
                    }
                });
            }
            AlertDialog alert = builder.create();
            if (finishOnDismiss) {
                alert.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vkontakte.android.ActivityUtils.2
                    @Override // android.content.DialogInterface.OnDismissListener
                    public void onDismiss(DialogInterface dialog) {
                        act.finish();
                    }
                });
            }
            alert.show();
            return false;
        }
        return true;
    }

    public static boolean haveGoogleMaps(Activity act) {
        return Global.isAppInstalled(act, "com.google.android.apps.maps") && GooglePlayServicesUtil.isGooglePlayServicesAvailable(act.getApplicationContext()) == 0;
    }
}
