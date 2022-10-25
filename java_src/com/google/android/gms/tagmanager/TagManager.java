package com.google.android.gms.tagmanager;

import android.annotation.TargetApi;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.RawRes;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.tagmanager.DataLayer;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
/* loaded from: classes2.dex */
public class TagManager {
    private static TagManager aHJ;
    private final DataLayer aDZ;
    private final zzt aGC;
    private final zza aHG;
    private final zzdb aHH;
    private final ConcurrentMap<String, zzo> aHI;
    private final Context mContext;

    /* loaded from: classes2.dex */
    public interface zza {
        zzp zza(Context context, TagManager tagManager, Looper looper, String str, int i, zzt zztVar);
    }

    TagManager(Context context, zza zzaVar, DataLayer dataLayer, zzdb zzdbVar) {
        if (context == null) {
            throw new NullPointerException("context cannot be null");
        }
        this.mContext = context.getApplicationContext();
        this.aHH = zzdbVar;
        this.aHG = zzaVar;
        this.aHI = new ConcurrentHashMap();
        this.aDZ = dataLayer;
        this.aDZ.zza(new DataLayer.zzb() { // from class: com.google.android.gms.tagmanager.TagManager.1
            @Override // com.google.android.gms.tagmanager.DataLayer.zzb
            public void zzaz(Map<String, Object> map) {
                Object obj = map.get("event");
                if (obj != null) {
                    TagManager.this.zzpt(obj.toString());
                }
            }
        });
        this.aDZ.zza(new zzd(this.mContext));
        this.aGC = new zzt();
        zzcgz();
        zzcha();
    }

    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public static TagManager getInstance(Context context) {
        TagManager tagManager;
        synchronized (TagManager.class) {
            if (aHJ == null) {
                if (context == null) {
                    zzbo.e("TagManager.getInstance requires non-null context.");
                    throw new NullPointerException();
                }
                aHJ = new TagManager(context, new zza() { // from class: com.google.android.gms.tagmanager.TagManager.2
                    @Override // com.google.android.gms.tagmanager.TagManager.zza
                    public zzp zza(Context context2, TagManager tagManager2, Looper looper, String str, int i, zzt zztVar) {
                        return new zzp(context2, tagManager2, looper, str, i, zztVar);
                    }
                }, new DataLayer(new zzx(context)), zzdc.zzcgt());
            }
            tagManager = aHJ;
        }
        return tagManager;
    }

    @TargetApi(14)
    private void zzcgz() {
        if (Build.VERSION.SDK_INT >= 14) {
            this.mContext.registerComponentCallbacks(new ComponentCallbacks2() { // from class: com.google.android.gms.tagmanager.TagManager.3
                @Override // android.content.ComponentCallbacks
                public void onConfigurationChanged(Configuration configuration) {
                }

                @Override // android.content.ComponentCallbacks
                public void onLowMemory() {
                }

                @Override // android.content.ComponentCallbacks2
                public void onTrimMemory(int i) {
                    if (i == 20) {
                        TagManager.this.dispatch();
                    }
                }
            });
        }
    }

    private void zzcha() {
        com.google.android.gms.tagmanager.zza.zzdw(this.mContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzpt(String str) {
        for (zzo zzoVar : this.aHI.values()) {
            zzoVar.zzov(str);
        }
    }

    public void dispatch() {
        this.aHH.dispatch();
    }

    public DataLayer getDataLayer() {
        return this.aDZ;
    }

    public PendingResult<ContainerHolder> loadContainerDefaultOnly(String str, @RawRes int i) {
        zzp zza2 = this.aHG.zza(this.mContext, this, null, str, i, this.aGC);
        zza2.zzced();
        return zza2;
    }

    public PendingResult<ContainerHolder> loadContainerDefaultOnly(String str, @RawRes int i, Handler handler) {
        zzp zza2 = this.aHG.zza(this.mContext, this, handler.getLooper(), str, i, this.aGC);
        zza2.zzced();
        return zza2;
    }

    public PendingResult<ContainerHolder> loadContainerPreferFresh(String str, @RawRes int i) {
        zzp zza2 = this.aHG.zza(this.mContext, this, null, str, i, this.aGC);
        zza2.zzcef();
        return zza2;
    }

    public PendingResult<ContainerHolder> loadContainerPreferFresh(String str, @RawRes int i, Handler handler) {
        zzp zza2 = this.aHG.zza(this.mContext, this, handler.getLooper(), str, i, this.aGC);
        zza2.zzcef();
        return zza2;
    }

    public PendingResult<ContainerHolder> loadContainerPreferNonDefault(String str, @RawRes int i) {
        zzp zza2 = this.aHG.zza(this.mContext, this, null, str, i, this.aGC);
        zza2.zzcee();
        return zza2;
    }

    public PendingResult<ContainerHolder> loadContainerPreferNonDefault(String str, @RawRes int i, Handler handler) {
        zzp zza2 = this.aHG.zza(this.mContext, this, handler.getLooper(), str, i, this.aGC);
        zza2.zzcee();
        return zza2;
    }

    public void setVerboseLoggingEnabled(boolean z) {
        zzbo.setLogLevel(z ? 2 : 5);
    }

    public int zza(zzo zzoVar) {
        this.aHI.put(zzoVar.getContainerId(), zzoVar);
        return this.aHI.size();
    }

    public boolean zzb(zzo zzoVar) {
        return this.aHI.remove(zzoVar.getContainerId()) != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized boolean zzv(Uri uri) {
        boolean z;
        zzcj zzcfz = zzcj.zzcfz();
        if (zzcfz.zzv(uri)) {
            String containerId = zzcfz.getContainerId();
            switch (zzcfz.zzcga()) {
                case NONE:
                    zzo zzoVar = this.aHI.get(containerId);
                    if (zzoVar != null) {
                        zzoVar.zzox(null);
                        zzoVar.refresh();
                        break;
                    }
                    break;
                case CONTAINER:
                case CONTAINER_DEBUG:
                    for (String str : this.aHI.keySet()) {
                        zzo zzoVar2 = this.aHI.get(str);
                        if (str.equals(containerId)) {
                            zzoVar2.zzox(zzcfz.zzcgb());
                            zzoVar2.refresh();
                        } else if (zzoVar2.zzcea() != null) {
                            zzoVar2.zzox(null);
                            zzoVar2.refresh();
                        }
                    }
                    break;
            }
            z = true;
        } else {
            z = false;
        }
        return z;
    }
}
