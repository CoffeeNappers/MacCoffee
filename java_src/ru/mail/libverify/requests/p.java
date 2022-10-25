package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import ru.mail.libverify.requests.e;
import ru.mail.libverify.requests.response.VerifyApiResponse;
/* loaded from: classes3.dex */
public final class p extends e<VerifyApiResponse> {
    private final String b;
    private final String c;
    private final String d;
    private a[] e;
    private String f;

    /* loaded from: classes.dex */
    public enum a {
        IVR("ivr"),
        SMS("sms"),
        CALL("call"),
        PUSH("push");
        
        public final String value;

        a(String str) {
            this.value = str;
        }
    }

    private p(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @NonNull String str2, @NonNull String str3, String str4) {
        super(kVar);
        this.b = str;
        this.c = str2;
        this.d = str4;
        this.f = str3;
        this.e = null;
    }

    public p(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @NonNull String str2, @NonNull String str3, String str4, @NonNull a[] aVarArr) {
        this(kVar, str, str2, str3, str4);
        this.e = aVarArr;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.requests.e
    public final e.a a() {
        if (TextUtils.isEmpty(this.f)) {
            throw new IllegalArgumentException("Can't prepare verification request without phone number");
        }
        e.a a2 = super.a();
        a2.put("mode", "manual");
        a2.put("session_id", this.b);
        a2.put("service", this.c);
        a2.put("language", this.a.t());
        a2.put("capabilities", "call_number_fragment,call_session_hash");
        String w = this.a.w();
        if (!TextUtils.isEmpty(w)) {
            a2.put("device_name", w);
        }
        String b = this.a.q().b();
        if (!TextUtils.isEmpty(b)) {
            a2.put("device_account", b);
        }
        if (this.e == null) {
            a2.put("checks", "ivr,sms,call,push");
        } else if (this.e.length == 0) {
            throw new IllegalArgumentException("Cheks param should either null or should contain any items");
        } else {
            a[] aVarArr = this.e;
            int length = aVarArr.length;
            int i = 0;
            String str = "";
            boolean z = false;
            while (i < length) {
                a aVar = aVarArr[i];
                if (str.length() != 0) {
                    str = str + ",";
                }
                String str2 = str + aVar.value;
                i++;
                z = aVar == a.CALL ? true : z;
                str = str2;
            }
            a2.put("checks", str);
            if (z) {
                String x = this.a.x();
                if (!TextUtils.isEmpty(x)) {
                    a2.put("ext_info", ru.mail.libverify.utils.m.d(x));
                }
            }
        }
        if (!TextUtils.isEmpty(this.d)) {
            a2.put("user_id", this.d);
        }
        if (!TextUtils.isEmpty(this.f)) {
            a2.put(SignupPhoneFragment.KEY_PHONE, this.f);
        }
        String o = this.a.o();
        if (!TextUtils.isEmpty(o)) {
            a2.put("push_token", o);
        }
        String v = this.a.v();
        if (!TextUtils.isEmpty(v)) {
            a2.put("server_key", v);
        }
        a(a2);
        return a2;
    }

    @Override // ru.mail.libverify.requests.e
    protected final /* bridge */ /* synthetic */ VerifyApiResponse a(String str) {
        return (VerifyApiResponse) ru.mail.libverify.utils.json.a.a(str, VerifyApiResponse.class);
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean b() {
        return true;
    }

    @Override // ru.mail.libverify.requests.e
    public final m c() {
        return null;
    }

    @Override // ru.mail.libverify.requests.e
    protected final String f() {
        return "verify";
    }

    @Override // ru.mail.libverify.requests.e
    protected final l g() {
        return null;
    }
}
