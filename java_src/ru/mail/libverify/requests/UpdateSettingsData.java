package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Locale;
import ru.mail.libverify.utils.Gsonable;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class UpdateSettingsData implements l, Gsonable {
    public final n action;
    public final String appCheckParams;
    public final int blockTimeoutSec;
    public final String checkParams;
    public final String from;
    public final g policy;
    public final String smsParams;

    private UpdateSettingsData() {
        this.action = null;
        this.policy = null;
        this.from = null;
        this.blockTimeoutSec = 0;
        this.checkParams = null;
        this.smsParams = null;
        this.appCheckParams = null;
    }

    private UpdateSettingsData(@NonNull n nVar, @NonNull g gVar) {
        this.action = nVar;
        this.policy = gVar;
        this.from = null;
        this.blockTimeoutSec = 0;
        this.checkParams = null;
        this.smsParams = null;
        this.appCheckParams = null;
    }

    private UpdateSettingsData(@NonNull n nVar, @NonNull g gVar, String str, int i, String str2, String str3, String str4) {
        this.action = nVar;
        this.policy = gVar;
        this.from = str;
        this.blockTimeoutSec = i;
        this.checkParams = str2;
        this.smsParams = str3;
        this.appCheckParams = str4;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData a(@NonNull String str) {
        return new UpdateSettingsData(n.CHECK, g.NOTHING, null, 0, str, null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData a(@NonNull String str, int i) {
        return new UpdateSettingsData(n.BLOCK, g.NOTHING, str, i, null, null, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData a(@NonNull String str, @Nullable String str2) {
        return new UpdateSettingsData(n.CHECK, g.NOTHING, null, 0, str, str2, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData a(@NonNull n nVar) {
        return new UpdateSettingsData(nVar, g.NOTHING);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData a(@NonNull n nVar, @NonNull g gVar) {
        return new UpdateSettingsData(nVar, gVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData b() {
        return new UpdateSettingsData(n.NO_ACTION, g.NOTHING);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData b(@Nullable String str) {
        return new UpdateSettingsData(n.CHECK_INTERCEPTED, g.NOTHING, null, 0, null, str, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static UpdateSettingsData c(@NonNull String str) {
        return new UpdateSettingsData(n.CONFIRM_APP_CHECK, g.NOTHING, null, 0, null, null, str);
    }

    @Override // ru.mail.libverify.requests.l
    public final String a() {
        Locale locale = Locale.US;
        Object[] objArr = new Object[7];
        objArr[0] = this.action;
        objArr[1] = this.from;
        objArr[2] = Integer.valueOf(this.blockTimeoutSec);
        objArr[3] = this.checkParams;
        objArr[4] = this.smsParams;
        objArr[5] = this.policy;
        objArr[6] = this.appCheckParams == null ? null : ru.mail.libverify.utils.m.b(this.appCheckParams);
        return String.format(locale, "%s_%s_%d_%s_%s_%s_%s", objArr);
    }
}
