package ru.mail.libverify.sms;

import android.net.Uri;
import android.provider.CallLog;
/* loaded from: classes3.dex */
public final class a {
    public static final Uri a = Uri.parse("content://sms");
    public static final Uri b = Uri.parse("content://sms/sent");
    public static final Uri c = Uri.parse("content://sms/inbox");
    public static final Uri d = CallLog.Calls.CONTENT_URI;
}
