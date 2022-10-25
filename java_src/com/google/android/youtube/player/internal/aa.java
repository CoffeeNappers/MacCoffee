package com.google.android.youtube.player.internal;

import android.app.Activity;
import android.content.Context;
import com.google.android.youtube.player.YouTubeThumbnailView;
import com.google.android.youtube.player.internal.t;
import com.google.android.youtube.player.internal.w;
/* loaded from: classes2.dex */
public abstract class aa {
    private static final aa a = b();

    public static aa a() {
        return a;
    }

    private static aa b() {
        try {
            try {
                return (aa) Class.forName("com.google.android.youtube.api.locallylinked.LocallyLinkedFactory").asSubclass(aa.class).newInstance();
            } catch (IllegalAccessException e) {
                throw new IllegalStateException(e);
            } catch (InstantiationException e2) {
                throw new IllegalStateException(e2);
            }
        } catch (ClassNotFoundException e3) {
            return new ac();
        }
    }

    public abstract a a(b bVar, YouTubeThumbnailView youTubeThumbnailView);

    public abstract b a(Context context, String str, t.a aVar, t.b bVar);

    public abstract d a(Activity activity, b bVar, boolean z) throws w.a;
}
