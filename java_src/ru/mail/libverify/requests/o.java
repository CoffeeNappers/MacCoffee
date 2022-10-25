package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.data.ServerKeys;
import ru.mail.libverify.requests.e;
import ru.mail.libverify.requests.response.UpdateSettingsApiResponse;
/* loaded from: classes3.dex */
public final class o extends e<UpdateSettingsApiResponse> {
    public String b;
    @NonNull
    private final UpdateSettingsData c;

    private o(@NonNull ru.mail.libverify.storage.k kVar, @NonNull UpdateSettingsData updateSettingsData) {
        super(kVar);
        this.c = updateSettingsData;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public o(@NonNull ru.mail.libverify.storage.k kVar, @NonNull m mVar) {
        super(kVar);
        this.c = (UpdateSettingsData) ru.mail.libverify.utils.json.a.a(mVar.a, UpdateSettingsData.class);
    }

    public static o a(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.b());
    }

    public static o a(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str) {
        return new o(kVar, UpdateSettingsData.c(str));
    }

    public static o a(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, int i) {
        return new o(kVar, UpdateSettingsData.a(str, i));
    }

    public static o a(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @Nullable String str2) {
        return new o(kVar, UpdateSettingsData.a(str, str2));
    }

    public static o b(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REQUEST_SMS_INFO));
    }

    public static o b(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str) {
        return new o(kVar, UpdateSettingsData.a(str));
    }

    public static o c(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.CHECK_SETTINGS_PACKAGES_CHANGED));
    }

    public static o c(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str) {
        return new o(kVar, UpdateSettingsData.b(str));
    }

    public static o d(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.CHECK_SETTINGS_TIMER));
    }

    public static o e(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.CHECK_SETTINGS_RESTART));
    }

    public static o f(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.PING_RESPONSE_GCM));
    }

    public static o g(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.PING_RESPONSE_FETCHER));
    }

    public static o h(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REPORT_NO_GCM_SERVICE));
    }

    public static o i(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REQUEST_APP_CHECK_ID));
    }

    public static o j(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REPORT_SIGNOUT, g.DEVICE));
    }

    public static o k(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REPORT_SIGNOUT, g.PHONE));
    }

    public static o l(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REPORT_SOFT_SIGNOUT));
    }

    public static o m(@NonNull ru.mail.libverify.storage.k kVar) {
        return new o(kVar, UpdateSettingsData.a(n.REPORT_PHONE_NUMBER_REUSE));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.requests.e
    public final e.a a() {
        e.a a = super.a();
        this.b = this.a.o();
        if (!TextUtils.isEmpty(this.b)) {
            a.put("push_token", this.b);
        }
        if (this.c.blockTimeoutSec > 0) {
            a.put("block_timeout", Integer.toString(this.c.blockTimeoutSec));
        }
        if (!TextUtils.isEmpty(this.c.from)) {
            a.put(ServerKeys.FROM, this.c.from);
        }
        if (this.c.action != null && this.c.action != n.NO_ACTION) {
            a.put(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, this.c.action.a());
        }
        if (!TextUtils.isEmpty(this.c.checkParams)) {
            a.put("checkparams", ru.mail.libverify.utils.m.d(this.c.checkParams));
        }
        if (!TextUtils.isEmpty(this.c.smsParams)) {
            a.put("smsparams", ru.mail.libverify.utils.m.d(this.c.smsParams));
        }
        a.put("language", this.a.t());
        if (this.c.policy != null && this.c.policy != g.NOTHING) {
            a.put("drop", this.c.policy.a());
        }
        if (!TextUtils.isEmpty(this.c.appCheckParams)) {
            a.put("jws", this.c.appCheckParams);
        }
        return a;
    }

    @Override // ru.mail.libverify.requests.e
    protected final /* synthetic */ UpdateSettingsApiResponse a(String str) {
        UpdateSettingsApiResponse updateSettingsApiResponse = (UpdateSettingsApiResponse) ru.mail.libverify.utils.json.a.a(str, UpdateSettingsApiResponse.class);
        if (updateSettingsApiResponse != null) {
            if (this.c.action == n.REQUEST_SMS_INFO) {
                updateSettingsApiResponse.setHasSmsInfo(true);
            }
            if (updateSettingsApiResponse.getSmsInfo() != null) {
                updateSettingsApiResponse.getSmsInfo().setTimestamp(System.currentTimeMillis());
            }
            if (updateSettingsApiResponse.getFetcherInfo() != null) {
                updateSettingsApiResponse.getFetcherInfo().setTimestamp(System.currentTimeMillis());
            }
        }
        return updateSettingsApiResponse;
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean b() {
        return true;
    }

    @Override // ru.mail.libverify.requests.e
    public final m c() {
        return new m(ru.mail.libverify.utils.json.a.a(this.c));
    }

    @Override // ru.mail.libverify.requests.e
    protected final String f() {
        return this.c.action == n.CHECK_INTERCEPTED ? "libverifyverificationcheck" : "libverifysettings";
    }

    @Override // ru.mail.libverify.requests.e
    protected final l g() {
        return this.c;
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean s() {
        return !TextUtils.isEmpty(this.c.appCheckParams);
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean t() {
        return this.c.action == n.CHECK_INTERCEPTED;
    }
}
