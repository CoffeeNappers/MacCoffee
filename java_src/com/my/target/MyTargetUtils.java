package com.my.target;

import android.content.Context;
import com.my.target.core.async.a;
import com.my.target.core.providers.d;
import java.util.Map;
/* loaded from: classes2.dex */
public class MyTargetUtils {
    public static void sendStat(String str, Context context) {
        a.a(str, context);
    }

    public static Map<String, String> collectInfo(Context context) {
        d.a().a(context);
        return d.a().getData();
    }
}
