package com.vkontakte.android.audio.net;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
/* loaded from: classes2.dex */
public final class HttpUtils {
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);

    static {
        DATE_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT"));
    }

    private HttpUtils() {
    }

    public static Date parseDate(String date) throws ParseException {
        Date parse;
        synchronized (DATE_FORMAT) {
            parse = DATE_FORMAT.parse(date);
        }
        return parse;
    }
}
