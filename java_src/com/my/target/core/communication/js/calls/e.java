package com.my.target.core.communication.js.calls;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.FragmentWrapperActivity;
import org.json.JSONException;
/* compiled from: JSStartCall.java */
/* loaded from: classes2.dex */
public final class e extends a {
    public e(String str, int i) {
        super(TtmlNode.START);
        try {
            this.a.put("format", str);
            this.a.put(FragmentWrapperActivity.ORIENTATION_KEY, i);
        } catch (JSONException e) {
        }
    }
}
