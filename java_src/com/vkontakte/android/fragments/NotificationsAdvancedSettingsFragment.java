package com.vkontakte.android.fragments;

import android.content.Intent;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.preference.Preference;
import android.support.v7.preference.PreferenceManager;
import android.support.v7.preference.PreferenceScreen;
import com.facebook.internal.AnalyticsEvents;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.ui.MaterialSwitchPreference;
import com.vkontakte.android.ui.RingtonePreference;
/* loaded from: classes2.dex */
public class NotificationsAdvancedSettingsFragment extends MaterialPreferenceToolbarFragment {
    private RingtonePreference prefSound = null;
    private String type;

    @Override // com.vkontakte.android.fragments.MaterialPreferenceFragment, com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.type = getArguments().getString(ServerKeys.TYPE);
        getActivity().setTitle(getArguments().getString("title"));
        addPreferencesFromResource(R.xml.empty_pref_screen);
        PreferenceScreen screen = getPreferenceScreen();
        MaterialSwitchPreference prefEnable = new MaterialSwitchPreference(getStyledContext());
        prefEnable.setTitle(R.string.sett_notifications);
        prefEnable.setKey("notifications" + this.type);
        prefEnable.setDefaultValue(true);
        screen.addPreference(prefEnable);
        MaterialSwitchPreference prefAdvanced = new MaterialSwitchPreference(getStyledContext());
        prefAdvanced.setTitle(R.string.sett_advanced);
        prefAdvanced.setKey("notifyAdvanced" + this.type);
        prefAdvanced.setDefaultValue(false);
        screen.addPreference(prefAdvanced);
        prefAdvanced.setDependency("notifications" + this.type);
        this.prefSound = new RingtonePreference(getStyledContext());
        this.prefSound.setOnPreferenceClickListener(NotificationsAdvancedSettingsFragment$$Lambda$1.lambdaFactory$(this));
        this.prefSound.setTitle(R.string.sett_notify_sound);
        this.prefSound.setKey("notifyRingtone" + this.type);
        this.prefSound.setDefaultValue(PreferenceManager.getDefaultSharedPreferences(getActivity()).getString("notifyRingtone", "content://settings/system/notification_sound"));
        this.prefSound.setShowDefault(true);
        this.prefSound.setRingtoneType(2);
        screen.addPreference(this.prefSound);
        this.prefSound.setDependency("notifyAdvanced" + this.type);
        this.prefSound.setOnPreferenceChangeListener(NotificationsAdvancedSettingsFragment$$Lambda$2.lambdaFactory$(this));
        MaterialSwitchPreference prefVibrate = new MaterialSwitchPreference(getStyledContext());
        prefVibrate.setTitle(R.string.sett_notify_vibrate);
        prefVibrate.setKey("notifyVibrate" + this.type);
        prefVibrate.setDefaultValue(Boolean.valueOf(PreferenceManager.getDefaultSharedPreferences(getActivity()).getBoolean("notifyVibrate", true)));
        screen.addPreference(prefVibrate);
        prefVibrate.setDependency("notifyAdvanced" + this.type);
        MaterialSwitchPreference prefLed = new MaterialSwitchPreference(getStyledContext());
        prefLed.setTitle(R.string.sett_notify_led);
        prefLed.setKey("notifyLED" + this.type);
        prefLed.setDefaultValue(Boolean.valueOf(PreferenceManager.getDefaultSharedPreferences(getActivity()).getBoolean("notifyLED", true)));
        screen.addPreference(prefLed);
        prefLed.setDependency("notifyAdvanced" + this.type);
        if (Build.VERSION.SDK_INT >= 21) {
            MaterialSwitchPreference prefHeadsUp = new MaterialSwitchPreference(getStyledContext());
            prefHeadsUp.setTitle(R.string.sett_heads_up_notifications);
            prefHeadsUp.setKey("notifyHeadsUp" + this.type);
            prefHeadsUp.setDefaultValue(Boolean.valueOf(PreferenceManager.getDefaultSharedPreferences(getActivity()).getBoolean("notifyHeadsUp", false)));
            screen.addPreference(prefHeadsUp);
            prefHeadsUp.setDependency("notifyAdvanced" + this.type);
        }
        setHasOptionsMenu(true);
        updateRingtoneName(null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$0(Preference preference) {
        this.prefSound.startSelectRingtone(this);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$1(Preference preference, Object newValue) {
        updateRingtoneName((String) newValue);
        return true;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.prefSound == null || !this.prefSound.onActivityResult(requestCode, resultCode, data)) {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    private void updateRingtoneName(String uri) {
        Preference pref = findPreference("notifyRingtone" + this.type);
        String rt = uri != null ? uri : PreferenceManager.getDefaultSharedPreferences(getActivity()).getString("notifyRingtone" + this.type, "content://settings/system/notification_sound");
        Ringtone ringtone = RingtoneManager.getRingtone(getActivity(), Uri.parse(rt));
        String name = AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
        if (ringtone != null || rt.length() == 0) {
            name = rt.length() > 0 ? ringtone.getTitle(getActivity()) : getString(R.string.sett_no_sound);
        }
        pref.setSummary(name);
    }

    @Override // com.vkontakte.android.fragments.MaterialPreferenceToolbarFragment
    protected int getTitleRes() {
        return R.string.sett_notifications;
    }
}
