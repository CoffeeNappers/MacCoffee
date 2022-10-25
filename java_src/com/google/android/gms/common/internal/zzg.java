package com.google.android.gms.common.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.SimpleArrayMap;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.R;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.zzsz;
/* loaded from: classes2.dex */
public final class zzg {
    private static final SimpleArrayMap<String, String> DO = new SimpleArrayMap<>();

    public static String zzcb(Context context) {
        String str = context.getApplicationInfo().name;
        if (TextUtils.isEmpty(str)) {
            String packageName = context.getPackageName();
            try {
                return zzsz.zzco(context).zzik(context.getPackageName()).toString();
            } catch (PackageManager.NameNotFoundException e) {
                return packageName;
            }
        }
        return str;
    }

    @Nullable
    public static String zzg(Context context, int i) {
        Resources resources = context.getResources();
        switch (i) {
            case 1:
                return resources.getString(R.string.common_google_play_services_install_title);
            case 2:
                return resources.getString(R.string.common_google_play_services_update_title);
            case 3:
                return resources.getString(R.string.common_google_play_services_enable_title);
            case 4:
            case 6:
            case 18:
                return null;
            case 5:
                Log.e("GoogleApiAvailability", "An invalid account was specified when connecting. Please provide a valid account.");
                return zzu(context, "common_google_play_services_invalid_account_title");
            case 7:
                Log.e("GoogleApiAvailability", "Network error occurred. Please retry request later.");
                return zzu(context, "common_google_play_services_network_error_title");
            case 8:
                Log.e("GoogleApiAvailability", "Internal error occurred. Please see logs for detailed information");
                return null;
            case 9:
                Log.e("GoogleApiAvailability", "Google Play services is invalid. Cannot recover.");
                return null;
            case 10:
                Log.e("GoogleApiAvailability", "Developer error occurred. Please see logs for detailed information");
                return null;
            case 11:
                Log.e("GoogleApiAvailability", "The application is not licensed to the user.");
                return null;
            case 12:
            case 13:
            case 14:
            case 15:
            case 19:
            default:
                Log.e("GoogleApiAvailability", new StringBuilder(33).append("Unexpected error code ").append(i).toString());
                return null;
            case 16:
                Log.e("GoogleApiAvailability", "One of the API components you attempted to connect to is not available.");
                return null;
            case 17:
                Log.e("GoogleApiAvailability", "The specified account could not be signed in.");
                return zzu(context, "common_google_play_services_sign_in_failed_title");
            case 20:
                Log.e("GoogleApiAvailability", "The current user profile is restricted and could not use authenticated features.");
                return zzu(context, "common_google_play_services_restricted_profile_title");
        }
    }

    private static String zzg(Context context, String str, String str2) {
        Resources resources = context.getResources();
        String zzu = zzu(context, str);
        if (zzu == null) {
            zzu = resources.getString(R.string.common_google_play_services_unknown_issue);
        }
        return String.format(resources.getConfiguration().locale, zzu, str2);
    }

    @NonNull
    public static String zzh(Context context, int i) {
        String zzu = i == 6 ? zzu(context, "common_google_play_services_resolution_required_title") : zzg(context, i);
        return zzu == null ? context.getResources().getString(R.string.common_google_play_services_notification_ticker) : zzu;
    }

    @NonNull
    public static String zzi(Context context, int i) {
        Resources resources = context.getResources();
        String zzcb = zzcb(context);
        switch (i) {
            case 1:
                return resources.getString(R.string.common_google_play_services_install_text, zzcb);
            case 2:
                return com.google.android.gms.common.util.zzi.zzci(context) ? resources.getString(R.string.common_google_play_services_wear_update_text) : resources.getString(R.string.common_google_play_services_update_text, zzcb);
            case 3:
                return resources.getString(R.string.common_google_play_services_enable_text, zzcb);
            case 4:
            case 6:
            case 8:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 19:
            default:
                return resources.getString(R.string.common_google_play_services_unknown_issue, zzcb);
            case 5:
                return zzg(context, "common_google_play_services_invalid_account_text", zzcb);
            case 7:
                return zzg(context, "common_google_play_services_network_error_text", zzcb);
            case 9:
                return resources.getString(R.string.common_google_play_services_unsupported_text, zzcb);
            case 16:
                return zzg(context, "common_google_play_services_api_unavailable_text", zzcb);
            case 17:
                return zzg(context, "common_google_play_services_sign_in_failed_text", zzcb);
            case 18:
                return resources.getString(R.string.common_google_play_services_updating_text, zzcb);
            case 20:
                return zzg(context, "common_google_play_services_restricted_profile_text", zzcb);
        }
    }

    @NonNull
    public static String zzj(Context context, int i) {
        return i == 6 ? zzg(context, "common_google_play_services_resolution_required_text", zzcb(context)) : zzi(context, i);
    }

    @NonNull
    public static String zzk(Context context, int i) {
        Resources resources = context.getResources();
        switch (i) {
            case 1:
                return resources.getString(R.string.common_google_play_services_install_button);
            case 2:
                return resources.getString(R.string.common_google_play_services_update_button);
            case 3:
                return resources.getString(R.string.common_google_play_services_enable_button);
            default:
                return resources.getString(17039370);
        }
    }

    @Nullable
    private static String zzu(Context context, String str) {
        synchronized (DO) {
            String str2 = DO.get(str);
            if (str2 != null) {
                return str2;
            }
            Resources remoteResource = GooglePlayServicesUtil.getRemoteResource(context);
            if (remoteResource == null) {
                return null;
            }
            int identifier = remoteResource.getIdentifier(str, "string", "com.google.android.gms");
            if (identifier == 0) {
                String valueOf = String.valueOf(str);
                Log.w("GoogleApiAvailability", valueOf.length() != 0 ? "Missing resource: ".concat(valueOf) : new String("Missing resource: "));
                return null;
            }
            String string = remoteResource.getString(identifier);
            if (!TextUtils.isEmpty(string)) {
                DO.put(str, string);
                return string;
            }
            String valueOf2 = String.valueOf(str);
            Log.w("GoogleApiAvailability", valueOf2.length() != 0 ? "Got empty resource: ".concat(valueOf2) : new String("Got empty resource: "));
            return null;
        }
    }
}
