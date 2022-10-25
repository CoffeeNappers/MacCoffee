package com.google.android.gms.internal;

import android.content.Context;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public class zzafx {
    public static final Integer aMD = 0;
    public static final Integer aME = 1;
    private final ExecutorService aGI;
    private final Context mContext;

    public zzafx(Context context) {
        this(context, Executors.newSingleThreadExecutor());
    }

    zzafx(Context context, ExecutorService executorService) {
        this.mContext = context;
        this.aGI = executorService;
    }
}
