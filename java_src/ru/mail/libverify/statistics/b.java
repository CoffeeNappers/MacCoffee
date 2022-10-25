package ru.mail.libverify.statistics;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import ru.mail.libverify.gcm.ServerNotificationMessage;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
/* loaded from: classes3.dex */
public final class b {
    public final List<c> a = new ArrayList();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class a {
        public final Map<String, String> a;

        private a() {
            this.a = new TreeMap();
        }

        public /* synthetic */ a(byte b) {
            this();
        }

        public final a a(@NonNull String str, @Nullable String str2) {
            if (str2 != null) {
                this.a.put(str, str2);
            }
            return this;
        }
    }

    public static String b(long j) {
        String str;
        if (j < 0) {
            return "-1";
        }
        int i = (int) (j / 1000);
        if (i <= 10) {
            str = "S";
        } else if (i <= 60) {
            str = "S";
            i = (i / 5) * 5;
        } else if (i <= 600) {
            str = "M";
            i /= 60;
        } else if (i <= 3600) {
            str = "M";
            i = ((i / 60) / 10) * 10;
        } else if (i <= 86400) {
            str = "H";
            i /= 3600;
        } else {
            str = "D";
            i /= 86400;
        }
        return str + i;
    }

    public final void a() {
        for (c cVar : this.a) {
            cVar.a(ru.mail.libverify.statistics.a.Instance_Reset);
        }
    }

    public final void a(long j) {
        for (c cVar : this.a) {
            cVar.a(ru.mail.libverify.statistics.a.PushNotification_StatusSubmitted, new a((byte) 0).a("SubmitTime", b(System.currentTimeMillis() - j)).a);
        }
    }

    public final void a(@Nullable Thread thread, @NonNull Throwable th) {
        for (c cVar : this.a) {
            cVar.a(thread, th);
        }
    }

    public final void a(@NonNull ServerNotificationMessage serverNotificationMessage) {
        if (serverNotificationMessage.message == null) {
            return;
        }
        for (c cVar : this.a) {
            cVar.a(ru.mail.libverify.statistics.a.PushNotification_ServerCompleted, new a((byte) 0).a("PushSender", serverNotificationMessage.sender).a("PushDelivery", serverNotificationMessage.deliveryMethod.toString()).a);
        }
    }

    public final void a(@NonNull ServerNotificationMessage serverNotificationMessage, @NonNull ServerNotificationMessage serverNotificationMessage2) {
        for (c cVar : this.a) {
            cVar.a(ru.mail.libverify.statistics.a.PushNotification_Duplication, new a((byte) 0).a("PushDelivery", String.format("%s_%s", serverNotificationMessage.deliveryMethod, serverNotificationMessage2.deliveryMethod)).a("PushTime", b(serverNotificationMessage2.timestamp - serverNotificationMessage.timestamp)).a);
        }
    }

    public final void a(@NonNull ClientApiResponseBase clientApiResponseBase) {
        if (clientApiResponseBase.getOwner() == null) {
            throw new IllegalArgumentException("Response must have non null owner");
        }
        for (c cVar : this.a) {
            cVar.a(ru.mail.libverify.statistics.a.API_Request_Failure, new a((byte) 0).a("Method", clientApiResponseBase.getOwner().l()).a("StatusCode", String.format("%s_%s", clientApiResponseBase.getStatus(), clientApiResponseBase.getDetailStatus())).a);
        }
    }
}
