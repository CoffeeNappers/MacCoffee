package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupMenu;
import android.widget.TextView;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsAddLink;
import com.vkontakte.android.api.groups.GroupsDeleteLink;
import com.vkontakte.android.api.groups.GroupsEditLink;
import com.vkontakte.android.api.groups.GroupsGetLinks;
import com.vkontakte.android.api.groups.GroupsReorderLink;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment;
import com.vkontakte.android.ui.holder.UserHolder;
import java.util.List;
/* loaded from: classes2.dex */
public class LinksFragment extends AbsAdminUserListFragment {
    private boolean changed = false;
    private int dragPrevPos;

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setHasOptionsMenu(true);
        setTitle(R.string.group_links);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.add, menu);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.add) {
            showEditDialog(null, false);
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment
    public void onItemButtonClick(View button, final UserProfile link) {
        PopupMenu menu = new PopupMenu(getActivity(), button);
        menu.getMenu().add(0, 0, 0, R.string.edit);
        menu.getMenu().add(0, 1, 0, R.string.delete);
        menu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.1
            @Override // android.widget.PopupMenu.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case 0:
                        LinksFragment.this.showEditDialog(link, true);
                        break;
                    case 1:
                        LinksFragment.this.confirmAndDelete(link);
                        break;
                }
                return true;
            }
        });
        menu.show();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new GroupsGetLinks(getArguments().getInt("id")).setCallback(new SimpleCallback<List<UserProfile>>(this) { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(List<UserProfile> users) {
                LinksFragment.this.onDataLoaded(users, false);
            }
        }).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        if (this.changed) {
            Intent intent = new Intent(Posts.ACTION_RELOAD_PROFILE);
            intent.putExtra("id", -getArguments().getInt("id"));
            VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        }
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showEditDialog(final UserProfile link, final boolean edit) {
        final View view = View.inflate(getActivity(), R.layout.edit_link, null);
        if (link != null) {
            view.findViewById(R.id.address).setEnabled(!edit);
            ((TextView) view.findViewById(R.id.address)).setText(link.bdate);
            if (!edit) {
                ((TextView) view.findViewById(R.id.description)).setText(link.fullName);
            } else if (link.online == 1) {
                ((TextView) view.findViewById(R.id.description)).setText(link.fullName);
                ((TextView) view.findViewById(R.id.subtitle)).setText(link.university);
                view.findViewById(R.id.title).setVisibility(8);
            } else {
                ((TextView) view.findViewById(R.id.description)).setText(link.university);
                ((TextView) view.findViewById(R.id.title)).setText(link.fullName);
                view.findViewById(R.id.subtitle).setVisibility(8);
            }
        }
        if (!edit) {
            view.findViewById(R.id.title).setVisibility(8);
            view.findViewById(R.id.subtitle).setVisibility(8);
        }
        new VKAlertDialog.Builder(getActivity()).setTitle(edit ? R.string.edit_link : R.string.add_link).setView(view).setPositiveButton(link != null ? R.string.save : R.string.ok, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (edit) {
                    LinksFragment.this.editLink(link, ((TextView) view.findViewById(R.id.description)).getText().toString());
                    return;
                }
                String url = ((TextView) view.findViewById(R.id.address)).getText().toString();
                if (!url.startsWith("http://") && !url.startsWith("https://")) {
                    url = "http://" + url;
                }
                LinksFragment.this.addLink(url, ((TextView) view.findViewById(R.id.description)).getText().toString());
            }
        }).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addLink(final String address, final String desc) {
        new GroupsAddLink(getArguments().getInt("id"), address, desc).setCallback(new SimpleCallback<UserProfile>(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.4
            @Override // com.vkontakte.android.api.Callback
            public void success(UserProfile link) {
                LinksFragment.this.data.add(0, link);
                LinksFragment.this.updateList();
                LinksFragment.this.changed = true;
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                UserProfile l = new UserProfile();
                l.bdate = address;
                l.fullName = desc;
                LinksFragment.this.showEditDialog(l, false);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void editLink(final UserProfile link, final String descr) {
        new GroupsEditLink(getArguments().getInt("id"), link.uid, descr).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.5
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                if (link.online == 1) {
                    link.fullName = descr;
                } else {
                    link.university = descr;
                }
                int i = 0;
                while (true) {
                    if (i >= LinksFragment.this.data.size()) {
                        break;
                    } else if (((UserProfile) LinksFragment.this.data.get(i)).uid == link.uid) {
                        LinksFragment.this.data.set(i, link);
                        break;
                    } else {
                        i++;
                    }
                }
                LinksFragment.this.updateList();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                if (link.online == 1) {
                    link.fullName = descr;
                } else {
                    link.university = descr;
                }
                LinksFragment.this.showEditDialog(link, true);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    public void onItemClick(UserProfile profile) {
        Intent intent = new Intent(getActivity(), LinkRedirActivity.class);
        intent.setData(Uri.parse(profile.bdate));
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void confirmAndDelete(final UserProfile link) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.group_delete_link_confirm).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                LinksFragment.this.doDelete(link);
            }
        }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doDelete(final UserProfile link) {
        new GroupsDeleteLink(getArguments().getInt("id"), link.uid).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.7
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                LinksFragment.this.data.remove(link);
                LinksFragment.this.updateList();
                LinksFragment.this.changed = true;
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    private void sendReorder(final int id, int after) {
        new GroupsReorderLink(getArguments().getInt("id"), id, after).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.LinksFragment.8
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                LinksFragment.this.changed = true;
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                int pos = -1;
                int i = 0;
                while (true) {
                    if (i >= LinksFragment.this.data.size()) {
                        break;
                    } else if (((UserProfile) LinksFragment.this.data.get(i)).uid != id) {
                        i++;
                    } else {
                        pos = i;
                        break;
                    }
                }
                if (pos != -1) {
                    UserProfile link = (UserProfile) LinksFragment.this.data.remove(pos);
                    LinksFragment.this.data.add(LinksFragment.this.dragPrevPos, link);
                    LinksFragment.this.updateList();
                }
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment
    protected UserHolder<UserProfile> getHolder(ViewGroup parent) {
        return new Holder(this, parent);
    }

    /* loaded from: classes2.dex */
    private static class Holder extends AbsAdminUserListFragment.Holder<UserProfile> {
        protected Holder(AbsAdminUserListFragment fragment, ViewGroup parent) {
            super(fragment, parent, R.layout.groupadmin_user_item_edit);
        }

        @Override // com.vkontakte.android.fragments.groupadmin.AbsAdminUserListFragment.Holder, com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile user) {
            super.onBind((Holder) user);
            this.mOnline.setVisibility(8);
        }
    }
}
