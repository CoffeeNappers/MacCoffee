package com.google.android.gms.location.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.ActivityRecognition;
import com.google.android.gms.location.ActivityRecognitionApi;
/* loaded from: classes2.dex */
public class zza implements ActivityRecognitionApi {

    /* renamed from: com.google.android.gms.location.internal.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    private static abstract class AbstractC0145zza extends ActivityRecognition.zza<Status> {
        public AbstractC0145zza(GoogleApiClient googleApiClient) {
            super(googleApiClient);
        }

        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzb */
        public Status zzc(Status status) {
            return status;
        }
    }

    @Override // com.google.android.gms.location.ActivityRecognitionApi
    public PendingResult<Status> removeActivityUpdates(GoogleApiClient googleApiClient, final PendingIntent pendingIntent) {
        return googleApiClient.zzb((GoogleApiClient) new AbstractC0145zza(googleApiClient) { // from class: com.google.android.gms.location.internal.zza.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzl zzlVar) throws RemoteException {
                zzlVar.zzb(pendingIntent);
                zzc((AnonymousClass2) Status.xZ);
            }
        });
    }

    @Override // com.google.android.gms.location.ActivityRecognitionApi
    public PendingResult<Status> requestActivityUpdates(GoogleApiClient googleApiClient, final long j, final PendingIntent pendingIntent) {
        return googleApiClient.zzb((GoogleApiClient) new AbstractC0145zza(googleApiClient) { // from class: com.google.android.gms.location.internal.zza.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzl zzlVar) throws RemoteException {
                zzlVar.zza(j, pendingIntent);
                zzc((AnonymousClass1) Status.xZ);
            }
        });
    }
}
