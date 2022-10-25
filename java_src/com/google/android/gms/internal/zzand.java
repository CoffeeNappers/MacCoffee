package com.google.android.gms.internal;

import com.coremedia.iso.boxes.AuthorBox;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.io.IOException;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzand {
    private final String axH;
    private final Map<String, Object> bkb;

    public zzand(String str, Map<String, Object> map) {
        this.axH = str;
        this.bkb = map;
    }

    public static zzand zzta(String str) {
        if (!str.startsWith("gauth|")) {
            return null;
        }
        try {
            Map<String, Object> zztb = zzane.zztb(str.substring("gauth|".length()));
            return new zzand((String) zztb.get(AuthCheckFragment.KEY_TOKEN), (Map) zztb.get(AuthorBox.TYPE));
        } catch (IOException e) {
            throw new RuntimeException("Failed to parse gauth token", e);
        }
    }

    public String getToken() {
        return this.axH;
    }

    public Map<String, Object> y() {
        return this.bkb;
    }
}
