package com.vkontakte.android.fragments;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.support.v7.preference.ListPreference;
import android.support.v7.preference.Preference;
import android.webkit.WebView;
import android.widget.DatePicker;
import android.widget.Toast;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import com.google.android.gms.gcm.Task;
import com.vk.webapp.VKUIWebContainerFragment;
import com.vkontakte.android.BirthdayBroadcastReceiver;
import com.vkontakte.android.C2DM;
import com.vkontakte.android.Global;
import com.vkontakte.android.GoogleNow;
import com.vkontakte.android.Log;
import com.vkontakte.android.Message;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.player.PlayerService;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.AddMessageAction;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.ServerKeys;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class SettingsDebugFragment extends MaterialPreferenceToolbarFragment {
    public static boolean isDemoMode(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean("demo_mode", false);
    }

    @Override // com.vkontakte.android.fragments.MaterialPreferenceFragment, com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        Preference.OnPreferenceClickListener onPreferenceClickListener;
        Preference.OnPreferenceClickListener onPreferenceClickListener2;
        Preference.OnPreferenceClickListener onPreferenceClickListener3;
        Preference.OnPreferenceClickListener onPreferenceClickListener4;
        Preference.OnPreferenceClickListener onPreferenceClickListener5;
        boolean z = true;
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences_debug);
        Preference pref = findPreference("terminate");
        onPreferenceClickListener = SettingsDebugFragment$$Lambda$1.instance;
        pref.setOnPreferenceClickListener(onPreferenceClickListener);
        Preference pref2 = findPreference("logToFile");
        if (Log.logFile != null) {
            pref2.setEnabled(false);
            pref2.setSummary("Уже включено");
        } else {
            pref2.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$2.lambdaFactory$(this));
        }
        Preference pref3 = findPreference("bdayTest");
        pref3.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$3.lambdaFactory$(this));
        Preference pref4 = findPreference("validationTest");
        pref4.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$4.lambdaFactory$(this));
        Preference pref5 = findPreference("captchaTest");
        pref5.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$5.lambdaFactory$(this));
        Preference pref6 = findPreference("copyDatabases");
        pref6.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$6.lambdaFactory$(this));
        Preference pref7 = findPreference("testCrash");
        onPreferenceClickListener2 = SettingsDebugFragment$$Lambda$7.instance;
        pref7.setOnPreferenceClickListener(onPreferenceClickListener2);
        Preference pref8 = findPreference("testVKUI");
        pref8.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$8.lambdaFactory$(this));
        Preference pref9 = findPreference("downloadMessages");
        pref9.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$9.lambdaFactory$(this));
        Preference pref10 = findPreference("clearTrustedHash");
        onPreferenceClickListener3 = SettingsDebugFragment$$Lambda$10.instance;
        pref10.setOnPreferenceClickListener(onPreferenceClickListener3);
        Preference pref11 = findPreference("clearWebViewCache");
        pref11.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$11.lambdaFactory$(this));
        Preference pref12 = findPreference("copyGcmToken");
        onPreferenceClickListener4 = SettingsDebugFragment$$Lambda$12.instance;
        pref12.setOnPreferenceClickListener(onPreferenceClickListener4);
        Preference pref13 = findPreference("reRegisterGCM");
        pref13.setOnPreferenceClickListener(SettingsDebugFragment$$Lambda$13.lambdaFactory$(this));
        Preference pref14 = findPreference("reRegisterGoogleNow");
        onPreferenceClickListener5 = SettingsDebugFragment$$Lambda$14.instance;
        pref14.setOnPreferenceClickListener(onPreferenceClickListener5);
        Preference pref15 = findPreference("__dbg_player_type_view");
        if (pref15 != null) {
            String playerType = PlayerService.getPlayerType(pref15.getContext());
            ((ListPreference) pref15).setValue(playerType);
            pref15.setSummary(playerType);
            pref15.setOnPreferenceChangeListener(SettingsDebugFragment$$Lambda$15.lambdaFactory$(this));
        }
        if (!getActivity().getSharedPreferences(null, 0).getBoolean("sinv", false) && !VKAccountManager.getCurrent().debugAvailable) {
            setPreferenceVisibility("others", false);
            setPreferenceVisibility("__dbg_no_ads", false);
            setPreferenceVisibility("__dbg_demo_ads", false);
            setPreferenceVisibility("__dbg_no_slider_ads", false);
            setPreferenceVisibility("__dbg_proxy_enable", false);
            setPreferenceVisibility("__dbg_demo_pretty_cards", false);
        } else {
            Preference pref16 = findPreference("__dbg_no_ads");
            if (pref16 != null) {
                boolean isNoAds = PreferenceManager.getDefaultSharedPreferences(pref16.getContext()).getBoolean("__dbg_no_ads", false);
                setPreferenceEnabled("__dbg_demo_ads", !isNoAds);
                setPreferenceEnabled("__dbg_demo_pretty_cards", !isNoAds);
                if (isNoAds) {
                    z = false;
                }
                setPreferenceEnabled("__dbg_no_slider_ads", z);
                pref16.setOnPreferenceChangeListener(SettingsDebugFragment$$Lambda$16.lambdaFactory$(this));
            }
            Preference pref17 = findPreference("__dbg_proxy_enable");
            if (pref17 != null) {
                pref17.setOnPreferenceChangeListener(SettingsDebugFragment$$Lambda$17.lambdaFactory$(this));
            }
        }
        if (!VKAccountManager.getCurrent().debugAvailable) {
            setPreferenceVisibility("tests", false);
            setPreferenceVisibility("bdayTest", false);
            setPreferenceVisibility("validationTest", false);
            setPreferenceVisibility("captchaTest", false);
            setPreferenceVisibility("testCrash", false);
            setPreferenceVisibility("testVKUI", false);
            setPreferenceVisibility("testSPAUri", false);
            setPreferenceVisibility("__dbg_lang_override", false);
            setPreferenceVisibility("demo_mode", false);
            setPreferenceVisibility("__dbg_demo_ads", false);
            setPreferenceVisibility("__dbg_demo_pretty_cards", false);
        }
    }

    public /* synthetic */ boolean lambda$onCreate$1(Preference pref1) {
        Log.captureStart();
        Toast.makeText(getActivity(), String.format("Отладочная информация записывается в файл \"%s\"", Log.logFile.getAbsolutePath()), 1).show();
        pref1.setEnabled(false);
        pref1.setSummary("Уже включено");
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$3(Preference preference) {
        Date date = new Date();
        DatePickerDialog dpd = new DatePickerDialog(getActivity(), SettingsDebugFragment$$Lambda$20.lambdaFactory$(this), date.getYear() + 1900, date.getMonth(), date.getDate());
        dpd.show();
        return true;
    }

    public /* synthetic */ void lambda$null$2(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
        Date date1 = new Date(0L);
        date1.setDate(dayOfMonth);
        date1.setMonth(monthOfYear);
        date1.setYear(year - 1900);
        Intent intent = new Intent(getActivity(), BirthdayBroadcastReceiver.class);
        intent.putExtra("force", true);
        intent.putExtra(ServerKeys.DATE, date1.getTime());
        getActivity().sendBroadcast(intent);
    }

    public /* synthetic */ boolean lambda$onCreate$4(Preference preference) {
        new VKAPIRequest("account.testValidation").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.fragments.SettingsDebugFragment.1
            {
                SettingsDebugFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject j) {
                Toast.makeText(VKApplication.context, j.toString(), 1).show();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                Toast.makeText(VKApplication.context, error.toString(), 1).show();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$5(Preference preference) {
        new VKAPIRequest("captcha.force").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.fragments.SettingsDebugFragment.2
            {
                SettingsDebugFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject j) {
                Toast.makeText(VKApplication.context, j.toString(), 1).show();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                Toast.makeText(VKApplication.context, error.toString(), 1).show();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$6(Preference preference) {
        copyDatabases(getActivity());
        return true;
    }

    public static /* synthetic */ boolean lambda$onCreate$7(Preference preference) {
        throw new RuntimeException("Test crash");
    }

    public /* synthetic */ boolean lambda$onCreate$8(Preference preference) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        String testSPAUri = "https://" + prefs.getString("testSPAUri", "static.vk.com/demo");
        new VKUIWebContainerFragment.Builder(testSPAUri).go(getActivity());
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$9(Preference preference) {
        downloadMessages(preference.getContext());
        return true;
    }

    public static /* synthetic */ boolean lambda$onCreate$10(Preference preference) {
        Context ctx = preference.getContext();
        ctx.getSharedPreferences("2fa", 0).edit().clear().apply();
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$11(Preference preference) {
        new WebView(getActivity()).clearCache(true);
        return true;
    }

    public static /* synthetic */ boolean lambda$onCreate$12(Preference preference) {
        Context ctx = preference.getContext();
        String token = ctx.getSharedPreferences(GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE, 0).getString("reg", null);
        ((ClipboardManager) ctx.getSystemService("clipboard")).setText(token);
        Toast.makeText(ctx, "Okay!", 0).show();
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$14(Preference preference) {
        Context ctx = preference.getContext();
        boolean res = C2DM.stop();
        Toast.makeText(ctx, res ? "Регистрация GCM отменена" : "GCM и так не зарегистрирован", 0).show();
        ctx.getSharedPreferences(GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE, 0).edit().clear().apply();
        getListView().postDelayed(SettingsDebugFragment$$Lambda$19.lambdaFactory$(ctx), 1000L);
        return true;
    }

    public static /* synthetic */ void lambda$null$13(Context ctx) {
        C2DM.checkForUpdate();
        Toast.makeText(ctx, "Регистрация GCM обновлена.", 0).show();
    }

    public static /* synthetic */ boolean lambda$onCreate$15(Preference preference) {
        Toast.makeText(preference.getContext(), "Google Now registration is being updated asynchronously, see logcat for progress (enable API logging for added verbosity)", 1).show();
        GoogleNow.updateTokenAsync();
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$16(Preference preference, Object newValue) {
        AudioFacade.stop();
        PreferenceManager.getDefaultSharedPreferences(getActivity()).edit().putString("__dbg_player_type", (String) newValue).apply();
        PreferenceManager.getDefaultSharedPreferences(getActivity()).edit().remove("__dbg_exo_player").apply();
        preference.setSummary((String) newValue);
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$17(Preference preference, Object newValue) {
        boolean z = false;
        setPreferenceEnabled("__dbg_demo_ads", !((Boolean) newValue).booleanValue());
        setPreferenceEnabled("__dbg_demo_pretty_cards", !((Boolean) newValue).booleanValue());
        if (!((Boolean) newValue).booleanValue()) {
            z = true;
        }
        setPreferenceEnabled("__dbg_no_slider_ads", z);
        return true;
    }

    public /* synthetic */ boolean lambda$onCreate$18(Preference preference, Object newValue) {
        setPreferenceEnabled("__dbg_proxy_enable", !((Boolean) newValue).booleanValue());
        return true;
    }

    void setPreferenceVisibility(String key, boolean visibility) {
        Preference preference = findPreference(key);
        if (preference != null) {
            preference.setVisible(visibility);
        }
    }

    void setPreferenceEnabled(String key, boolean enable) {
        Preference preference = findPreference(key);
        if (preference != null) {
            preference.setEnabled(enable);
        }
    }

    private void copyDatabases(Context context) {
        String report = "";
        try {
            File dbDir = new File(context.getDatabasePath("qwe").getParent());
            File outDir = new File(Environment.getExternalStorageDirectory(), ".vkontakte/cache_debug");
            if (!outDir.exists()) {
                outDir.mkdirs();
            }
            File[] list = dbDir.listFiles();
            for (File f : list) {
                if (f.getName().endsWith(".db")) {
                    File outFile = new File(outDir, f.getName());
                    outFile.createNewFile();
                    FileOutputStream out = new FileOutputStream(outFile);
                    FileInputStream in = new FileInputStream(f);
                    int count = 0;
                    byte[] buf = new byte[Task.EXTRAS_LIMIT_BYTES];
                    while (true) {
                        int read = in.read(buf);
                        if (read <= 0) {
                            break;
                        }
                        count += read;
                        out.write(buf, 0, read);
                    }
                    out.close();
                    in.close();
                    report = report + f.getAbsolutePath() + " -> " + outFile.getAbsolutePath() + " [" + Global.langFileSize(count, getResources()) + "]\n";
                }
            }
        } catch (Exception x) {
            report = report + x.getLocalizedMessage();
        }
        new AlertDialog.Builder(context).setMessage(report).setPositiveButton("ok", (DialogInterface.OnClickListener) null).show();
    }

    private void downloadMessages(Context activity) {
        ProgressDialog dlg = new ProgressDialog(activity);
        dlg.setIndeterminate(false);
        dlg.setProgressStyle(1);
        dlg.setProgress(0);
        dlg.setMessage("Скачиваем историю сообщений...");
        dlg.show();
        new Thread(SettingsDebugFragment$$Lambda$18.lambdaFactory$(this, activity, dlg)).start();
    }

    public /* synthetic */ void lambda$downloadMessages$19(Context activity, ProgressDialog dlg) {
        for (int out = 0; out < 2; out++) {
            boolean[] ended = {false};
            int[] offset = {0};
            int[] total = {0};
            while (!ended[0]) {
                new VKAPIRequest("messages.get").param("offset", offset[0]).param(ServerKeys.COUNT, 200).param(ServerKeys.PHOTO_SIZES, 1).param("out", out).setCallback(new AnonymousClass3(total, ended, offset, activity, dlg)).execSync();
            }
        }
        ViewUtils.dismissDialogSafety(dlg);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.SettingsDebugFragment$3 */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 implements Callback<JSONObject> {
        final /* synthetic */ Context val$activity;
        final /* synthetic */ ProgressDialog val$dlg;
        final /* synthetic */ boolean[] val$ended;
        final /* synthetic */ int[] val$offset;
        final /* synthetic */ int[] val$total;

        AnonymousClass3(int[] iArr, boolean[] zArr, int[] iArr2, Context context, ProgressDialog progressDialog) {
            SettingsDebugFragment.this = this$0;
            this.val$total = iArr;
            this.val$ended = zArr;
            this.val$offset = iArr2;
            this.val$activity = context;
            this.val$dlg = progressDialog;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(JSONObject o) {
            try {
                JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
                this.val$total[0] = o2.getInt(ServerKeys.COUNT);
                JSONArray a = o2.getJSONArray(ServerKeys.ITEMS);
                this.val$ended[0] = a.length() == 0;
                int[] iArr = this.val$offset;
                iArr[0] = iArr[0] + a.length();
                ArrayList acts = new ArrayList();
                for (int i = 0; i < a.length(); i++) {
                    Message msg = new Message(a.getJSONObject(i));
                    acts.add(new AddMessageAction(msg));
                }
                Cache.applyMessagesActions(acts);
                ViewUtils.runOnUiThread(this.val$activity, SettingsDebugFragment$3$$Lambda$1.lambdaFactory$(this.val$dlg, this.val$total, this.val$offset));
            } catch (Exception x) {
                Log.w("vk", x);
                this.val$ended[0] = true;
            }
        }

        public static /* synthetic */ void lambda$success$0(ProgressDialog dlg, int[] total, int[] offset) {
            dlg.setMax(total[0]);
            dlg.setProgress(offset[0]);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            Log.w("vk", "error " + error);
            try {
                Thread.sleep(200L);
            } catch (Exception e) {
            }
        }
    }
}
