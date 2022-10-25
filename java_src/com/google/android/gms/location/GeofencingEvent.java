package com.google.android.gms.location;

import android.content.Intent;
import android.location.Location;
import com.google.android.gms.location.internal.ParcelableGeofence;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class GeofencingEvent {
    private final int ajY;
    private final List<Geofence> ajZ;
    private final Location aka;
    private final int zzcgw;

    private GeofencingEvent(int i, int i2, List<Geofence> list, Location location) {
        this.zzcgw = i;
        this.ajY = i2;
        this.ajZ = list;
        this.aka = location;
    }

    public static GeofencingEvent fromIntent(Intent intent) {
        if (intent == null) {
            return null;
        }
        return new GeofencingEvent(intent.getIntExtra("gms_error_code", -1), zzaa(intent), zzab(intent), (Location) intent.getParcelableExtra("com.google.android.location.intent.extra.triggering_location"));
    }

    private static int zzaa(Intent intent) {
        int intExtra = intent.getIntExtra("com.google.android.location.intent.extra.transition", -1);
        if (intExtra == -1) {
            return -1;
        }
        if (intExtra != 1 && intExtra != 2 && intExtra != 4) {
            return -1;
        }
        return intExtra;
    }

    private static List<Geofence> zzab(Intent intent) {
        ArrayList arrayList = (ArrayList) intent.getSerializableExtra("com.google.android.location.intent.extra.geofence_list");
        if (arrayList == null) {
            return null;
        }
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(ParcelableGeofence.zzw((byte[]) it.next()));
        }
        return arrayList2;
    }

    public int getErrorCode() {
        return this.zzcgw;
    }

    public int getGeofenceTransition() {
        return this.ajY;
    }

    public List<Geofence> getTriggeringGeofences() {
        return this.ajZ;
    }

    public Location getTriggeringLocation() {
        return this.aka;
    }

    public boolean hasError() {
        return this.zzcgw != -1;
    }
}
