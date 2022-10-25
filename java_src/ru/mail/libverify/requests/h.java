package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.List;
import ru.mail.libverify.requests.e;
import ru.mail.libverify.requests.response.FetchDataResponse;
import ru.mail.libverify.utils.json.JsonParseException;
/* loaded from: classes3.dex */
public final class h extends e<FetchDataResponse> {
    private static final Integer b = 1800000;
    private static final Integer c = 40000;
    private static final Long d = 1800000L;
    private final f e;
    private final long f;

    public h(@NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, long j) {
        super(kVar);
        this.e = new f(str);
        this.f = j;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.requests.e
    public final e.a a() {
        e.a a = super.a();
        a.put("application_id", this.a.f());
        return a;
    }

    @Override // ru.mail.libverify.requests.e
    protected final /* synthetic */ FetchDataResponse a(String str) {
        if (TextUtils.isEmpty(str)) {
            throw new JsonParseException("jsonAnswer can't be null");
        }
        int lastIndexOf = str.lastIndexOf("}");
        if (lastIndexOf != str.length() - 1 && lastIndexOf != -1) {
            str = str.substring(0, lastIndexOf + 1);
        }
        StringBuilder sb = new StringBuilder(str.length());
        if (!str.startsWith("[") && !str.endsWith("]")) {
            str = sb.append("[").append(str).append("]").toString();
        }
        List<FetchDataResponse.ResponseItem> b2 = ru.mail.libverify.utils.json.a.b(str, FetchDataResponse.ResponseItem.class);
        for (FetchDataResponse.ResponseItem responseItem : b2) {
            if (responseItem != null && responseItem.getFetcherInfo() != null) {
                responseItem.getFetcherInfo().setTimestamp(System.currentTimeMillis());
            }
        }
        return new FetchDataResponse(b2);
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
    protected final String d() {
        return this.e.a();
    }

    @Override // ru.mail.libverify.requests.e
    protected final String e() {
        return this.e.a.getPath();
    }

    @Override // ru.mail.libverify.requests.e
    protected final String f() {
        return this.e.b();
    }

    @Override // ru.mail.libverify.requests.e
    protected final l g() {
        return null;
    }

    @Override // ru.mail.libverify.requests.e
    protected final Integer o() {
        return b;
    }

    @Override // ru.mail.libverify.requests.e
    protected final Integer p() {
        return c;
    }

    @Override // ru.mail.libverify.requests.e
    protected final Long q() {
        return this.f == 0 ? Long.valueOf(System.currentTimeMillis() - d.longValue()) : Long.valueOf(this.f);
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean r() {
        return true;
    }
}
