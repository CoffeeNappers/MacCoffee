package com.google.android.youtube.player.internal;

import android.content.Context;
import android.content.res.Resources;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes2.dex */
public final class m {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final String i;
    public final String j;

    public m(Context context) {
        Resources resources = context.getResources();
        Map<String, String> a = x.a((resources == null || resources.getConfiguration() == null || resources.getConfiguration().locale == null) ? Locale.getDefault() : resources.getConfiguration().locale);
        this.a = a.get("error_initializing_player");
        this.b = a.get("get_youtube_app_title");
        this.c = a.get("get_youtube_app_text");
        this.d = a.get("get_youtube_app_action");
        this.e = a.get("enable_youtube_app_title");
        this.f = a.get("enable_youtube_app_text");
        this.g = a.get("enable_youtube_app_action");
        this.h = a.get("update_youtube_app_title");
        this.i = a.get("update_youtube_app_text");
        this.j = a.get("update_youtube_app_action");
    }
}
