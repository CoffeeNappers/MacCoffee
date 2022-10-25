package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.view.MotionEvent;
import android.view.View;
/* loaded from: classes.dex */
public class zzav {
    private static final String[] zzahg = {"/aclk", "/pcs/click"};
    private String zzahc = "googleads.g.doubleclick.net";
    private String zzahd = "/pagead/ads";
    private String zzahe = "ad.doubleclick.net";
    private String[] zzahf = {".doubleclick.net", ".googleadservices.com", ".googlesyndication.com"};
    private zzaq zzahh;

    public zzav(zzaq zzaqVar) {
        this.zzahh = zzaqVar;
    }

    private Uri zza(Uri uri, Context context, String str, boolean z, View view) throws zzaw {
        try {
            boolean zzb = zzb(uri);
            if (zzb) {
                if (uri.toString().contains("dc_ms=")) {
                    throw new zzaw("Parameter already exists: dc_ms");
                }
            } else if (uri.getQueryParameter("ms") != null) {
                throw new zzaw("Query parameter already exists: ms");
            }
            String zza = z ? this.zzahh.zza(context, str, view) : this.zzahh.zzb(context);
            return zzb ? zzb(uri, "dc_ms", zza) : zza(uri, "ms", zza);
        } catch (UnsupportedOperationException e) {
            throw new zzaw("Provided Uri is not in a valid state");
        }
    }

    private Uri zza(Uri uri, String str, String str2) throws UnsupportedOperationException {
        String uri2 = uri.toString();
        int indexOf = uri2.indexOf("&adurl");
        if (indexOf == -1) {
            indexOf = uri2.indexOf("?adurl");
        }
        return indexOf != -1 ? Uri.parse(uri2.substring(0, indexOf + 1) + str + "=" + str2 + "&" + uri2.substring(indexOf + 1)) : uri.buildUpon().appendQueryParameter(str, str2).build();
    }

    private Uri zzb(Uri uri, String str, String str2) {
        String uri2 = uri.toString();
        int indexOf = uri2.indexOf(";adurl");
        if (indexOf != -1) {
            return Uri.parse(uri2.substring(0, indexOf + 1) + str + "=" + str2 + ";" + uri2.substring(indexOf + 1));
        }
        String encodedPath = uri.getEncodedPath();
        int indexOf2 = uri2.indexOf(encodedPath);
        return Uri.parse(uri2.substring(0, encodedPath.length() + indexOf2) + ";" + str + "=" + str2 + ";" + uri2.substring(encodedPath.length() + indexOf2));
    }

    public Uri zza(Uri uri, Context context) throws zzaw {
        return zza(uri, context, null, false, null);
    }

    public Uri zza(Uri uri, Context context, View view) throws zzaw {
        try {
            return zza(uri, context, uri.getQueryParameter("ai"), true, view);
        } catch (UnsupportedOperationException e) {
            throw new zzaw("Provided Uri is not in a valid state");
        }
    }

    public void zza(MotionEvent motionEvent) {
        this.zzahh.zza(motionEvent);
    }

    public boolean zza(Uri uri) {
        if (uri == null) {
            throw new NullPointerException();
        }
        try {
            if (!uri.getHost().equals(this.zzahc)) {
                return false;
            }
            return uri.getPath().equals(this.zzahd);
        } catch (NullPointerException e) {
            return false;
        }
    }

    public zzaq zzaz() {
        return this.zzahh;
    }

    @Deprecated
    public Uri zzb(Uri uri, Context context) throws zzaw {
        return zza(uri, context, (View) null);
    }

    public void zzb(String str, String str2) {
        this.zzahc = str;
        this.zzahd = str2;
    }

    public boolean zzb(Uri uri) {
        if (uri == null) {
            throw new NullPointerException();
        }
        try {
            return uri.getHost().equals(this.zzahe);
        } catch (NullPointerException e) {
            return false;
        }
    }

    public boolean zzc(Uri uri) {
        if (uri == null) {
            throw new NullPointerException();
        }
        try {
            String host = uri.getHost();
            for (String str : this.zzahf) {
                if (host.endsWith(str)) {
                    return true;
                }
            }
            return false;
        } catch (NullPointerException e) {
            return false;
        }
    }

    public boolean zzd(Uri uri) {
        if (zzc(uri)) {
            for (String str : zzahg) {
                if (uri.getPath().endsWith(str)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public void zzm(String str) {
        this.zzahf = str.split(",");
    }
}
