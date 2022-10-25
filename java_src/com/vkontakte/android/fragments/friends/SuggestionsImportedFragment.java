package com.vkontakte.android.fragments.friends;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.share.model.ShareContent;
import com.facebook.share.model.ShareLinkContent;
import com.facebook.share.widget.MessageDialog;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class SuggestionsImportedFragment extends GridFragment<UserProfile> {
    ShareLinkContent mFbDialogBuilder;
    List<UserProfile> mInvites;
    int mService;

    public SuggestionsImportedFragment() {
        super(Integer.MAX_VALUE);
        this.mInvites = new ArrayList();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        Friends.getImportedContacts(this.mService, SuggestionsImportedFragment$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$doLoadData$1(ArrayList imported, ArrayList notOnVk) {
        if (getActivity() != null) {
            getActivity().runOnUiThread(SuggestionsImportedFragment$$Lambda$2.lambdaFactory$(this, imported, notOnVk));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(ArrayList imported, ArrayList notOnVk) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < imported.size(); i++) {
            UserProfile p = (UserProfile) imported.get(i);
            if (p.isFriend) {
                arrayList.add(p);
            }
        }
        if (this.mService == 0 || this.mService == 3) {
            this.mInvites.addAll(notOnVk);
            for (int i2 = 0; i2 < this.mInvites.size(); i2++) {
                UserProfile p2 = this.mInvites.get(i2);
                p2.university = p2.extra.getString("external_id");
            }
        }
        onDataLoaded(arrayList, false);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (!this.loaded) {
            loadData();
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
        this.mService = getArguments().getInt("service", 0);
        if (this.mService == 2) {
            this.mFbDialogBuilder = new ShareLinkContent.Builder().setContentUrl(Uri.parse("http://vk.com/join")).setImageUrl(Uri.parse("https://pp.vk.me/c424830/v424830492/6800/4W_bSTYHBEY.jpg")).setContentTitle(getString(R.string.app_name)).setContentDescription(getString(R.string.invitation)).mo308build();
            setHasOptionsMenu(true);
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (getArguments().containsKey("title")) {
            setTitle(getArguments().getString("title"));
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (MessageDialog.canShow((Class<? extends ShareContent>) this.mFbDialogBuilder.getClass())) {
            MenuItem item = menu.add(getString(R.string.invite));
            item.setShowAsAction(2);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        MessageDialog.show(getActivity(), this.mFbDialogBuilder);
        return true;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<UserProfile>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return 1;
    }

    void onItemClick(UserProfile user) {
        if (user.uid == 0) {
            onInviteClick(user);
        } else {
            new ProfileFragment.Builder(user.uid).go(getActivity());
        }
    }

    void onInviteClick(UserProfile user) {
        if (this.mService == 0) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("sms:" + user.extra.getString("external_id")));
            intent.putExtra("sms_body", getString(R.string.invitation));
            startActivity(intent);
        }
        if (this.mService == 3) {
            Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse("mailto:" + user.extra.getString("external_id")));
            intent2.putExtra("android.intent.extra.SUBJECT", getString(R.string.app_name));
            intent2.putExtra("android.intent.extra.TEXT", getString(R.string.invitation));
            startActivity(intent2);
        }
    }

    /* loaded from: classes2.dex */
    private class Adapter extends GridFragment<UserProfile>.GridAdapter<RecyclerHolder> {
        final int TYPE_HEADER;
        final int TYPE_ITEM;

        private Adapter() {
            super();
            this.TYPE_ITEM = 0;
            this.TYPE_HEADER = 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new ItemHolder(parent);
                case 1:
                    HeaderHolder holder = new HeaderHolder(parent);
                    holder.bind(SuggestionsImportedFragment.this.getString(R.string.invite_section_title));
                    return holder;
                default:
                    return null;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder holder, int position) {
            if (getItemViewType(position) == 0) {
                ((ItemHolder) holder).bind(get(position));
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            if (getItemViewType(position) == 0) {
                return get(position).photo;
            }
            return null;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (SuggestionsImportedFragment.this.mInvites.isEmpty() ? 0 : SuggestionsImportedFragment.this.mInvites.size() + 1) + SuggestionsImportedFragment.this.data.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return position == SuggestionsImportedFragment.this.data.size() ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return getItemViewType(position) == 0 ? 1 : 0;
        }

        UserProfile get(int position) {
            return position < SuggestionsImportedFragment.this.data.size() ? (UserProfile) SuggestionsImportedFragment.this.data.get(position) : SuggestionsImportedFragment.this.mInvites.get((position - SuggestionsImportedFragment.this.data.size()) - 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ItemHolder extends UserHolder<UserProfile> {
        protected ItemHolder(ViewGroup parent) {
            super(parent, R.layout.suggest_list_item_invite, false, false, true);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile user) {
            super.onBind((ItemHolder) user);
            this.mActionButton.setVisibility(user.uid == 0 ? 0 : 8);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, android.view.View.OnClickListener
        public void onClick(View view) {
            if (view == this.itemView) {
                SuggestionsImportedFragment.this.onItemClick((UserProfile) getItem());
            } else if (view == this.mActionButton) {
                SuggestionsImportedFragment.this.onInviteClick((UserProfile) getItem());
            }
        }
    }
}
