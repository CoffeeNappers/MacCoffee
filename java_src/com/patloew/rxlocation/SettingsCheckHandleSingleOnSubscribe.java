package com.patloew.rxlocation;

import android.content.Context;
import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.LocationSettingsStatusCodes;
import io.reactivex.SingleEmitter;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class SettingsCheckHandleSingleOnSubscribe extends RxLocationSingleOnSubscribe<Boolean> {
    static final Map<String, WeakReference<SettingsCheckHandleSingleOnSubscribe>> observableMap = new HashMap();
    final Context context;
    private WeakReference<SingleEmitter<Boolean>> emitterWeakRef;
    final LocationSettingsRequest locationSettingsRequest;

    public SettingsCheckHandleSingleOnSubscribe(RxLocation rxLocation, LocationSettingsRequest locationSettingsRequest, Long timeoutTime, TimeUnit timeoutUnit) {
        super(rxLocation, timeoutTime, timeoutUnit);
        this.context = rxLocation.ctx;
        this.locationSettingsRequest = locationSettingsRequest;
    }

    public static void onResolutionResult(String observableId, int resultCode) {
        SingleEmitter<Boolean> observer;
        if (observableMap.containsKey(observableId)) {
            SettingsCheckHandleSingleOnSubscribe observable = observableMap.get(observableId).get();
            if (observable != null && observable.emitterWeakRef != null && (observer = observable.emitterWeakRef.get()) != null) {
                observer.onSuccess(Boolean.valueOf(resultCode == -1));
            }
            observableMap.remove(observableId);
        }
        observableMapCleanup();
    }

    static void observableMapCleanup() {
        if (!observableMap.isEmpty()) {
            Iterator<Map.Entry<String, WeakReference<SettingsCheckHandleSingleOnSubscribe>>> it = observableMap.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, WeakReference<SettingsCheckHandleSingleOnSubscribe>> entry = it.next();
                if (entry.getValue().get() == null) {
                    it.remove();
                }
            }
        }
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<Boolean> emitter) {
        this.emitterWeakRef = new WeakReference<>(emitter);
        setupLocationPendingResult(LocationServices.SettingsApi.checkLocationSettings(apiClient, this.locationSettingsRequest), SettingsCheckHandleSingleOnSubscribe$$Lambda$1.lambdaFactory$(this, emitter));
    }

    public static /* synthetic */ void lambda$onGoogleApiClientReady$0(SettingsCheckHandleSingleOnSubscribe settingsCheckHandleSingleOnSubscribe, SingleEmitter emitter, LocationSettingsResult result) {
        Status status = result.getStatus();
        switch (status.getStatusCode()) {
            case 0:
                emitter.onSuccess(true);
                return;
            case 6:
                if (settingsCheckHandleSingleOnSubscribe.context != null) {
                    String observableId = UUID.randomUUID().toString();
                    observableMap.put(observableId, new WeakReference<>(settingsCheckHandleSingleOnSubscribe));
                    Intent intent = new Intent(settingsCheckHandleSingleOnSubscribe.context, LocationSettingsActivity.class);
                    intent.putExtra("status", status);
                    intent.putExtra("id", observableId);
                    intent.setFlags(268435456);
                    settingsCheckHandleSingleOnSubscribe.context.startActivity(intent);
                    return;
                }
                emitter.onSuccess(false);
                return;
            case LocationSettingsStatusCodes.SETTINGS_CHANGE_UNAVAILABLE /* 8502 */:
                emitter.onSuccess(false);
                return;
            default:
                emitter.onError(new StatusException(result));
                return;
        }
    }
}
