package com.vkontakte.android.fragments;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.preference.ListPreference;
import android.support.v7.preference.Preference;
import android.support.v7.preference.TwoStatePreference;
import android.view.View;
import android.widget.RadioButton;
import com.vkontakte.android.ChangePasswordActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ValidationActivity;
import com.vkontakte.android.WelcomeActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountSetInfo;
import com.vkontakte.android.api.execute.ExecuteGetAccountSettings;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuthUtils;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public class SettingsAccountInnerFragment extends MaterialPreferenceFragment {
    private static final int DOMAIN_RESULT = 103;
    private static final int EMAIL_RESULT = 101;
    private static final int NEWS_FILTER_RESULT = 105;
    private static final int PHONE_RESULT = 102;
    private static final int REQUEST_SYNC_SETTINGS = 104;
    private ExecuteGetAccountSettings.Result info;

    @Override // com.vkontakte.android.fragments.MaterialPreferenceFragment, com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        boolean z = true;
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences_account);
        this.info = (ExecuteGetAccountSettings.Result) getArguments().getSerializable("api_result");
        Preference pref = findPreference("email");
        pref.setSummary(this.info.email);
        pref.setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$1.lambdaFactory$(this));
        Preference pref2 = findPreference(SignupPhoneFragment.KEY_PHONE);
        pref2.setSummary(this.info.phone);
        pref2.setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$2.lambdaFactory$(this));
        Preference pref3 = findPreference("domain");
        pref3.setSummary("@" + this.info.domain);
        pref3.setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$3.lambdaFactory$(this));
        findPreference("changePassword").setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$4.lambdaFactory$(this));
        Preference pref4 = findPreference("community_comments");
        updateCommunityCommentsLabel();
        pref4.setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$5.lambdaFactory$(this));
        Preference pref5 = findPreference("sync");
        updateSyncLabel(VKAuthUtils.getCurrentSyncOption());
        pref5.setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$6.lambdaFactory$(this));
        ((ListPreference) findPreference("onlyMyPosts")).setValueIndex(this.info.ownPostsDefault ? 1 : 0);
        TwoStatePreference twoStatePreference = (TwoStatePreference) findPreference("enableComments");
        if (this.info.noWallReplies) {
            z = false;
        }
        twoStatePreference.setChecked(z);
        findPreference("newsBanned").setOnPreferenceClickListener(SettingsAccountInnerFragment$$Lambda$7.lambdaFactory$(this));
        updateBannedLabel();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$0(Preference preference) {
        Intent intent = new Intent(getActivity(), ValidationActivity.class);
        intent.putExtra("url", this.info.emailLink);
        intent.putExtra(ValidationActivity.KEY_RETURN_RESULT, true);
        startActivityForResult(intent, 101);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$1(Preference preference) {
        Intent intent = new Intent(getActivity(), ValidationActivity.class);
        intent.putExtra("url", this.info.phoneLink);
        intent.putExtra(ValidationActivity.KEY_RETURN_RESULT, true);
        startActivityForResult(intent, 101);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$2(Preference preference) {
        Bundle args = new Bundle();
        args.putString("domain", this.info.domain);
        new Navigator(SettingsDomainFragment.class, args).forResult(this, 103);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$3(Preference preference) {
        Intent intent = new Intent(getActivity(), ChangePasswordActivity.class);
        startActivity(intent);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$5(Preference p) {
        View communitySettings = View.inflate(getActivity(), R.layout.settings_community_comments, null);
        boolean communityCommentsEnabled = VKAccountManager.getCurrent().communityComments;
        final RadioButton rbForAll = (RadioButton) communitySettings.findViewById(R.id.rb_community_for_all);
        rbForAll.setChecked(communityCommentsEnabled);
        final RadioButton rbForAdmined = (RadioButton) communitySettings.findViewById(R.id.rb_community_for_admined);
        rbForAdmined.setChecked(!communityCommentsEnabled);
        communitySettings.findViewById(R.id.ll_community_for_all).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SettingsAccountInnerFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                rbForAll.setChecked(true);
                rbForAdmined.setChecked(false);
            }
        });
        communitySettings.findViewById(R.id.ll_community_for_admined).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SettingsAccountInnerFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                rbForAll.setChecked(false);
                rbForAdmined.setChecked(true);
            }
        });
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.community_comments_settings_title_new_extended).setView(communitySettings).setPositiveButton(R.string.save, SettingsAccountInnerFragment$$Lambda$8.lambdaFactory$(this, rbForAll)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$4(RadioButton rbForAll, DialogInterface dialog, int which) {
        updateCommunityCommentsSetting(rbForAll.isChecked());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$6(Preference preference) {
        Intent intent = new Intent(getActivity(), WelcomeActivity.class);
        intent.setAction("syncsettings");
        startActivityForResult(intent, 104);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreate$7(Preference preference) {
        new Navigator(NewsfeedFilterListFragment.class, new Bundle()).forResult(getActivity(), 105);
        return true;
    }

    private void updateCommunityCommentsSetting(final boolean newValue) {
        if (VKAccountManager.getCurrent().communityComments != newValue) {
            AccountSetInfo accountSetInfo = new AccountSetInfo();
            accountSetInfo.setCommunityComments(newValue);
            accountSetInfo.wrapProgress(getActivity()).setCallback(new SimpleCallback<Boolean>(getActivity()) { // from class: com.vkontakte.android.fragments.SettingsAccountInnerFragment.3
                @Override // com.vkontakte.android.api.Callback
                public void success(Boolean result) {
                    VKAccountManager.getCurrent().communityComments = newValue;
                    if (SettingsAccountInnerFragment.this.getActivity() != null) {
                        SettingsAccountInnerFragment.this.updateCommunityCommentsLabel();
                    }
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (SettingsAccountInnerFragment.this.getActivity() != null) {
                        super.fail(error);
                    }
                }
            }).exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateCommunityCommentsLabel() {
        String string;
        Preference findPreference = findPreference("community_comments");
        if (VKAccountManager.getCurrent().communityComments) {
            string = getString(R.string.community_comments_settings_option_everywhere);
        } else {
            string = getString(R.string.community_comments_settings_option_only_in_your_communities);
        }
        findPreference.setSummary(string);
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        Preference pref = findPreference("onlyMyPosts");
        boolean newOnlyMy = ((ListPreference) pref).getValue().equals("off");
        Preference pref2 = findPreference("enableComments");
        boolean newNoComments = !((TwoStatePreference) pref2).isChecked();
        if (newOnlyMy != this.info.ownPostsDefault || newNoComments != this.info.noWallReplies) {
            new AccountSetInfo(newOnlyMy, newNoComments).persist(null, null).exec();
        }
    }

    private void updateSyncLabel(int syncSetting) {
        Log.i("vk", "Update sync label " + syncSetting);
        Preference pref = findPreference("sync");
        switch (syncSetting) {
            case -1:
                pref.setEnabled(false);
                pref.setSummary(R.string.sync_not_supported);
                return;
            case 0:
                pref.setSummary(R.string.sync_all);
                return;
            case 1:
                pref.setSummary(R.string.sync_existing);
                return;
            case 2:
                pref.setSummary(R.string.sync_off);
                return;
            default:
                return;
        }
    }

    private void updateBannedLabel() {
        findPreference("newsBanned").setSummary(this.info.newsBannedCount > 0 ? getString(R.string.sett_news_filter_summary, new Object[]{Integer.valueOf(this.info.newsBannedCount)}) : getString(R.string.sett_news_banned_summary));
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 104 && resultCode == -1) {
            updateSyncLabel(data.getIntExtra("option", 0));
        }
        if (requestCode == 102 && resultCode == -1) {
            Uri uri = data.getData();
            if (uri.getQueryParameter(SignupPhoneFragment.KEY_PHONE) != null) {
                this.info.phone = uri.getQueryParameter(SignupPhoneFragment.KEY_PHONE);
                Preference pref = findPreference(SignupPhoneFragment.KEY_PHONE);
                pref.setSummary(this.info.phone);
            }
        }
        if (requestCode == 101 && resultCode == -1) {
            Uri uri2 = data.getData();
            if (uri2.getQueryParameter("email") != null) {
                this.info.email = uri2.getQueryParameter("email");
                Preference pref2 = findPreference("email");
                pref2.setSummary(this.info.email);
            }
        }
        if (requestCode == 105 && resultCode == -1) {
            this.info.newsBannedCount = data.getIntExtra("new_count", 0);
            updateBannedLabel();
        }
        if (requestCode == 103 && resultCode == -1) {
            this.info.domain = data.getStringExtra("new_domain");
            findPreference("domain").setSummary("@" + this.info.domain);
        }
    }
}
