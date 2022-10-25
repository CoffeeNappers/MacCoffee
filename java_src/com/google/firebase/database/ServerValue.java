package com.google.firebase.database;

import io.sentry.marshaller.json.JsonMarshaller;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class ServerValue {
    public static final Map<String, String> TIMESTAMP = zzsc(JsonMarshaller.TIMESTAMP);

    private static Map<String, String> zzsc(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(".sv", str);
        return Collections.unmodifiableMap(hashMap);
    }
}
