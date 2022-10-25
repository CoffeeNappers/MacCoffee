package com.google.android.gms.internal;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.data.ServerKeys;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzjq {
    private String zzae;
    private final String zzcec;
    private int zzcgw;
    private final List<String> zzcpj;
    private final List<String> zzcpk;
    private final String zzcpl;
    private final String zzcpm;
    private final String zzcpn;
    private final String zzcpo;
    private final boolean zzcpp;
    private final boolean zzcpq;
    private final String zzcpr;

    public zzjq(int i, Map<String, String> map) {
        this.zzae = map.get("url");
        this.zzcpm = map.get("base_uri");
        this.zzcpn = map.get("post_parameters");
        this.zzcpp = parseBoolean(map.get("drt_include"));
        this.zzcpq = parseBoolean(map.get("pan_include"));
        this.zzcpl = map.get("activation_overlay_url");
        this.zzcpk = zzco(map.get("check_packages"));
        this.zzcec = map.get("request_id");
        this.zzcpo = map.get(ServerKeys.TYPE);
        this.zzcpj = zzco(map.get("errors"));
        this.zzcgw = i;
        this.zzcpr = map.get("fetched_ad");
    }

    private static boolean parseBoolean(String str) {
        return str != null && (str.equals(AppEventsConstants.EVENT_PARAM_VALUE_YES) || str.equals("true"));
    }

    private List<String> zzco(String str) {
        if (str == null) {
            return null;
        }
        return Arrays.asList(str.split(","));
    }

    public int getErrorCode() {
        return this.zzcgw;
    }

    public String getRequestId() {
        return this.zzcec;
    }

    public String getType() {
        return this.zzcpo;
    }

    public String getUrl() {
        return this.zzae;
    }

    public void setUrl(String str) {
        this.zzae = str;
    }

    public List<String> zztm() {
        return this.zzcpj;
    }

    public String zztn() {
        return this.zzcpm;
    }

    public String zzto() {
        return this.zzcpn;
    }

    public boolean zztp() {
        return this.zzcpp;
    }

    public String zztq() {
        return this.zzcpr;
    }
}
