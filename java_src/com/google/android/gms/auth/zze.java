package com.google.android.gms.auth;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.TargetApi;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.SystemClock;
import android.support.annotation.RequiresPermission;
import android.text.TextUtils;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzl;
import com.google.android.gms.internal.zzbz;
import com.google.android.gms.internal.zzoe;
import com.google.android.gms.internal.zzsu;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;
/* loaded from: classes.dex */
public class zze {
    public static final int CHANGE_TYPE_ACCOUNT_ADDED = 1;
    public static final int CHANGE_TYPE_ACCOUNT_REMOVED = 2;
    public static final int CHANGE_TYPE_ACCOUNT_RENAMED_FROM = 3;
    public static final int CHANGE_TYPE_ACCOUNT_RENAMED_TO = 4;
    public static final String GOOGLE_ACCOUNT_TYPE = "com.google";
    public static final String KEY_ANDROID_PACKAGE_NAME;
    public static final String KEY_CALLER_UID;
    public static final String KEY_SUPPRESS_PROGRESS_SCREEN = "suppressProgressScreen";
    public static final String WORK_ACCOUNT_TYPE = "com.google.work";
    private static final String[] hC = {"com.google", "com.google.work", "cn.google"};
    private static final ComponentName hD;
    private static final ComponentName hE;
    private static final zzsu hF;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface zza<T> {
        T zzbu(IBinder iBinder) throws RemoteException, IOException, GoogleAuthException;
    }

    static {
        KEY_CALLER_UID = Build.VERSION.SDK_INT >= 11 ? "callerUid" : "callerUid";
        KEY_ANDROID_PACKAGE_NAME = Build.VERSION.SDK_INT >= 14 ? "androidPackageName" : "androidPackageName";
        hD = new ComponentName("com.google.android.gms", "com.google.android.gms.auth.GetToken");
        hE = new ComponentName("com.google.android.gms", "com.google.android.gms.recovery.RecoveryService");
        hF = zzd.zzb("GoogleAuthUtil");
    }

    public static void clearToken(Context context, final String str) throws GooglePlayServicesAvailabilityException, GoogleAuthException, IOException {
        zzaa.zzht("Calling this from your main thread can lead to deadlock");
        zzaz(context);
        final Bundle bundle = new Bundle();
        String str2 = context.getApplicationInfo().packageName;
        bundle.putString("clientPackageName", str2);
        if (!bundle.containsKey(KEY_ANDROID_PACKAGE_NAME)) {
            bundle.putString(KEY_ANDROID_PACKAGE_NAME, str2);
        }
        zza(context, hD, new zza<Void>() { // from class: com.google.android.gms.auth.zze.2
            @Override // com.google.android.gms.auth.zze.zza
            /* renamed from: zzbv */
            public Void zzbu(IBinder iBinder) throws RemoteException, IOException, GoogleAuthException {
                Bundle bundle2 = (Bundle) zze.zzn(zzbz.zza.zza(iBinder).zza(str, bundle));
                String string = bundle2.getString("Error");
                if (!bundle2.getBoolean("booleanResult")) {
                    throw new GoogleAuthException(string);
                }
                return null;
            }
        });
    }

    public static List<AccountChangeEvent> getAccountChangeEvents(Context context, final int i, final String str) throws GoogleAuthException, IOException {
        zzaa.zzh(str, "accountName must be provided");
        zzaa.zzht("Calling this from your main thread can lead to deadlock");
        zzaz(context);
        return (List) zza(context, hD, new zza<List<AccountChangeEvent>>() { // from class: com.google.android.gms.auth.zze.3
            @Override // com.google.android.gms.auth.zze.zza
            /* renamed from: zzbw */
            public List<AccountChangeEvent> zzbu(IBinder iBinder) throws RemoteException, IOException, GoogleAuthException {
                return ((AccountChangeEventsResponse) zze.zzn(zzbz.zza.zza(iBinder).zza(new AccountChangeEventsRequest().setAccountName(str).setEventIndex(i)))).getEvents();
            }
        });
    }

    public static String getAccountId(Context context, String str) throws GoogleAuthException, IOException {
        zzaa.zzh(str, "accountName must be provided");
        zzaa.zzht("Calling this from your main thread can lead to deadlock");
        zzaz(context);
        return getToken(context, str, "^^_account_id_^^", new Bundle());
    }

    public static String getToken(Context context, Account account, String str) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        return getToken(context, account, str, new Bundle());
    }

    public static String getToken(Context context, Account account, String str, Bundle bundle) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        zzc(account);
        return zzc(context, account, str, bundle).getToken();
    }

    @Deprecated
    public static String getToken(Context context, String str, String str2) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        return getToken(context, new Account(str, "com.google"), str2);
    }

    @Deprecated
    public static String getToken(Context context, String str, String str2, Bundle bundle) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        return getToken(context, new Account(str, "com.google"), str2, bundle);
    }

    @RequiresPermission("android.permission.MANAGE_ACCOUNTS")
    @Deprecated
    public static void invalidateToken(Context context, String str) {
        AccountManager.get(context).invalidateAuthToken("com.google", str);
    }

    @TargetApi(23)
    public static Bundle removeAccount(Context context, final Account account) throws GoogleAuthException, IOException {
        zzaa.zzy(context);
        zzc(account);
        zzaz(context);
        return (Bundle) zza(context, hD, new zza<Bundle>() { // from class: com.google.android.gms.auth.zze.4
            @Override // com.google.android.gms.auth.zze.zza
            /* renamed from: zzbx */
            public Bundle zzbu(IBinder iBinder) throws RemoteException, IOException, GoogleAuthException {
                return (Bundle) zze.zzn(zzbz.zza.zza(iBinder).zza(account));
            }
        });
    }

    private static <T> T zza(Context context, ComponentName componentName, zza<T> zzaVar) throws IOException, GoogleAuthException {
        com.google.android.gms.common.zza zzaVar2 = new com.google.android.gms.common.zza();
        zzl zzcc = zzl.zzcc(context);
        try {
            if (!zzcc.zza(componentName, zzaVar2, "GoogleAuthUtil")) {
                throw new IOException("Could not bind to service.");
            }
            try {
                return zzaVar.zzbu(zzaVar2.zzaqk());
            } catch (RemoteException | InterruptedException e) {
                hF.zze("GoogleAuthUtil", "Error on service connection.", e);
                throw new IOException("Error on service connection.", e);
            }
        } finally {
            zzcc.zzb(componentName, zzaVar2, "GoogleAuthUtil");
        }
    }

    private static void zzaz(Context context) throws GoogleAuthException {
        try {
            com.google.android.gms.common.zze.zzaz(context.getApplicationContext());
        } catch (GooglePlayServicesNotAvailableException e) {
            throw new GoogleAuthException(e.getMessage());
        } catch (GooglePlayServicesRepairableException e2) {
            throw new GooglePlayServicesAvailabilityException(e2.getConnectionStatusCode(), e2.getMessage(), e2.getIntent());
        }
    }

    public static TokenData zzc(Context context, final Account account, final String str, Bundle bundle) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        zzaa.zzht("Calling this from your main thread can lead to deadlock");
        zzaa.zzh(str, "Scope cannot be empty or null.");
        zzc(account);
        zzaz(context);
        final Bundle bundle2 = bundle == null ? new Bundle() : new Bundle(bundle);
        String str2 = context.getApplicationInfo().packageName;
        bundle2.putString("clientPackageName", str2);
        if (TextUtils.isEmpty(bundle2.getString(KEY_ANDROID_PACKAGE_NAME))) {
            bundle2.putString(KEY_ANDROID_PACKAGE_NAME, str2);
        }
        bundle2.putLong("service_connection_start_time_millis", SystemClock.elapsedRealtime());
        return (TokenData) zza(context, hD, new zza<TokenData>() { // from class: com.google.android.gms.auth.zze.1
            @Override // com.google.android.gms.auth.zze.zza
            /* renamed from: zzbt */
            public TokenData zzbu(IBinder iBinder) throws RemoteException, IOException, GoogleAuthException {
                Bundle bundle3 = (Bundle) zze.zzn(zzbz.zza.zza(iBinder).zza(account, str, bundle2));
                TokenData zzd = TokenData.zzd(bundle3, "tokenDetails");
                if (zzd != null) {
                    return zzd;
                }
                String string = bundle3.getString("Error");
                Intent intent = (Intent) bundle3.getParcelable("userRecoveryIntent");
                zzoe zzgi = zzoe.zzgi(string);
                if (!zzoe.zza(zzgi)) {
                    if (!zzoe.zzb(zzgi)) {
                        throw new GoogleAuthException(string);
                    }
                    throw new IOException(string);
                }
                zzsu zzsuVar = zze.hF;
                String valueOf = String.valueOf(zzgi);
                zzsuVar.zzf("GoogleAuthUtil", new StringBuilder(String.valueOf(valueOf).length() + 31).append("isUserRecoverableError status: ").append(valueOf).toString());
                throw new UserRecoverableAuthException(string, intent);
            }
        });
    }

    private static void zzc(Account account) {
        if (account == null) {
            throw new IllegalArgumentException("Account cannot be null");
        }
        if (TextUtils.isEmpty(account.name)) {
            throw new IllegalArgumentException("Account name cannot be empty!");
        }
        for (String str : hC) {
            if (str.equals(account.type)) {
                return;
            }
        }
        throw new IllegalArgumentException("Account type not supported");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzi(Intent intent) {
        if (intent == null) {
            throw new IllegalArgumentException("Callback cannot be null.");
        }
        try {
            Intent.parseUri(intent.toUri(1), 1);
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException("Parameter callback contains invalid data. It must be serializable using toUri() and parseUri().");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <T> T zzn(T t) throws IOException {
        if (t == null) {
            hF.zzf("GoogleAuthUtil", "Binder call returned null.");
            throw new IOException("Service unavailable.");
        }
        return t;
    }
}
