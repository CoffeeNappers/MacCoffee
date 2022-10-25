package com.vkontakte.android.data.database;

import android.telephony.TelephonyManager;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Locale;
/* loaded from: classes2.dex */
public class Country {
    public String code;
    public int id;
    public boolean important;
    public String name;
    public String phoneCode;

    public static ArrayList<Country> getCountries(boolean unique, boolean includeNone, String noneTitle) {
        ArrayList<Country> result = new ArrayList<>();
        try {
            int userCountry = VKAccountManager.getCurrent().getCountry();
            String userCountryCode = null;
            if (userCountry == 0) {
                TelephonyManager tm = (TelephonyManager) VKApplication.context.getSystemService(SignupPhoneFragment.KEY_PHONE);
                String simCountry = tm.getSimCountryIso().toUpperCase();
                if (simCountry.length() == 2) {
                    userCountryCode = simCountry;
                } else {
                    userCountryCode = Locale.getDefault().getCountry();
                }
            }
            int userCountryPos = includeNone ? 1 : 0;
            if (includeNone) {
                Country none = new Country();
                none.id = 0;
                if (noneTitle == null) {
                    noneTitle = VKApplication.context.getResources().getString(R.string.not_specified);
                }
                none.name = noneTitle;
                result.add(none);
            }
            InputStream in = VKApplication.context.getAssets().open("countries_" + Global.getDeviceLang() + ".txt");
            byte[] file = new byte[in.available()];
            in.read(file);
            in.close();
            String[] lines = new String(file, "UTF-8").split("\n");
            HashSet<String> codes = new HashSet<>();
            for (String line : lines) {
                String[] info = line.split(",", 4);
                Country c = new Country();
                c.id = Integer.parseInt(info[1]);
                c.code = info[2];
                c.name = info[3];
                c.phoneCode = info[0];
                if (!unique || codes.add(c.code)) {
                    if (c.id == userCountry || (userCountryCode != null && c.code.equals(userCountryCode))) {
                        c.important = true;
                        result.add(userCountryPos, c);
                    } else {
                        result.add(c);
                    }
                }
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
        return result;
    }

    public String toString() {
        return this.name;
    }
}
