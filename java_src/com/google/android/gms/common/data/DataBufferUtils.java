package com.google.android.gms.common.data;

import android.os.Bundle;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public final class DataBufferUtils {
    private DataBufferUtils() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T, E extends Freezable<T>> ArrayList<T> freezeAndClose(DataBuffer<E> dataBuffer) {
        ArrayList<T> arrayList = (ArrayList<T>) new ArrayList(dataBuffer.getCount());
        try {
            for (E e : dataBuffer) {
                arrayList.add(e.freeze());
            }
            return arrayList;
        } finally {
            dataBuffer.close();
        }
    }

    public static boolean hasData(DataBuffer<?> dataBuffer) {
        return dataBuffer != null && dataBuffer.getCount() > 0;
    }

    public static boolean hasNextPage(DataBuffer<?> dataBuffer) {
        Bundle zzaui = dataBuffer.zzaui();
        return (zzaui == null || zzaui.getString("next_page_token") == null) ? false : true;
    }

    public static boolean hasPrevPage(DataBuffer<?> dataBuffer) {
        Bundle zzaui = dataBuffer.zzaui();
        return (zzaui == null || zzaui.getString("prev_page_token") == null) ? false : true;
    }
}
