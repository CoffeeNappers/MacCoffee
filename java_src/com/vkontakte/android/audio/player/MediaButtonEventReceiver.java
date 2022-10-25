package com.vkontakte.android.audio.player;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.support.v4.media.TransportMediator;
import android.view.KeyEvent;
/* loaded from: classes2.dex */
public class MediaButtonEventReceiver extends BroadcastReceiver {
    private static long mLastHeadsetHook;

    public static boolean checkHeadsetHookPlayNext() {
        if (SystemClock.uptimeMillis() > mLastHeadsetHook + 500) {
            mLastHeadsetHook = SystemClock.uptimeMillis();
            return false;
        }
        mLastHeadsetHook = 0L;
        return true;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        char c = 65535;
        switch (action.hashCode()) {
            case -549244379:
                if (action.equals("android.media.AUDIO_BECOMING_NOISY")) {
                    c = 1;
                    break;
                }
                break;
            case 1997055314:
                if (action.equals("android.intent.action.MEDIA_BUTTON")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                KeyEvent keyEvent = (KeyEvent) intent.getParcelableExtra("android.intent.extra.KEY_EVENT");
                if (keyEvent != null && keyEvent.getAction() == 0) {
                    switch (keyEvent.getKeyCode()) {
                        case 79:
                            if (checkHeadsetHookPlayNext()) {
                                PlayerIntents.next();
                                return;
                            } else {
                                PlayerIntents.toggleResumePause();
                                return;
                            }
                        case 85:
                            PlayerIntents.toggleResumePause();
                            return;
                        case 86:
                            PlayerIntents.stop();
                            return;
                        case 87:
                            PlayerIntents.next();
                            return;
                        case 88:
                            PlayerIntents.prev();
                            return;
                        case 89:
                            PlayerIntents.rewind();
                            return;
                        case TransportMediator.KEYCODE_MEDIA_PLAY /* 126 */:
                            PlayerIntents.resume();
                            return;
                        case TransportMediator.KEYCODE_MEDIA_PAUSE /* 127 */:
                            PlayerIntents.pause();
                            return;
                        default:
                            return;
                    }
                }
                return;
            case 1:
                PlayerIntents.pause();
                return;
            default:
                return;
        }
    }
}
