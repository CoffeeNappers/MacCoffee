package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.RemoteException;
import android.util.Log;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.appdatasearch.UsageInfo;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndexApi;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import com.vk.core.util.AnimationUtils;
import java.util.List;
/* loaded from: classes2.dex */
public final class zznk implements com.google.android.gms.appdatasearch.zzk, AppIndexApi {
    private static final String TAG = zznk.class.getSimpleName();

    @Deprecated
    /* loaded from: classes.dex */
    private static final class zza implements AppIndexApi.ActionResult {
        private zznk hb;
        private PendingResult<Status> hc;
        private Action hd;

        zza(zznk zznkVar, PendingResult<Status> pendingResult, Action action) {
            this.hb = zznkVar;
            this.hc = pendingResult;
            this.hd = action;
        }

        @Override // com.google.android.gms.appindexing.AppIndexApi.ActionResult
        public PendingResult<Status> end(GoogleApiClient googleApiClient) {
            return this.hb.zza(googleApiClient, zznj.zza(this.hd, System.currentTimeMillis(), googleApiClient.getContext().getPackageName(), 2));
        }

        @Override // com.google.android.gms.appindexing.AppIndexApi.ActionResult
        public PendingResult<Status> getPendingResult() {
            return this.hc;
        }
    }

    /* loaded from: classes2.dex */
    private static abstract class zzb<T extends Result> extends zzqo.zza<T, zzni> {
        public zzb(GoogleApiClient googleApiClient) {
            super(com.google.android.gms.appdatasearch.zza.gb, googleApiClient);
        }

        protected abstract void zza(zznf zznfVar) throws RemoteException;

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqo.zza
        public final void zza(zzni zzniVar) throws RemoteException {
            zza(zzniVar.zzaht());
        }
    }

    /* loaded from: classes2.dex */
    public static abstract class zzc<T extends Result> extends zzb<Status> {
        public zzc(GoogleApiClient googleApiClient) {
            super(googleApiClient);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzb */
        public Status zzc(Status status) {
            return status;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zznh<Status> {
        public zzd(zzqo.zzb<Status> zzbVar) {
            super(zzbVar);
        }

        @Override // com.google.android.gms.internal.zznh, com.google.android.gms.internal.zzng
        public void zza(Status status) {
            this.gY.setResult(status);
        }
    }

    public static Intent zza(String str, Uri uri) {
        zzb(str, uri);
        if (zzm(uri)) {
            return new Intent("android.intent.action.VIEW", uri);
        }
        if (zzn(uri)) {
            return new Intent("android.intent.action.VIEW", zzl(uri));
        }
        String valueOf = String.valueOf(uri);
        throw new RuntimeException(new StringBuilder(String.valueOf(valueOf).length() + 70).append("appIndexingUri is neither an HTTP(S) URL nor an \"android-app://\" URL: ").append(valueOf).toString());
    }

    private PendingResult<Status> zza(GoogleApiClient googleApiClient, Action action, int i) {
        return zza(googleApiClient, zznj.zza(action, System.currentTimeMillis(), googleApiClient.getContext().getPackageName(), i));
    }

    private static void zzb(String str, Uri uri) {
        if (zzm(uri)) {
            if (!uri.getHost().isEmpty()) {
                return;
            }
            String valueOf = String.valueOf(uri);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 98).append("AppIndex: The web URL must have a host (follow the format http(s)://<host>/<path>). Provided URI: ").append(valueOf).toString());
        } else if (!zzn(uri)) {
            String valueOf2 = String.valueOf(uri);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf2).length() + 176).append("AppIndex: The URI scheme must either be 'http(s)' or 'android-app'. If the latter, it must follow the format 'android-app://<package_name>/<scheme>/<host_path>'. Provided URI: ").append(valueOf2).toString());
        } else if (str != null && !str.equals(uri.getHost())) {
            String valueOf3 = String.valueOf(uri);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf3).length() + AnimationUtils.DELAY_MID).append("AppIndex: The android-app URI host must match the package name and follow the format android-app://<package_name>/<scheme>/<host_path>. Provided URI: ").append(valueOf3).toString());
        } else {
            List<String> pathSegments = uri.getPathSegments();
            if (!pathSegments.isEmpty() && !pathSegments.get(0).isEmpty()) {
                return;
            }
            String valueOf4 = String.valueOf(uri);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf4).length() + 128).append("AppIndex: The app URI scheme must exist and follow the format android-app://<package_name>/<scheme>/<host_path>). Provided URI: ").append(valueOf4).toString());
        }
    }

    private static Uri zzl(Uri uri) {
        List<String> pathSegments = uri.getPathSegments();
        Uri.Builder builder = new Uri.Builder();
        builder.scheme(pathSegments.get(0));
        if (pathSegments.size() > 1) {
            builder.authority(pathSegments.get(1));
            int i = 2;
            while (true) {
                int i2 = i;
                if (i2 >= pathSegments.size()) {
                    break;
                }
                builder.appendPath(pathSegments.get(i2));
                i = i2 + 1;
            }
        } else {
            String str = TAG;
            String valueOf = String.valueOf(uri);
            Log.e(str, new StringBuilder(String.valueOf(valueOf).length() + 88).append("The app URI must have the format: android-app://<package_name>/<scheme>/<path>. But got ").append(valueOf).toString());
        }
        builder.encodedQuery(uri.getEncodedQuery());
        builder.encodedFragment(uri.getEncodedFragment());
        return builder.build();
    }

    private static boolean zzm(Uri uri) {
        String scheme = uri.getScheme();
        return UriUtil.HTTP_SCHEME.equals(scheme) || UriUtil.HTTPS_SCHEME.equals(scheme);
    }

    private static boolean zzn(Uri uri) {
        return "android-app".equals(uri.getScheme());
    }

    public static void zzw(List<AppIndexApi.AppIndexingLink> list) {
        if (list == null) {
            return;
        }
        for (AppIndexApi.AppIndexingLink appIndexingLink : list) {
            zzb(null, appIndexingLink.appIndexingUrl);
        }
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public AppIndexApi.ActionResult action(GoogleApiClient googleApiClient, Action action) {
        return new zza(this, zza(googleApiClient, action, 1), action);
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public PendingResult<Status> end(GoogleApiClient googleApiClient, Action action) {
        return zza(googleApiClient, action, 2);
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public PendingResult<Status> start(GoogleApiClient googleApiClient, Action action) {
        return zza(googleApiClient, action, 1);
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public PendingResult<Status> view(GoogleApiClient googleApiClient, Activity activity, Intent intent, String str, Uri uri, List<AppIndexApi.AppIndexingLink> list) {
        String packageName = googleApiClient.getContext().getPackageName();
        zzw(list);
        return zza(googleApiClient, new UsageInfo(packageName, intent, str, uri, null, list, 1));
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public PendingResult<Status> view(GoogleApiClient googleApiClient, Activity activity, Uri uri, String str, Uri uri2, List<AppIndexApi.AppIndexingLink> list) {
        String packageName = googleApiClient.getContext().getPackageName();
        zzb(packageName, uri);
        return view(googleApiClient, activity, zza(packageName, uri), str, uri2, list);
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public PendingResult<Status> viewEnd(GoogleApiClient googleApiClient, Activity activity, Intent intent) {
        return zza(googleApiClient, new UsageInfo.zza().zza(UsageInfo.zza(googleApiClient.getContext().getPackageName(), intent)).zzaa(System.currentTimeMillis()).zzcq(0).zzcr(2).zzahs());
    }

    @Override // com.google.android.gms.appindexing.AppIndexApi
    public PendingResult<Status> viewEnd(GoogleApiClient googleApiClient, Activity activity, Uri uri) {
        return viewEnd(googleApiClient, activity, zza(googleApiClient.getContext().getPackageName(), uri));
    }

    public PendingResult<Status> zza(GoogleApiClient googleApiClient, final UsageInfo... usageInfoArr) {
        return googleApiClient.zza((GoogleApiClient) new zzc<Status>(googleApiClient) { // from class: com.google.android.gms.internal.zznk.1
            @Override // com.google.android.gms.internal.zznk.zzb
            protected void zza(zznf zznfVar) throws RemoteException {
                zznfVar.zza(new zzd(this), (String) null, usageInfoArr);
            }
        });
    }
}
