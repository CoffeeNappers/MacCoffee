package com.my.target.core.parsers.rb;

import android.text.TextUtils;
import com.coremedia.iso.boxes.FreeSpaceBox;
import com.my.target.core.models.i;
import com.my.target.core.models.k;
import com.my.target.core.parsers.a;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: RBStatsParser.java */
/* loaded from: classes2.dex */
public final class f {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static ArrayList<k> a(JSONObject jSONObject, a.C0235a c0235a) {
        c0235a.d = "Parsing banner stats";
        ArrayList<k> arrayList = new ArrayList<>();
        JSONArray a = a.a(jSONObject, "statistics", c0235a);
        if (a != null) {
            int length = a.length();
            for (int i = 0; i < length; i++) {
                JSONObject a2 = a.a(i, a, "statistics", c0235a);
                if (a2 != null) {
                    String a3 = a.a(a2, ServerKeys.TYPE, c0235a, "", true);
                    String a4 = a.a(a2, "url", c0235a, "", true);
                    if (!TextUtils.isEmpty(a3) && !TextUtils.isEmpty(a4)) {
                        char c = 65535;
                        switch (a3.hashCode()) {
                            case 3532159:
                                if (a3.equals(FreeSpaceBox.TYPE)) {
                                    c = 0;
                                    break;
                                }
                                break;
                            case 1778167540:
                                if (a3.equals("creativeView")) {
                                    c = 1;
                                    break;
                                }
                                break;
                            case 1788134515:
                                if (a3.equals("playheadReachedValue")) {
                                    c = 2;
                                    break;
                                }
                                break;
                        }
                        switch (c) {
                            case 0:
                                arrayList.add(new k("closedByUser", a4));
                                continue;
                            case 1:
                                arrayList.add(new k("playbackStarted", a4));
                                continue;
                            case 2:
                                i iVar = new i(a3, a4);
                                if (a2.has("value")) {
                                    float a5 = (float) a.a(a2, "value", c0235a, -1.0d, true);
                                    if (a5 != -1.0f) {
                                        iVar.a(a5);
                                        arrayList.add(iVar);
                                        break;
                                    } else {
                                        continue;
                                    }
                                } else {
                                    if (a2.has("pvalue")) {
                                        float a6 = (float) a.a(a2, "pvalue", c0235a, -1.0d, true);
                                        if (a6 == -1.0f) {
                                            break;
                                        } else {
                                            iVar.b(a6);
                                        }
                                    }
                                    arrayList.add(iVar);
                                }
                            default:
                                arrayList.add(new k(a3, a4));
                                continue;
                        }
                    }
                }
            }
        }
        return arrayList;
    }

    public static ArrayList<k> b(JSONObject jSONObject, a.C0235a c0235a) {
        c0235a.d = "Parsing service stats";
        ArrayList<k> arrayList = new ArrayList<>();
        JSONArray a = a.a(jSONObject, "serviceStatistics", c0235a);
        if (a != null) {
            int length = a.length();
            for (int i = 0; i < length; i++) {
                JSONObject a2 = a.a(i, a, "statistics", c0235a);
                String a3 = a.a(a2, ServerKeys.TYPE, c0235a, "", true);
                String a4 = a.a(a2, "url", c0235a, "", true);
                if (!TextUtils.isEmpty(a3) && !TextUtils.isEmpty(a4)) {
                    arrayList.add(new k(a3, a4));
                }
            }
        }
        return arrayList;
    }
}
