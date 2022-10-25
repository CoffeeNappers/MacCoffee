package android.support.v4.media.session;

import android.annotation.TargetApi;
import android.media.session.MediaSession;
import android.support.annotation.RequiresApi;
@RequiresApi(22)
@TargetApi(22)
/* loaded from: classes.dex */
class MediaSessionCompatApi22 {
    MediaSessionCompatApi22() {
    }

    public static void setRatingType(Object sessionObj, int type) {
        ((MediaSession) sessionObj).setRatingType(type);
    }
}
