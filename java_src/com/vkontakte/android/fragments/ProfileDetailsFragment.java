package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ProfileDetailsFragment extends CardRecyclerFragment<ProfileFragment.DetailsItem> {
    private ProfileDetailsAdapter adapter;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(ArrayList<? extends Parcelable> items, String title) {
            super(ProfileDetailsFragment.class);
            this.args.putParcelableArrayList(ServerKeys.ITEMS, items);
            this.args.putString("title", title);
        }
    }

    public ProfileDetailsFragment() {
        super(1);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setRefreshEnabled(false);
        setTitle(getArguments().getString("title"));
        loadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        ArrayList<ProfileFragment.DetailsItem> items = getArguments().getParcelableArrayList(ServerKeys.ITEMS);
        Iterator<ProfileFragment.DetailsItem> it = items.iterator();
        while (it.hasNext()) {
            ProfileFragment.DetailsItem item = it.next();
            if (!TextUtils.isEmpty(item.content)) {
                item.parsedContent = Global.replaceEmoji(LinkParser.parseLinks(item.content));
            }
        }
        onDataLoaded(items);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        dividers.setProvider(this.adapter);
        this.list.addItemDecoration(dividers);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new ProfileDetailsAdapter();
        }
        return this.adapter;
    }

    /* loaded from: classes2.dex */
    private class ProfileDetailsAdapter extends UsableRecyclerView.Adapter<RecyclerHolder<ProfileFragment.DetailsItem>> implements CardItemDecorator.Provider, DividerItemDecoration.Provider {
        private ProfileDetailsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<ProfileFragment.DetailsItem> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return viewType == 1 ? new ProfileDetailsHeaderViewHolder() : new ProfileDetailsViewHolder();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<ProfileFragment.DetailsItem> holder, int position) {
            holder.bind(ProfileDetailsFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return ProfileDetailsFragment.this.data.size();
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return ((ProfileFragment.DetailsItem) ProfileDetailsFragment.this.data.get(position)).bgType;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return ((ProfileFragment.DetailsItem) ProfileDetailsFragment.this.data.get(position)).isHeader ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
        public boolean needDrawDividerAfter(int position) {
            return (((ProfileFragment.DetailsItem) ProfileDetailsFragment.this.data.get(position)).bgType & 4) == 0 && !((ProfileFragment.DetailsItem) ProfileDetailsFragment.this.data.get(position)).isHeader;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ProfileDetailsViewHolder extends RecyclerHolder<ProfileFragment.DetailsItem> implements UsableRecyclerView.DisableableClickable {
        private TextView contact;
        private TextView content;
        private VKImageView photo;
        private TextView subtitle;
        private TextView title;

        public ProfileDetailsViewHolder() {
            super((int) R.layout.profile_details_item, ProfileDetailsFragment.this.getActivity());
            this.title = (TextView) this.itemView.findViewById(R.id.title);
            this.subtitle = (TextView) this.itemView.findViewById(R.id.subtitle);
            this.content = (TextView) this.itemView.findViewById(R.id.content);
            this.contact = (TextView) this.itemView.findViewById(R.id.contact);
            this.photo = (VKImageView) this.itemView.findViewById(R.id.photo);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ProfileFragment.DetailsItem item) {
            if (!TextUtils.isEmpty(item.title)) {
                this.title.setText(item.title);
                this.title.setVisibility(0);
            } else {
                this.title.setVisibility(8);
            }
            if (!TextUtils.isEmpty(item.content)) {
                this.content.setText(item.parsedContent);
                this.content.setVisibility(0);
            } else {
                this.content.setVisibility(8);
            }
            if (!TextUtils.isEmpty(item.subtitle)) {
                this.subtitle.setText(item.subtitle);
                this.subtitle.setVisibility(0);
            } else {
                this.subtitle.setVisibility(8);
            }
            if (!TextUtils.isEmpty(item.image)) {
                this.photo.setVisibility(0);
                this.photo.load(item.image);
            } else {
                this.photo.setVisibility(8);
            }
            if (TextUtils.isEmpty(item.contacts)) {
                this.contact.setVisibility(8);
                return;
            }
            this.contact.setVisibility(0);
            this.contact.setText(item.contacts);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.DisableableClickable
        public boolean isEnabled() {
            return ((ProfileFragment.DetailsItem) this.item).intent != null;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            try {
                ProfileDetailsFragment.this.startActivity(((ProfileFragment.DetailsItem) this.item).intent);
            } catch (ActivityNotFoundException e) {
                if (((ProfileFragment.DetailsItem) this.item).fallbackIntent != null) {
                    ProfileDetailsFragment.this.startActivity(((ProfileFragment.DetailsItem) this.item).fallbackIntent);
                } else {
                    Toast.makeText(ProfileDetailsFragment.this.getActivity(), (int) R.string.no_app_for_intent, 1).show();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ProfileDetailsHeaderViewHolder extends RecyclerHolder<ProfileFragment.DetailsItem> {
        public ProfileDetailsHeaderViewHolder() {
            super(ProfileDetailsFragment.this.getActivity(), R.layout.profile_section_header, ProfileDetailsFragment.this.list);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(ProfileFragment.DetailsItem item) {
            ((TextView) this.itemView).setText(item.title);
        }
    }
}
