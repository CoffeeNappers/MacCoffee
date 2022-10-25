package com.google.android.gms.internal;

import android.os.Handler;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzp;
import com.google.android.gms.ads.internal.client.zzq;
import com.google.android.gms.ads.internal.client.zzw;
import com.google.android.gms.ads.internal.reward.client.zzd;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzig;
import java.util.LinkedList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
class zzfx {
    private final List<zza> zzani = new LinkedList();

    /* loaded from: classes2.dex */
    interface zza {
        void zzb(zzfy zzfyVar) throws RemoteException;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(final zzfy zzfyVar) {
        Handler handler = zzlb.zzcvl;
        for (final zza zzaVar : this.zzani) {
            handler.post(new Runnable() { // from class: com.google.android.gms.internal.zzfx.7
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        zzaVar.zzb(zzfyVar);
                    } catch (RemoteException e) {
                        zzkx.zzc("Could not propagate interstitial ad event.", e);
                    }
                }
            });
        }
        this.zzani.clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzc(com.google.android.gms.ads.internal.zzl zzlVar) {
        zzlVar.zza(new zzq.zza() { // from class: com.google.android.gms.internal.zzfx.1
            @Override // com.google.android.gms.ads.internal.client.zzq
            public void onAdClosed() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.1.1
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzanl != null) {
                            zzfyVar.zzanl.onAdClosed();
                        }
                        com.google.android.gms.ads.internal.zzu.zzhb().zznm();
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.client.zzq
            public void onAdFailedToLoad(final int i) throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.1.2
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzanl != null) {
                            zzfyVar.zzanl.onAdFailedToLoad(i);
                        }
                    }
                });
                zzkx.v("Pooled interstitial failed to load.");
            }

            @Override // com.google.android.gms.ads.internal.client.zzq
            public void onAdLeftApplication() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.1.3
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzanl != null) {
                            zzfyVar.zzanl.onAdLeftApplication();
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.client.zzq
            public void onAdLoaded() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.1.4
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzanl != null) {
                            zzfyVar.zzanl.onAdLoaded();
                        }
                    }
                });
                zzkx.v("Pooled interstitial loaded.");
            }

            @Override // com.google.android.gms.ads.internal.client.zzq
            public void onAdOpened() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.1.5
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzanl != null) {
                            zzfyVar.zzanl.onAdOpened();
                        }
                    }
                });
            }
        });
        zzlVar.zza(new zzw.zza() { // from class: com.google.android.gms.internal.zzfx.2
            @Override // com.google.android.gms.ads.internal.client.zzw
            public void onAppEvent(final String str, final String str2) throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.2.1
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsf != null) {
                            zzfyVar.zzbsf.onAppEvent(str, str2);
                        }
                    }
                });
            }
        });
        zzlVar.zza(new zzig.zza() { // from class: com.google.android.gms.internal.zzfx.3
            @Override // com.google.android.gms.internal.zzig
            public void zza(final zzif zzifVar) throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.3.1
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsg != null) {
                            zzfyVar.zzbsg.zza(zzifVar);
                        }
                    }
                });
            }
        });
        zzlVar.zza(new zzed.zza() { // from class: com.google.android.gms.internal.zzfx.4
            @Override // com.google.android.gms.internal.zzed
            public void zza(final zzec zzecVar) throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.4.1
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsh != null) {
                            zzfyVar.zzbsh.zza(zzecVar);
                        }
                    }
                });
            }
        });
        zzlVar.zza(new zzp.zza() { // from class: com.google.android.gms.internal.zzfx.5
            @Override // com.google.android.gms.ads.internal.client.zzp
            public void onAdClicked() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.5.1
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsi != null) {
                            zzfyVar.zzbsi.onAdClicked();
                        }
                    }
                });
            }
        });
        zzlVar.zza(new zzd.zza() { // from class: com.google.android.gms.internal.zzfx.6
            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void onRewardedVideoAdClosed() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.4
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.onRewardedVideoAdClosed();
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void onRewardedVideoAdFailedToLoad(final int i) throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.7
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.onRewardedVideoAdFailedToLoad(i);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void onRewardedVideoAdLeftApplication() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.6
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.onRewardedVideoAdLeftApplication();
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void onRewardedVideoAdLoaded() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.1
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.onRewardedVideoAdLoaded();
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void onRewardedVideoAdOpened() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.2
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.onRewardedVideoAdOpened();
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void onRewardedVideoStarted() throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.3
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.onRewardedVideoStarted();
                        }
                    }
                });
            }

            @Override // com.google.android.gms.ads.internal.reward.client.zzd
            public void zza(final com.google.android.gms.ads.internal.reward.client.zza zzaVar) throws RemoteException {
                zzfx.this.zzani.add(new zza() { // from class: com.google.android.gms.internal.zzfx.6.5
                    @Override // com.google.android.gms.internal.zzfx.zza
                    public void zzb(zzfy zzfyVar) throws RemoteException {
                        if (zzfyVar.zzbsj != null) {
                            zzfyVar.zzbsj.zza(zzaVar);
                        }
                    }
                });
            }
        });
    }
}
