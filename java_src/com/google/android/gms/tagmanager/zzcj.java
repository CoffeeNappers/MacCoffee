package com.google.android.gms.tagmanager;

import android.net.Uri;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
/* loaded from: classes2.dex */
class zzcj {
    private static zzcj aGl;
    private volatile String aDY;
    private volatile zza aGm;
    private volatile String aGn;
    private volatile String aGo;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public enum zza {
        NONE,
        CONTAINER,
        CONTAINER_DEBUG
    }

    zzcj() {
        clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzcj zzcfz() {
        zzcj zzcjVar;
        synchronized (zzcj.class) {
            if (aGl == null) {
                aGl = new zzcj();
            }
            zzcjVar = aGl;
        }
        return zzcjVar;
    }

    private String zzpo(String str) {
        return str.split("&")[0].split("=")[1];
    }

    private String zzw(Uri uri) {
        return uri.getQuery().replace("&gtm_debug=x", "");
    }

    void clear() {
        this.aGm = zza.NONE;
        this.aGn = null;
        this.aDY = null;
        this.aGo = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getContainerId() {
        return this.aDY;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zza zzcga() {
        return this.aGm;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzcgb() {
        return this.aGn;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized boolean zzv(Uri uri) {
        boolean z = true;
        synchronized (this) {
            try {
                String decode = URLDecoder.decode(uri.toString(), "UTF-8");
                if (decode.matches("^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_auth=\\S+&gtm_preview=\\d+(&gtm_debug=x)?$")) {
                    String valueOf = String.valueOf(decode);
                    zzbo.v(valueOf.length() != 0 ? "Container preview url: ".concat(valueOf) : new String("Container preview url: "));
                    if (decode.matches(".*?&gtm_debug=x$")) {
                        this.aGm = zza.CONTAINER_DEBUG;
                    } else {
                        this.aGm = zza.CONTAINER;
                    }
                    this.aGo = zzw(uri);
                    if (this.aGm == zza.CONTAINER || this.aGm == zza.CONTAINER_DEBUG) {
                        String valueOf2 = String.valueOf("/r?");
                        String valueOf3 = String.valueOf(this.aGo);
                        this.aGn = valueOf3.length() != 0 ? valueOf2.concat(valueOf3) : new String(valueOf2);
                    }
                    this.aDY = zzpo(this.aGo);
                } else if (!decode.matches("^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_preview=$")) {
                    String valueOf4 = String.valueOf(decode);
                    zzbo.zzdi(valueOf4.length() != 0 ? "Invalid preview uri: ".concat(valueOf4) : new String("Invalid preview uri: "));
                    z = false;
                } else if (zzpo(uri.getQuery()).equals(this.aDY)) {
                    String valueOf5 = String.valueOf(this.aDY);
                    zzbo.v(valueOf5.length() != 0 ? "Exit preview mode for container: ".concat(valueOf5) : new String("Exit preview mode for container: "));
                    this.aGm = zza.NONE;
                    this.aGn = null;
                } else {
                    z = false;
                }
            } catch (UnsupportedEncodingException e) {
                z = false;
            }
        }
        return z;
    }
}
