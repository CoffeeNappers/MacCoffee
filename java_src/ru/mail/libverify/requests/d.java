package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import com.vkontakte.android.fragments.AuthCheckFragment;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.e;
import ru.mail.libverify.requests.response.AttemptApiResponse;
/* loaded from: classes3.dex */
public final class d extends e<AttemptApiResponse> {
    private final f b;
    private final AttemptData c;

    public d(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @NonNull String str2, @NonNull String str3) {
        super(kVar);
        this.b = new f(str);
        this.c = new AttemptData(str, str2, VerificationApi.VerificationSource.APPLICATION_EXTERNAL, str3);
    }

    public d(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @NonNull String str2, VerificationApi.VerificationSource verificationSource) {
        super(kVar);
        this.b = new f(str);
        this.c = new AttemptData(str, str2, verificationSource, kVar.e());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public d(@NonNull ru.mail.libverify.storage.k kVar, @NonNull m mVar) {
        super(kVar);
        this.c = (AttemptData) ru.mail.libverify.utils.json.a.a(mVar.a, AttemptData.class);
        this.b = new f(this.c.verificationUrl);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.requests.e
    public final e.a a() {
        e.a aVar = new e.a(this.b.a.getQuery());
        aVar.put(AuthCheckFragment.KEY_CODE, this.c.code);
        aVar.put("application_id", this.c.applicationId);
        aVar.put("code_source", this.c.codeSource.toString());
        return aVar;
    }

    @Override // ru.mail.libverify.requests.e
    protected final /* synthetic */ AttemptApiResponse a(String str) {
        AttemptApiResponse attemptApiResponse = (AttemptApiResponse) ru.mail.libverify.utils.json.a.a(str, AttemptApiResponse.class);
        if (attemptApiResponse != null && attemptApiResponse.getFetcherInfo() != null) {
            attemptApiResponse.getFetcherInfo().setTimestamp(System.currentTimeMillis());
        }
        return attemptApiResponse;
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean b() {
        return false;
    }

    @Override // ru.mail.libverify.requests.e
    public final m c() {
        return new m(ru.mail.libverify.utils.json.a.a(this.c));
    }

    @Override // ru.mail.libverify.requests.e
    protected final String d() {
        return this.b.a();
    }

    @Override // ru.mail.libverify.requests.e
    protected final String e() {
        return this.b.a.getPath();
    }

    @Override // ru.mail.libverify.requests.e
    protected final String f() {
        return this.b.b();
    }

    @Override // ru.mail.libverify.requests.e
    protected final l g() {
        return this.c;
    }
}
