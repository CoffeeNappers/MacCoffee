package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import ru.mail.libverify.requests.e;
import ru.mail.libverify.requests.response.PhoneInfoResponse;
/* loaded from: classes3.dex */
public final class j extends e<PhoneInfoResponse> {
    private final ru.mail.libverify.storage.k b;
    private final String c;
    private final String d;
    private final String e;
    private final boolean f;

    public j(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @NonNull String str2, String str3, boolean z) {
        super(kVar);
        this.b = kVar;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = z;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.requests.e
    public final e.a a() {
        e.a aVar = new e.a();
        if (!TextUtils.isEmpty(this.e)) {
            aVar.put("id", this.e);
        }
        aVar.put("lang", this.b.t());
        aVar.put("service", this.d);
        aVar.put(SignupPhoneFragment.KEY_PHONE, this.c);
        aVar.put(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        String k = this.b.p().k();
        if (!TextUtils.isEmpty(k)) {
            aVar.put("iso_country_code", k);
        }
        if (this.f) {
            aVar.put(UserNotification.LAYOUT_NEWSFEED_INFO, "typing_check");
        }
        return aVar;
    }

    @Override // ru.mail.libverify.requests.e
    protected final /* bridge */ /* synthetic */ PhoneInfoResponse a(String str) {
        return (PhoneInfoResponse) ru.mail.libverify.utils.json.a.a(str, PhoneInfoResponse.class);
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean b() {
        return false;
    }

    @Override // ru.mail.libverify.requests.e
    public final m c() {
        return null;
    }

    @Override // ru.mail.libverify.requests.e
    protected final String f() {
        return "smsphoneinfo";
    }

    @Override // ru.mail.libverify.requests.e
    protected final l g() {
        return null;
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean n() {
        return false;
    }
}
