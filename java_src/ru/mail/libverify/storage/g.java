package ru.mail.libverify.storage;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.support.annotation.NonNull;
import android.telephony.CellInfo;
import android.telephony.CellInfoCdma;
import android.telephony.CellInfoGsm;
import android.telephony.CellInfoLte;
import android.telephony.CellInfoWcdma;
import android.telephony.CellSignalStrength;
import android.telephony.TelephonyManager;
import com.facebook.internal.AnalyticsEvents;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.json.JSONObject;
/* loaded from: classes3.dex */
final class g {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static String a(@NonNull k kVar) {
        System.currentTimeMillis();
        try {
            JSONObject jSONObject = new JSONObject();
            Integer f = ru.mail.libverify.utils.m.f(kVar.d());
            if (f != null) {
                jSONObject.put("batteryLevel", f);
            }
            jSONObject.put("defaultLocale", ru.mail.libverify.utils.m.a(Locale.getDefault()));
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("manufacturer", Build.MANUFACTURER);
            jSONObject2.put("model", Build.MODEL);
            jSONObject.put("device", jSONObject2);
            jSONObject.put("deviceId", ru.mail.libverify.utils.m.a(kVar.h()));
            JSONObject jSONObject3 = new JSONObject();
            Boolean d = ru.mail.libverify.utils.m.d(kVar.d());
            if (d != null) {
                jSONObject3.put("isVoiceCapable", d);
            }
            Boolean e = ru.mail.libverify.utils.m.e(kVar.d());
            if (e != null) {
                jSONObject3.put("roaming", e);
            }
            jSONObject3.put("cellular", b(kVar.d()));
            jSONObject3.put("data", a(kVar.d()));
            jSONObject.put("networkInfo", jSONObject3);
            jSONObject.put("os", Build.VERSION.RELEASE);
            JSONObject jSONObject4 = new JSONObject();
            jSONObject4.put("ACCESS_NETWORK_STATE", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.ACCESS_NETWORK_STATE"));
            jSONObject4.put("CALL_PHONE", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.CALL_PHONE"));
            if (Build.VERSION.SDK_INT >= 16) {
                jSONObject4.put("READ_CALL_LOG", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.READ_CALL_LOG"));
            }
            jSONObject4.put("READ_PHONE_STATE", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.READ_PHONE_STATE"));
            jSONObject4.put("READ_SMS", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.READ_SMS"));
            jSONObject4.put("RECEIVE_SMS", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.RECEIVE_SMS"));
            jSONObject4.put("getCellularSignalLevel", ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.ACCESS_COARSE_LOCATION") || ru.mail.libverify.utils.m.b(kVar.d(), "android.permission.ACCESS_FINE_LOCATION"));
            jSONObject.put(NativeProtocol.RESULT_ARGS_PERMISSIONS, jSONObject4);
            ru.mail.libverify.accounts.d p = kVar.p();
            jSONObject.put("simCardsCount", p.size());
            jSONObject.put("simCardsInfo", a(kVar.d(), p));
            jSONObject.put(JsonMarshaller.PLATFORM, "Android");
            return jSONObject.toString();
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("ExtendedPhoneInfo", "failed to build extended info", th);
            return null;
        }
    }

    private static JSONObject a(@NonNull Context context) {
        String str;
        JSONObject jSONObject = new JSONObject();
        try {
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("ExtendedPhoneInfo", "failed to get data info", th);
        }
        if (!ru.mail.libverify.utils.m.b(context, "android.permission.ACCESS_NETWORK_STATE")) {
            return jSONObject;
        }
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            NetworkInfo[] allNetworkInfo = connectivityManager.getAllNetworkInfo();
            int length = allNetworkInfo.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    str = "Not connected";
                    break;
                }
                NetworkInfo networkInfo = allNetworkInfo[i];
                if (networkInfo.isConnected()) {
                    str = networkInfo.getTypeName();
                    break;
                }
                i++;
            }
        } else {
            str = activeNetworkInfo.getTypeName();
        }
        jSONObject.put(ServerKeys.TYPE, str);
        return jSONObject;
    }

    private static JSONObject a(@NonNull Context context, @NonNull ru.mail.libverify.accounts.d dVar) {
        JSONObject jSONObject = new JSONObject();
        try {
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("ExtendedPhoneInfo", "failed to get sim card info", th);
        }
        if (!ru.mail.libverify.utils.m.b(context, "android.permission.READ_PHONE_STATE")) {
            return jSONObject;
        }
        int i = 1;
        Iterator<ru.mail.libverify.accounts.e> it = dVar.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                break;
            }
            ru.mail.libverify.accounts.e next = it.next();
            JSONObject jSONObject2 = new JSONObject();
            JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put("countryId", next.m);
            jSONObject3.put("mcc", ru.mail.libverify.accounts.e.a(next.l));
            jSONObject3.put("mnc", ru.mail.libverify.accounts.e.b(next.l));
            jSONObject3.put("name", next.k);
            jSONObject3.put("roaming", next.h);
            JSONObject jSONObject4 = new JSONObject();
            jSONObject4.put("countryId", next.d);
            jSONObject4.put("mcc", ru.mail.libverify.accounts.e.a(next.j));
            jSONObject4.put("mnc", ru.mail.libverify.accounts.e.b(next.j));
            jSONObject4.put("name", next.i);
            jSONObject2.put("operator", jSONObject3);
            jSONObject2.put("sim", jSONObject4);
            jSONObject.put(Integer.toString(i2), jSONObject2);
            i = i2 + 1;
        }
        return jSONObject;
    }

    private static JSONObject b(@NonNull Context context) {
        List<CellInfo> allCellInfo;
        int i;
        String str;
        CellSignalStrength cellSignalStrength;
        JSONObject jSONObject = new JSONObject();
        try {
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("ExtendedPhoneInfo", "failed to get cell info", th);
        }
        if (ru.mail.libverify.utils.m.b(context, "android.permission.ACCESS_COARSE_LOCATION") || ru.mail.libverify.utils.m.b(context, "android.permission.ACCESS_FINE_LOCATION")) {
            if (Build.VERSION.SDK_INT >= 17 && (allCellInfo = ((TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE)).getAllCellInfo()) != null) {
                int i2 = 1;
                for (CellInfo cellInfo : allCellInfo) {
                    if (cellInfo.isRegistered()) {
                        JSONObject jSONObject2 = new JSONObject();
                        if (cellInfo instanceof CellInfoGsm) {
                            cellSignalStrength = ((CellInfoGsm) cellInfo).getCellSignalStrength();
                            str = "Gsm";
                        } else if (cellInfo instanceof CellInfoCdma) {
                            cellSignalStrength = ((CellInfoCdma) cellInfo).getCellSignalStrength();
                            str = "Cdma";
                        } else if (cellInfo instanceof CellInfoLte) {
                            cellSignalStrength = ((CellInfoLte) cellInfo).getCellSignalStrength();
                            str = "Lte";
                        } else if (cellInfo instanceof CellInfoWcdma) {
                            cellSignalStrength = Build.VERSION.SDK_INT >= 18 ? ((CellInfoWcdma) cellInfo).getCellSignalStrength() : null;
                            str = "Wcdma";
                        } else {
                            str = AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
                            cellSignalStrength = null;
                        }
                        jSONObject2.put(ServerKeys.TYPE, str);
                        jSONObject2.put("signalLevel", cellSignalStrength == null ? -1 : cellSignalStrength.getLevel());
                        jSONObject.put(Integer.toString(i2), jSONObject2);
                        i = i2 + 1;
                    } else {
                        i = i2;
                    }
                    i2 = i;
                }
            }
            return jSONObject;
        }
        return jSONObject;
    }
}
