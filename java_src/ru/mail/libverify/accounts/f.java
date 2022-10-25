package ru.mail.libverify.accounts;

import android.annotation.SuppressLint;
import android.content.Context;
import android.support.annotation.NonNull;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.util.Locale;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public final class f {
    private static int a(@NonNull TelephonyManager telephonyManager) {
        try {
            return Integer.parseInt(a(telephonyManager, "getSimState"));
        } catch (Throwable th) {
            return 0;
        }
    }

    private static String a(@NonNull TelephonyManager telephonyManager, @NonNull String str) {
        try {
            Object invoke = Class.forName(telephonyManager.getClass().getName()).getMethod(str, Integer.TYPE).invoke(telephonyManager, 1);
            if (invoke == null) {
                return null;
            }
            return invoke.toString();
        } catch (Throwable th) {
            return null;
        }
    }

    @SuppressLint({"HardwareIds"})
    public static d a(@NonNull Context context) {
        boolean z;
        boolean z2 = true;
        d dVar = new d();
        if (!m.b(context, "android.permission.READ_PHONE_STATE")) {
            ru.mail.libverify.utils.d.a("SimCardReader", "can't read sim data without %s", "android.permission.READ_PHONE_STATE");
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            dVar.a = "no_permission";
            return dVar;
        }
        ru.mail.libverify.utils.d.c("SimCardReader", "readData started");
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE);
            if (telephonyManager != null) {
                e eVar = new e();
                int simState = telephonyManager.getSimState();
                if (a(simState)) {
                    eVar.e = telephonyManager.getLine1Number();
                    eVar.c = telephonyManager.getDeviceId();
                    eVar.b = telephonyManager.getSimSerialNumber();
                    eVar.a = telephonyManager.getSubscriberId();
                    eVar.d = telephonyManager.getSimCountryIso();
                    if (!TextUtils.isEmpty(eVar.d)) {
                        eVar.d = eVar.d.toUpperCase(Locale.US);
                    }
                }
                eVar.f = b(simState);
                eVar.g = a(simState);
                if (eVar.g) {
                    eVar.j = telephonyManager.getSimOperator();
                    eVar.i = telephonyManager.getSimOperatorName();
                    eVar.l = telephonyManager.getNetworkOperator();
                    eVar.k = telephonyManager.getNetworkOperatorName();
                    eVar.m = telephonyManager.getNetworkCountryIso();
                    eVar.h = telephonyManager.isNetworkRoaming();
                }
                dVar.add(eVar);
                try {
                    int a = a(telephonyManager);
                    if (!(a == 0)) {
                        if (a != 1) {
                            z2 = false;
                        }
                        if (!z2) {
                            e eVar2 = new e();
                            if (a(a)) {
                                eVar2.e = a(telephonyManager, "getLine1NumberForSubscriber");
                                eVar2.c = a(telephonyManager, "getDeviceId");
                                eVar2.b = a(telephonyManager, "getSimSerialNumber");
                                eVar2.a = a(telephonyManager, "getSubscriberId");
                                eVar2.d = a(telephonyManager, "getSimCountryIso");
                                if (!TextUtils.isEmpty(eVar2.d)) {
                                    eVar2.d = eVar2.d.toUpperCase(Locale.US);
                                }
                            }
                            eVar2.f = b(a);
                            eVar2.g = a(a);
                            if (eVar2.g) {
                                try {
                                    eVar2.j = a(telephonyManager, "getSimOperator");
                                    eVar2.i = a(telephonyManager, "getSimOperatorNameForPhone");
                                    eVar2.l = a(telephonyManager, "getNetworkOperator");
                                    eVar2.k = a(telephonyManager, "getNetworkOperatorName");
                                    eVar2.m = a(telephonyManager, "getNetworkCountryIsoForPhone");
                                    eVar2.h = Boolean.parseBoolean(a(telephonyManager, "isNetworkRoaming"));
                                } catch (Exception e) {
                                    ru.mail.libverify.utils.d.a("SimCardReader", "failed to read sim operator");
                                }
                            }
                            dVar.add(eVar2);
                        }
                    }
                } catch (Exception e2) {
                    ru.mail.libverify.utils.d.a("SimCardReader", "readData about the second sim card failed", e2);
                }
            }
            ru.mail.libverify.utils.d.c("SimCardReader", "readData completed %s", dVar.toString());
        } catch (Exception e3) {
            ru.mail.libverify.utils.d.a("SimCardReader", "readData failed to read sim card data items", e3);
        }
        return dVar;
    }

    private static boolean a(int i) {
        return i == 5;
    }

    private static String b(int i) {
        switch (i) {
            case 0:
                return "unknown";
            case 1:
                return "absent";
            case 2:
                return "pin_required";
            case 3:
                return "puk_required";
            case 4:
                return "network_locked";
            case 5:
                return "ready";
            case 6:
                return "not_ready";
            case 7:
                return "perm_disabled";
            case 8:
                return "card_io_error";
            default:
                return null;
        }
    }
}
