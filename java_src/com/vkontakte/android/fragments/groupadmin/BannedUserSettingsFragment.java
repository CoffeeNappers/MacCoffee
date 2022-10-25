package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.groups.GroupsBanUser;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import me.grishka.appkit.fragments.ToolbarFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class BannedUserSettingsFragment extends ToolbarFragment {
    private static final int[] BLOCK_DURATIONS = {0, 31536000, 2678400, 604800, 86400, 3600};
    private EditText commentEdit;
    private ArrayAdapter<DurationOption> durationAdapter;
    private Spinner durationSpinner;
    private UserProfile profile;
    private ArrayAdapter<CharSequence> reasonAdapter;
    private Spinner reasonSpinner;
    private CheckBox showCommentCheck;
    private View view;

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.profile = (UserProfile) getArguments().getParcelable("profile");
        this.profile.extra.setClassLoader(UserProfile.class.getClassLoader());
        setHasOptionsMenu(true);
        setTitle(R.string.group_ban_user_title);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        MenuItem item = menu.add(R.string.save);
        item.setIcon(R.drawable.ic_check_24dp);
        item.setShowAsAction(2);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        save();
        return true;
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        int endDate;
        this.view = inflater.inflate(R.layout.group_banned_user, (ViewGroup) null);
        this.durationSpinner = (Spinner) this.view.findViewById(R.id.group_ban_duration);
        this.reasonSpinner = (Spinner) this.view.findViewById(R.id.group_ban_reason);
        this.commentEdit = (EditText) this.view.findViewById(R.id.group_ban_comment);
        this.showCommentCheck = (CheckBox) this.view.findViewById(R.id.group_ban_show_comment);
        this.reasonAdapter = ArrayAdapter.createFromResource(getActivity(), R.array.group_ban_reasons, R.layout.card_spinner_item);
        this.reasonAdapter.setDropDownViewResource(17367049);
        this.reasonSpinner.setAdapter((SpinnerAdapter) this.reasonAdapter);
        UserProfile admin = (UserProfile) this.profile.extra.getParcelable("ban_admin");
        this.durationAdapter = new ArrayAdapter<DurationOption>(getActivity(), R.layout.card_spinner_item) { // from class: com.vkontakte.android.fragments.groupadmin.BannedUserSettingsFragment.1
            @Override // android.widget.ArrayAdapter, android.widget.BaseAdapter, android.widget.SpinnerAdapter
            public View getDropDownView(int position, View convertView, ViewGroup parent) {
                View v = convertView != null ? convertView : View.inflate(BannedUserSettingsFragment.this.getActivity(), R.layout.spinner_item_subtitle, null);
                DurationOption opt = getItem(position);
                ((TextView) v.findViewById(16908308)).setText(opt.title);
                TextView subtitle = (TextView) v.findViewById(16908309);
                if (opt.subtitle != null) {
                    subtitle.setVisibility(0);
                    subtitle.setText(opt.subtitle);
                } else {
                    subtitle.setVisibility(8);
                }
                return v;
            }
        };
        String[] durations = getResources().getStringArray(R.array.group_ban_duration_options);
        if (this.profile.extra.containsKey("ban_end_date") && (endDate = this.profile.extra.getInt("ban_end_date")) > 0) {
            DurationOption opt = new DurationOption();
            opt.title = getString(R.string.group_ban_subtitle_auto, new Object[]{TimeUtils.langDate(endDate)});
            opt.time = endDate;
            this.durationAdapter.add(opt);
        }
        for (int i = 0; i < durations.length; i++) {
            DurationOption opt2 = new DurationOption();
            opt2.title = durations[i];
            if (i == 0) {
                opt2.subtitle = getString(R.string.group_ban_subtitle_manual);
            } else {
                opt2.time = TimeUtils.getCurrentTime() + BLOCK_DURATIONS[i];
                opt2.subtitle = getString(R.string.group_ban_subtitle_auto, new Object[]{TimeUtils.langDate(opt2.time)});
            }
            this.durationAdapter.add(opt2);
        }
        this.durationSpinner.setAdapter((SpinnerAdapter) this.durationAdapter);
        ((TextView) this.view.findViewById(R.id.name)).setText(this.profile.fullName);
        if (admin != null) {
            ((TextView) this.view.findViewById(R.id.description)).setText(getString(this.profile.f ? R.string.group_ban_banned_f : R.string.group_ban_banned_m) + "\n" + getString(admin.f ? R.string.added_by_f : R.string.added_by_m, new Object[]{admin.fullName}) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + TimeUtils.langDate(this.profile.extra.getInt("ban_date")));
            this.reasonSpinner.setSelection(Math.max(0, Math.min(this.reasonAdapter.getCount() - 1, this.profile.extra.getInt("ban_reason"))));
            this.commentEdit.setText(this.profile.extra.getString("ban_comment"));
            this.showCommentCheck.setChecked(this.profile.extra.getBoolean("ban_comment_visible"));
        } else {
            ((TextView) this.view.findViewById(R.id.description)).setText((this.profile.extra.getBoolean("is_group_member") || getArguments().getBoolean("is_group_member")) ? R.string.group_ban_member : R.string.group_ban_not_member);
            this.view.findViewById(R.id.button_remove).setVisibility(8);
        }
        ((VKImageView) this.view.findViewById(R.id.photo)).load(this.profile.photo);
        this.view.findViewById(R.id.button_remove).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.BannedUserSettingsFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                BannedUserSettingsFragment.this.unban();
            }
        });
        return this.view;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    private void updateDecorator() {
        ViewGroup vg = (ViewGroup) ((ViewGroup) this.view).getChildAt(0);
        for (int i = 0; i < vg.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = vg.getChildAt(i);
            c.setBackgroundDrawable(bg);
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) c.getLayoutParams();
            lp.topMargin = V.dp(3.0f);
            lp.bottomMargin = V.dp(2.0f);
        }
        int pad = this.scrW >= 924 ? V.dp(32.0f) : 0;
        vg.setPadding(pad, 0, pad, 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!getArguments().getBoolean("_split")) {
            getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        }
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = super.onCreateView(inflater, container, savedInstanceState);
        this.content.setScrollBarStyle(33554432);
        updateConfiguration();
        updateDecorator();
        return v;
    }

    public static void open(Bundle args, Activity act) {
        new Navigator(BannedUserSettingsFragment.class, new TabletDialogActivity.Builder().setGravity(17), args).go(act);
    }

    private void save() {
        final int endDate = ((DurationOption) this.durationSpinner.getSelectedItem()).time;
        final int reason = this.reasonSpinner.getSelectedItemPosition();
        final String comment = this.commentEdit.getText().toString();
        final boolean showComment = this.showCommentCheck.isChecked();
        new GroupsBanUser(getArguments().getInt("id"), this.profile.uid, true, endDate, reason, comment, showComment).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.BannedUserSettingsFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                boolean wasBanned = BannedUserSettingsFragment.this.profile.extra.containsKey("ban_admin");
                if (!wasBanned) {
                    UserProfile me2 = new UserProfile();
                    me2.fullName = VKAccountManager.getCurrent().getName();
                    me2.f = BannedUserSettingsFragment.this.getActivity().getSharedPreferences(null, 0).getBoolean("usersex", false);
                    me2.uid = VKAccountManager.getCurrent().getUid();
                    BannedUserSettingsFragment.this.profile.extra.putParcelable("ban_admin", me2);
                    BannedUserSettingsFragment.this.profile.extra.putInt("ban_date", TimeUtils.getCurrentTime());
                }
                if (endDate > 0) {
                    BannedUserSettingsFragment.this.profile.extra.putInt("ban_end_date", endDate);
                } else {
                    BannedUserSettingsFragment.this.profile.extra.remove("ban_end_date");
                }
                BannedUserSettingsFragment.this.profile.extra.putString("ban_comment", comment);
                BannedUserSettingsFragment.this.profile.extra.putInt("ban_reason", reason);
                BannedUserSettingsFragment.this.profile.extra.putBoolean("ban_comment_visible", showComment);
                Intent intent = new Intent(wasBanned ? GroupsAdmin.ACTION_BAN_CHANGED : GroupsAdmin.ACTION_BAN_ADDED);
                intent.putExtra("group_id", BannedUserSettingsFragment.this.getArguments().getInt("id"));
                intent.putExtra("profile", BannedUserSettingsFragment.this.profile);
                LocalBroadcastManager.getInstance(VKApplication.context).sendBroadcast(intent);
                if (BannedUserSettingsFragment.this.getArguments().getBoolean("_dialog")) {
                    BannedUserSettingsFragment.this.dismiss();
                } else {
                    BannedUserSettingsFragment.this.getActivity().finish();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unban() {
        new GroupsBanUser(getArguments().getInt("id"), this.profile.uid, false, 0, 0, null, false).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.BannedUserSettingsFragment.4
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent(GroupsAdmin.ACTION_BAN_REMOVED);
                intent.putExtra("group_id", BannedUserSettingsFragment.this.getArguments().getInt("id"));
                intent.putExtra("user_id", BannedUserSettingsFragment.this.profile.uid);
                LocalBroadcastManager.getInstance(VKApplication.context).sendBroadcast(intent);
                BannedUserSettingsFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class DurationOption {
        String subtitle;
        int time;
        String title;

        private DurationOption() {
        }

        public String toString() {
            return this.title;
        }
    }
}
