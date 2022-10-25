package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.preference.Preference;
import android.support.v7.preference.PreferenceCategory;
import android.support.v7.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.internal.AnalyticsEvents;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.account.AccountSetPushSettings;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.userlist.PostSubscriptionsUserListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.RingtonePreference;
/* loaded from: classes2.dex */
public class SettingsNotificationsFragment extends MaterialPreferenceToolbarFragment {
    private Preference cancelDndPref;
    private Preference dnd1Pref;
    private String initialSettings;
    private RingtonePreference prefSound = null;
    private SharedPreferences prefs;

    @Override // com.vkontakte.android.fragments.MaterialPreferenceFragment, com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.initialSettings = NotificationUtils.getNotificationSettings(getActivity());
        addPreferencesFromResource(R.xml.preferences_notifications);
        this.prefs = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        Preference pref = findPreference("notifyRingtone");
        if (pref != null) {
            pref.setOnPreferenceChangeListener(SettingsNotificationsFragment$$Lambda$1.lambdaFactory$(this));
            this.prefSound = (RingtonePreference) pref;
            pref.setOnPreferenceClickListener(SettingsNotificationsFragment$$Lambda$2.lambdaFactory$(this));
        }
        this.cancelDndPref = findPreference("dnd_cancel");
        Preference pref2 = findPreference("dnd_hour");
        this.dnd1Pref = pref2;
        pref2.setOnPreferenceClickListener(SettingsNotificationsFragment$$Lambda$3.lambdaFactory$(this));
        if (Build.VERSION.SDK_INT < 21) {
            Preference pref3 = findPreference("notifyHeadsUp");
            PreferenceCategory cat = (PreferenceCategory) findPreference("cat_notify");
            cat.removePreference(pref3);
        }
        findPreference("notifyPrivMessages").setOnPreferenceClickListener(SettingsNotificationsFragment$$Lambda$4.lambdaFactory$(this));
        findPreference("notifyChatMessages").setOnPreferenceClickListener(SettingsNotificationsFragment$$Lambda$5.lambdaFactory$(this));
        findPreference("postSubscriptions").setOnPreferenceClickListener(SettingsNotificationsFragment$$Lambda$6.lambdaFactory$(this));
        this.cancelDndPref.setOnPreferenceClickListener(SettingsNotificationsFragment$$Lambda$7.lambdaFactory$(this));
        long t = this.prefs.getLong("dnd_end", 0L) - (TimeUtils.getOffset() * 1000);
        if (t > System.currentTimeMillis()) {
            this.cancelDndPref.setSummary(getResources().getString(R.string.sett_dnd_desc, TimeUtils.langDate((int) (t / 1000))));
            ((PreferenceCategory) findPreference("cat_notify")).removePreference(this.dnd1Pref);
        } else {
            ((PreferenceCategory) findPreference("cat_notify")).removePreference(this.cancelDndPref);
        }
        updateRingtoneName(null);
        updateExtendedSubtitles();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$0(Preference preference, Object newValue) {
        updateRingtoneName((String) newValue);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$1(Preference preference) {
        this.prefSound.startSelectRingtone(this);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$2(Preference preference) {
        showDndDialog();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$3(Preference preference) {
        Bundle args = new Bundle();
        args.putString(ServerKeys.TYPE, "PrivateMessages");
        args.putString("title", ((Object) preference.getTitle()) + "");
        Navigate.to(NotificationsAdvancedSettingsFragment.class, args, getActivity());
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$4(Preference preference) {
        Bundle args = new Bundle();
        args.putString(ServerKeys.TYPE, "ChatMessages");
        args.putString("title", ((Object) preference.getTitle()) + "");
        Navigate.to(NotificationsAdvancedSettingsFragment.class, args, getActivity());
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$5(Preference preference) {
        Bundle args = new Bundle();
        Navigate.to(PostSubscriptionsUserListFragment.class, args, getActivity());
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$6(Preference preference) {
        this.prefs.edit().putLong("dnd_end", 0L).commit();
        PreferenceCategory cat = (PreferenceCategory) findPreference("cat_notify");
        cat.removePreference(this.cancelDndPref);
        cat.addPreference(this.dnd1Pref);
        return true;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.prefSound == null || !this.prefSound.onActivityResult(requestCode, resultCode, data)) {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    private void updateExtendedSubtitles() {
        SharedPreferences p = PreferenceManager.getDefaultSharedPreferences(getActivity());
        findPreference("notifyPrivMessages").setSummary(p.getBoolean("notificationsPrivateMessages", true) ? "" : getString(R.string.disabled));
        findPreference("notifyChatMessages").setSummary(p.getBoolean("notificationsChatMessages", true) ? "" : getString(R.string.disabled));
    }

    private void showDndDialog() {
        new VKAlertDialog.Builder(getActivity()).setItems(R.array.sett_dnd_options, SettingsNotificationsFragment$$Lambda$8.lambdaFactory$(this)).setTitle(R.string.chat_dnd).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showDndDialog$7(DialogInterface dialog, int which) {
        long t = System.currentTimeMillis();
        switch (which) {
            case 0:
                setDnd(TimeUtils.HOUR + t);
                return;
            case 1:
                setDnd(28800000 + t);
                return;
            case 2:
                setDnd(TimeUtils.DAY + t);
                return;
            default:
                return;
        }
    }

    @Override // com.vkontakte.android.fragments.MaterialPreferenceToolbarFragment
    protected int getTitleRes() {
        return R.string.sett_notifications;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        updateExtendedSubtitles();
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        String newSettings = NotificationUtils.getNotificationSettings(getActivity());
        if (!newSettings.equals(this.initialSettings)) {
            this.initialSettings = newSettings;
            new AccountSetPushSettings().persist(null, null).setBackground(true).exec();
        }
    }

    @Override // com.vkontakte.android.fragments.MaterialPreferenceToolbarFragment, com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateView(inflater, container, savedInstanceState);
        view.setBackgroundColor(-1);
        return view;
    }

    private void setDnd(long t) {
        this.prefs.edit().putLong("dnd_end", (TimeUtils.getOffset() * 1000) + t).commit();
        PreferenceCategory cat = (PreferenceCategory) findPreference("cat_notify");
        if (cat.findPreference("dnd_cancel") == null) {
            cat.addPreference(this.cancelDndPref);
        }
        this.cancelDndPref.setSummary(getResources().getString(R.string.sett_dnd_desc, TimeUtils.langDate((int) (t / 1000))));
        cat.removePreference(this.dnd1Pref);
    }

    private void updateRingtoneName(String uri) {
        Preference pref = findPreference("notifyRingtone");
        String rt = uri != null ? uri : PreferenceManager.getDefaultSharedPreferences(getActivity()).getString("notifyRingtone", "content://settings/system/notification_sound");
        Ringtone ringtone = RingtoneManager.getRingtone(getActivity(), Uri.parse(rt));
        String name = AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
        if (ringtone != null || rt.length() == 0) {
            name = rt.length() > 0 ? ringtone.getTitle(getActivity()) : getString(R.string.sett_no_sound);
        }
        pref.setSummary(name);
    }
}
