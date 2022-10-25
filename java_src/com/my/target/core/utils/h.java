package com.my.target.core.utils;

import android.text.TextUtils;
import android.util.Base64;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.network.HttpRequest;
import io.sentry.event.interfaces.ExceptionInterface;
import io.sentry.event.interfaces.HttpInterface;
import io.sentry.event.interfaces.StackTraceInterface;
import io.sentry.marshaller.json.JsonMarshaller;
import java.security.SignatureException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;
import java.util.zip.CRC32;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: LoggerUtils.java */
/* loaded from: classes2.dex */
public final class h {
    private static String a;
    private static final TimeZone b = TimeZone.getTimeZone("UTC");
    private static final DateFormat c;
    private static JSONObject d;

    static {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.ENGLISH);
        c = simpleDateFormat;
        simpleDateFormat.setTimeZone(b);
    }

    public static void a(Map<String, String> map) {
        if (map != null) {
            try {
                d = new JSONObject();
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    d.put(entry.getKey(), entry.getValue());
                }
                d.put("adman_ver", "4.6.4");
                return;
            } catch (JSONException e) {
            }
        }
        d = null;
    }

    public static boolean a() {
        return d != null;
    }

    public static String a(String str, String str2, String str3, int i, String str4, Throwable th, String str5, String str6, g gVar) {
        return Base64.encodeToString(b(str, str2, str3, i, str4, th, str5, str6, gVar).getBytes(), 0);
    }

    private static String b(String str, String str2, String str3, int i, String str4, Throwable th, String str5, String str6, g gVar) {
        JSONObject jSONObject = new JSONObject();
        String replaceAll = UUID.randomUUID().toString().replaceAll("-", "");
        try {
            jSONObject.put(JsonMarshaller.EVENT_ID, replaceAll);
            byte[] bytes = str.getBytes();
            CRC32 crc32 = new CRC32();
            crc32.update(bytes, 0, bytes.length);
            jSONObject.put(JsonMarshaller.CHECKSUM, String.valueOf(crc32.getValue()));
            if (th == null) {
                jSONObject.put(JsonMarshaller.CULPRIT, str4);
            } else {
                jSONObject.put(JsonMarshaller.CULPRIT, a(th));
                jSONObject.put(ExceptionInterface.EXCEPTION_INTERFACE, b(th));
                jSONObject.put(StackTraceInterface.STACKTRACE_INTERFACE, c(th));
            }
            jSONObject.put(JsonMarshaller.TIMESTAMP, str2);
            jSONObject.put("message", str);
            jSONObject.put("project", gVar.f());
            jSONObject.put("level", i);
            jSONObject.put(JsonMarshaller.LOGGER, str3);
            jSONObject.put(JsonMarshaller.SERVER_NAME, "localhost");
            if (str6 != null) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("url", str6);
                jSONObject2.put("method", HttpRequest.METHOD_GET);
                jSONObject.put(HttpInterface.HTTP_INTERFACE, jSONObject2);
            }
            if (d != null) {
                if (d.has("response_body")) {
                    d.remove("response_body");
                }
                if (!TextUtils.isEmpty(str5)) {
                    d.put("response_body", str5);
                }
                jSONObject.put(JsonMarshaller.EXTRA, d);
            }
        } catch (JSONException e) {
        }
        a = replaceAll;
        return jSONObject.toString();
    }

    private static String a(Throwable th) {
        String str = null;
        while (th != null) {
            StackTraceElement[] stackTrace = th.getStackTrace();
            if (stackTrace.length > 0) {
                StackTraceElement stackTraceElement = stackTrace[0];
                str = stackTraceElement.getClassName() + "." + stackTraceElement.getMethodName();
            }
            th = th.getCause();
        }
        return str;
    }

    private static JSONObject b(Throwable th) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(ServerKeys.TYPE, th.getClass().getSimpleName());
            jSONObject.put("value", th.getMessage());
            jSONObject.put("module", th.getClass().getPackage().getName());
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    private static JSONObject c(Throwable th) {
        JSONArray jSONArray = new JSONArray();
        while (th != null) {
            StackTraceElement[] stackTrace = th.getStackTrace();
            for (int i = 0; i < stackTrace.length; i++) {
                if (i == 0) {
                    try {
                        JSONObject jSONObject = new JSONObject();
                        String str = "Caused by: " + th.getClass().getName();
                        if (th.getMessage() != null) {
                            str = str + " (\"" + th.getMessage() + "\")";
                        }
                        jSONObject.put("filename", str);
                        jSONObject.put("lineno", -1);
                        jSONArray.put(jSONObject);
                    } catch (JSONException e) {
                    }
                }
                StackTraceElement stackTraceElement = stackTrace[i];
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("filename", stackTraceElement.getClassName());
                jSONObject2.put("function", stackTraceElement.getMethodName());
                jSONObject2.put("lineno", stackTraceElement.getLineNumber());
                jSONArray.put(jSONObject2);
            }
            th = th.getCause();
        }
        JSONObject jSONObject3 = new JSONObject();
        try {
            jSONObject3.put("frames", jSONArray);
        } catch (JSONException e2) {
        }
        return jSONObject3;
    }

    public static String a(String str, long j, String str2) {
        return "Sentry sentry_version=2.0,sentry_signature=" + str + ",sentry_timestamp=" + j + ",sentry_key=" + str2 + ",sentry_client=Raven-myTarget";
    }

    private static String a(String str, String str2) throws SignatureException {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(str2.getBytes(), "HmacSHA1");
            Mac mac = Mac.getInstance("HmacSHA1");
            mac.init(secretKeySpec);
            return a(mac.doFinal(str.getBytes()));
        } catch (Exception e) {
            throw new SignatureException("Failed to generate HMAC : " + e.getMessage());
        }
    }

    public static String a(long j) {
        return c.format(new Date(j));
    }

    public static String b(String str, long j, String str2) {
        try {
            return a(j + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + str, str2);
        } catch (SignatureException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static String a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        for (byte b2 : bArr) {
            sb.append(cArr[(b2 & 240) >> 4]);
            sb.append(cArr[b2 & 15]);
        }
        return sb.toString();
    }
}
