package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.groups.GroupsEditManager;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.CompoundRadioGroup;
import com.vkontakte.android.ui.cardview.CardDrawable;
import me.grishka.appkit.fragments.ToolbarFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class ManagerEditFragment extends ToolbarFragment {
    private UserProfile profile;
    private View view;

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.profile = (UserProfile) getArguments().getParcelable("profile");
        setTitle(R.string.group_edit_manager_title);
        setHasOptionsMenu(true);
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
        View v = inflater.inflate(R.layout.group_edit_manager, (ViewGroup) null);
        this.view = v;
        ((TextView) v.findViewById(R.id.name)).setText(this.profile.fullName);
        ((TextView) v.findViewById(R.id.description)).setText(getString(R.string.group_edit_manager_description, new Object[]{this.profile.getNameInCase(3)}));
        CompoundRadioGroup radoigroup = (CompoundRadioGroup) v.findViewById(R.id.group_access_radiogroup);
        if (this.profile.extra.containsKey("role")) {
            String string = this.profile.extra.getString("role");
            char c = 65535;
            switch (string.hashCode()) {
                case -2004703995:
                    if (string.equals("moderator")) {
                        c = 1;
                        break;
                    }
                    break;
                case -1307827859:
                    if (string.equals("editor")) {
                        c = 2;
                        break;
                    }
                    break;
                case -652229939:
                    if (string.equals("administrator")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    radoigroup.setCheckedId(R.id.admin);
                    break;
                case 1:
                    radoigroup.setCheckedId(R.id.moder);
                    break;
                case 2:
                    radoigroup.setCheckedId(R.id.editor);
                    break;
            }
            if ("creator".equals(this.profile.extra.getString("role"))) {
                v.findViewById(R.id.group_access_block).setVisibility(8);
                v.findViewById(R.id.button_remove).setVisibility(8);
            } else {
                v.findViewById(R.id.button_remove).setVisibility(0);
            }
        } else {
            radoigroup.setCheckedId(R.id.moder);
            v.findViewById(R.id.button_remove).setVisibility(8);
        }
        boolean show = this.profile.extra.containsKey("contact_title");
        CheckBox showContact = (CheckBox) v.findViewById(R.id.show_in_contacts);
        showContact.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.vkontakte.android.fragments.groupadmin.ManagerEditFragment.1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                int i = 0;
                ManagerEditFragment.this.view.findViewById(R.id.group_admin_contact_title).setVisibility(isChecked ? 0 : 8);
                if (ManagerEditFragment.this.view.findViewById(R.id.group_admin_contact_title_divider) != null) {
                    View findViewById = ManagerEditFragment.this.view.findViewById(R.id.group_admin_contact_title_divider);
                    if (!isChecked) {
                        i = 8;
                    }
                    findViewById.setVisibility(i);
                }
            }
        });
        showContact.setChecked(show);
        if (show) {
            ((TextView) this.view.findViewById(R.id.group_admin_contact_title)).setText(this.profile.extra.getString("contact_title"));
        } else {
            this.view.findViewById(R.id.group_admin_contact_title).setVisibility(8);
            if (this.view.findViewById(R.id.group_admin_contact_title_divider) != null) {
                this.view.findViewById(R.id.group_admin_contact_title_divider).setVisibility(8);
            }
        }
        ((VKImageView) this.view.findViewById(R.id.photo)).load(this.profile.photo);
        v.findViewById(R.id.button_remove).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.ManagerEditFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v2) {
                ManagerEditFragment.this.remove();
            }
        });
        return v;
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
        new Navigator(ManagerEditFragment.class, new TabletDialogActivity.Builder().setGravity(17), args).go(act);
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.view = null;
    }

    private void save() {
        String role;
        final String displayableRole;
        CompoundRadioGroup radoigroup = (CompoundRadioGroup) this.view.findViewById(R.id.group_access_radiogroup);
        switch (radoigroup.getCheckedId()) {
            case R.id.moder /* 2131755780 */:
                role = "moderator";
                displayableRole = getString(R.string.group_level_moderator);
                break;
            case R.id.editor /* 2131755781 */:
                role = "editor";
                displayableRole = getString(R.string.group_level_editor);
                break;
            case R.id.admin /* 2131755782 */:
                role = "administrator";
                displayableRole = getString(R.string.group_level_admin);
                break;
            default:
                role = null;
                displayableRole = getString(R.string.group_level_creator);
                break;
        }
        CheckBox showContact = (CheckBox) this.view.findViewById(R.id.show_in_contacts);
        final String contactTitle = ((TextView) this.view.findViewById(R.id.group_admin_contact_title)).getText().toString();
        final boolean show = showContact.isChecked();
        final String str = role;
        new GroupsEditManager(getArguments().getInt("id"), this.profile.uid, role, show, contactTitle).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.ManagerEditFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                boolean added = !ManagerEditFragment.this.profile.extra.containsKey("role");
                ManagerEditFragment.this.profile.university = displayableRole;
                if (str != null) {
                    ManagerEditFragment.this.profile.extra.putString("role", str);
                }
                if (show) {
                    ManagerEditFragment.this.profile.extra.putString("contact_title", contactTitle);
                } else {
                    ManagerEditFragment.this.profile.extra.remove("contact_title");
                }
                Intent intent = new Intent(added ? GroupsAdmin.ACTION_ADMIN_ADDED : GroupsAdmin.ACTION_ADMIN_CHANGED);
                intent.putExtra("group_id", ManagerEditFragment.this.getArguments().getInt("id"));
                intent.putExtra("profile", ManagerEditFragment.this.profile);
                LocalBroadcastManager.getInstance(VKApplication.context).sendBroadcast(intent);
                if (ManagerEditFragment.this.getArguments().getBoolean("_dialog")) {
                    ManagerEditFragment.this.dismiss();
                } else {
                    ManagerEditFragment.this.getActivity().finish();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void remove() {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(Html.fromHtml(getString(R.string.group_remove_manager_confirm, new Object[]{"<b>" + this.profile.getNameInCase(3) + "</b>"}))).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.ManagerEditFragment.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                new GroupsEditManager(ManagerEditFragment.this.getArguments().getInt("id"), ManagerEditFragment.this.profile.uid, null, false, null).setCallback(new ResultlessCallback(ManagerEditFragment.this.getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.ManagerEditFragment.4.1
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        Intent intent = new Intent(GroupsAdmin.ACTION_ADMIN_REMOVED);
                        intent.putExtra("group_id", ManagerEditFragment.this.getArguments().getInt("id"));
                        intent.putExtra("user_id", ManagerEditFragment.this.profile.uid);
                        LocalBroadcastManager.getInstance(VKApplication.context).sendBroadcast(intent);
                        if (ManagerEditFragment.this.getArguments().getBoolean("_dialog")) {
                            ManagerEditFragment.this.dismiss();
                        } else {
                            ManagerEditFragment.this.getActivity().finish();
                        }
                    }
                }).wrapProgress(ManagerEditFragment.this.getActivity()).exec((Context) ManagerEditFragment.this.getActivity());
            }
        }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    @Override // android.app.DialogFragment
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Dialog dlg = super.onCreateDialog(savedInstanceState);
        dlg.setTitle(R.string.group_edit_manager_title);
        return dlg;
    }
}
