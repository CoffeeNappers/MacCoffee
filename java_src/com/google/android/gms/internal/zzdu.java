package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import android.text.TextUtils;
@zzji
/* loaded from: classes.dex */
public class zzdu {
    @Nullable
    public zzdt zza(@Nullable zzds zzdsVar) {
        if (zzdsVar == null) {
            throw new IllegalArgumentException("CSI configuration can't be null. ");
        }
        if (!zzdsVar.zzls()) {
            zzkx.v("CsiReporterFactory: CSI is not enabled. No CSI reporter created.");
            return null;
        } else if (zzdsVar.getContext() == null) {
            throw new IllegalArgumentException("Context can't be null. Please set up context in CsiConfiguration.");
        } else {
            if (!TextUtils.isEmpty(zzdsVar.zzhz())) {
                return new zzdt(zzdsVar.getContext(), zzdsVar.zzhz(), zzdsVar.zzlt(), zzdsVar.zzlu());
            }
            throw new IllegalArgumentException("AfmaVersion can't be null or empty. Please set up afmaVersion in CsiConfiguration.");
        }
    }
}
