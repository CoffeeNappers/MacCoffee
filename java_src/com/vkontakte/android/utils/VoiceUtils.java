package com.vkontakte.android.utils;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.VKApplication;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class VoiceUtils {
    private static final int SPEECH_RESULT = 34;

    private VoiceUtils() {
    }

    public static boolean voiceSearchAvailable() {
        Intent intent = new Intent("android.speech.action.RECOGNIZE_SPEECH");
        return VKApplication.context.getPackageManager().queryIntentActivities(intent, 0).size() > 0;
    }

    public static void startVoiceRecognizer(@NonNull Activity activity) {
        Intent intent = new Intent("android.speech.action.RECOGNIZE_SPEECH");
        intent.putExtra("android.speech.extra.LANGUAGE_MODEL", "free_form");
        intent.putExtra("android.speech.extra.MAX_RESULTS", 10);
        activity.startActivityForResult(intent, 34);
    }

    public static void startVoiceRecognizer(@NonNull Fragment fragment) {
        Intent intent = new Intent("android.speech.action.RECOGNIZE_SPEECH");
        intent.putExtra("android.speech.extra.LANGUAGE_MODEL", "free_form");
        intent.putExtra("android.speech.extra.MAX_RESULTS", 10);
        fragment.startActivityForResult(intent, 34);
    }

    @Nullable
    public static String getVoiceResult(int reqCode, int resCode, Intent data) {
        if (reqCode == 34 && resCode == -1 && data != null) {
            ArrayList<String> results = data.getStringArrayListExtra("android.speech.extra.RESULTS");
            if (results.size() > 0) {
                return results.get(0);
            }
        }
        return null;
    }
}
