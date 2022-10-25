package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import java.util.List;
import ru.mail.libverify.requests.e;
import ru.mail.libverify.requests.response.PushStatusApiResponse;
/* loaded from: classes3.dex */
public final class k extends e<PushStatusApiResponse> {
    public final PushStatusData b;

    /* loaded from: classes3.dex */
    public enum a {
        SMS_CODE,
        SERVER_INFO
    }

    /* loaded from: classes3.dex */
    public enum b {
        GCM,
        FETCHER,
        UNKNOWN
    }

    /* loaded from: classes3.dex */
    public enum c {
        DELIVERED,
        SMS_ACCESS_ERROR,
        IMSI_NOT_MATCH,
        IMEI_NOT_MATCH,
        APPLICATION_ID_NOT_MATCH,
        IPC_ACCESS_ERROR
    }

    public k(@NonNull ru.mail.libverify.storage.k kVar, @NonNull List<c> list, @NonNull String str, @NonNull b bVar, @NonNull a aVar, String str2, long j) {
        super(kVar);
        if (list.isEmpty()) {
            throw new IllegalArgumentException("statusData can't be empty");
        }
        this.b = new PushStatusData(list, str, str2, j, bVar, aVar);
    }

    public k(@NonNull ru.mail.libverify.storage.k kVar, @NonNull m mVar) {
        super(kVar);
        this.b = (PushStatusData) ru.mail.libverify.utils.json.a.a(mVar.a, PushStatusData.class);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ru.mail.libverify.requests.e
    public final e.a a() {
        e.a a2 = super.a();
        String str = "";
        for (c cVar : this.b.statusData) {
            if (!TextUtils.isEmpty(str)) {
                str = str + ",";
            }
            str = str + cVar.toString();
        }
        a2.put("status", str);
        if (!TextUtils.isEmpty(this.b.pushSessionId)) {
            a2.put("session_id", this.b.pushSessionId);
        }
        if (!TextUtils.isEmpty(this.b.pushApplicationId)) {
            a2.put("application_id_old", this.b.pushApplicationId);
        }
        ru.mail.libverify.utils.k i = this.a.i();
        if (i.a) {
            a2.put("device_screen_active", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        } else {
            a2.put("device_screen_active", AppEventsConstants.EVENT_PARAM_VALUE_NO);
            if (i.b != null) {
                a2.put("device_inactive_time", Long.toString((i.b == null ? 0L : i.b.longValue()) / 1000));
            }
        }
        if (this.b.deliveryMethod != null) {
            a2.put("delivery_method", this.b.deliveryMethod.toString());
        }
        if (this.b.confirmAction != null) {
            a2.put("confirm_action", this.b.confirmAction.toString());
        }
        a(a2);
        return a2;
    }

    @Override // ru.mail.libverify.requests.e
    protected final /* bridge */ /* synthetic */ PushStatusApiResponse a(String str) {
        return (PushStatusApiResponse) ru.mail.libverify.utils.json.a.a(str, PushStatusApiResponse.class);
    }

    @Override // ru.mail.libverify.requests.e
    protected final boolean b() {
        return true;
    }

    @Override // ru.mail.libverify.requests.e
    public final m c() {
        return new m(ru.mail.libverify.utils.json.a.a(this.b));
    }

    @Override // ru.mail.libverify.requests.e
    protected final String f() {
        return "pushstatus";
    }

    @Override // ru.mail.libverify.requests.e
    protected final l g() {
        return this.b;
    }
}
