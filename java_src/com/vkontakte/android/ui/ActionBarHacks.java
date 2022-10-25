package com.vkontakte.android.ui;

import android.app.ActionBar;
import android.app.Activity;
import android.content.res.Resources;
import android.view.View;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
/* loaded from: classes3.dex */
public class ActionBarHacks {
    public static View getActionBar(Activity act) {
        int id = Resources.getSystem().getIdentifier("action_bar", "id", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (id != 0) {
            return act.findViewById(id);
        }
        return null;
    }

    public static View getActionBarOverlay(Activity act) {
        int id = Resources.getSystem().getIdentifier("action_bar_overlay_layout", "id", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (id != 0) {
            return act.findViewById(id);
        }
        return null;
    }

    public static void setShowHideAnimationsEnabled(ActionBar actionBar, boolean enabled) {
        try {
            actionBar.getClass().getDeclaredMethod("setShowHideAnimationEnabled", Boolean.TYPE).invoke(actionBar, Boolean.valueOf(enabled));
        } catch (Exception e) {
        }
    }
}
