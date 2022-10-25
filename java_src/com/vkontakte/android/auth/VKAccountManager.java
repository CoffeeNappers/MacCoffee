package com.vkontakte.android.auth;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vk.analytics.Analytics;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.execute.GetWallInfo;
import com.vkontakte.android.data.BenchmarkTracker;
import com.vkontakte.android.utils.L;
/* loaded from: classes.dex */
public class VKAccountManager {
    private static volatile Context appContext;
    private static volatile VKAccount current = null;

    public static void init(@NonNull Context ctx) {
        appContext = ctx;
    }

    public static boolean isCurrentUser(int uid) {
        return getCurrent().uid == uid;
    }

    @NonNull
    public static VKAccount getCurrent() {
        if (current == null) {
            synchronized (VKAccountManager.class) {
                if (current == null) {
                    current = loadAccountFromOld(appContext);
                    current = current == null ? new VKAccount() : current;
                }
            }
        }
        return current;
    }

    @NonNull
    public static VKAccountEditor editCurrent() {
        return new VKAccountEditor(getCurrent());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean updateCurrent(@NonNull VKAccount account) {
        if (getCurrent().getUid() == account.getUid()) {
            current = applyAccountToOld(appContext, account);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized boolean clearCurrent() {
        boolean z;
        synchronized (VKAccountManager.class) {
            if (getCurrent().isReal()) {
                VKAuthUtils.removeSystemAccountIfExist();
                current = applyAccountToOld(appContext, null);
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void storeNewAccount(@NonNull VKAccount account, GetWallInfo.Result result) {
        synchronized (VKAccountManager.class) {
            if (getCurrent().isReal()) {
                VKAccount vkAccount = getCurrent();
                L.d("logout", vkAccount);
                VKSession.cleanSession(vkAccount.accessToken, vkAccount.secret);
            }
            VKAuthUtils.updateAccount(account, result);
            current = applyAccountToOld(appContext, account);
            VKAuthUtils.removeSystemAccountIfExist();
            VKAuthUtils.addSystemAccount(account.name);
            VKSession.updateSession(result, true);
            BenchmarkTracker.getInstance().updateProfileConfig(account);
        }
    }

    public static boolean updateCurrentAccessData(String accessToken, String secret) {
        VKAccount account = getCurrent();
        if (!TextUtils.isEmpty(accessToken)) {
            VKAuthUtils.updateAccessToken(account, accessToken);
        }
        if (!TextUtils.isEmpty(secret)) {
            VKAuthUtils.updateSecret(account, secret);
        }
        return updateCurrent(account);
    }

    public static void updateCurrent(GetWallInfo.Result result) {
        VKAccount account = new VKAccount(getCurrent());
        String lastName = account.name;
        VKAuthUtils.updateAccount(account, result);
        boolean accountWasUpdated = updateCurrent(account);
        if (accountWasUpdated) {
            if (!TextUtils.equals(lastName, result.vkAccount.name)) {
                VKAuthUtils.removeSystemAccountIfExist();
                VKAuthUtils.addSystemAccount(account.name);
            }
            VKSession.updateSession(result, false);
        }
    }

    public static void fillAccountDataForAnalytics(@Nullable VKAccount account) {
        try {
            if (account == null) {
                Analytics.getInstance().setUserData(String.valueOf(0), "DELETED");
            } else {
                Analytics.getInstance().setUserData(String.valueOf(account.uid), account.getName());
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @Nullable
    private static VKAccount applyAccountToOld(@NonNull Context ctx, @Nullable VKAccount account) {
        fillAccountDataForAnalytics(account);
        SharedPreferences prefs = ctx.getApplicationContext().getSharedPreferences(null, 0);
        SharedPreferences generalPress = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        copyBooleanValue(prefs, generalPress, "gif_autoplay_available");
        if (account == null) {
            VKAuthUtils.clearAccountFromSharedPreferences(prefs);
        } else {
            VKAuthUtils.saveAccountToSharedPreferences(prefs, account);
        }
        return account;
    }

    private static void copyBooleanValue(SharedPreferences newPrefs, SharedPreferences oldPrefs, String key) {
        if (oldPrefs.contains(key)) {
            newPrefs.edit().putBoolean(key, oldPrefs.getBoolean(key, false)).apply();
        }
    }

    @Nullable
    private static VKAccount loadAccountFromOld(@NonNull Context ctx) {
        SharedPreferences prefs = ctx.getApplicationContext().getSharedPreferences(null, 0);
        SharedPreferences generalPress = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        copyBooleanValue(prefs, generalPress, "gif_autoplay_available");
        if (prefs.contains("sid")) {
            return VKAuthUtils.loadAccountFromSharedPreferences(prefs, new VKAccount());
        }
        return null;
    }
}
