package com.vkontakte.android.fragments.messages;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.Link;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.messages.MessagesGetHistoryAttachments;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.ui.holder.messages.LinkHolder;
import com.vkontakte.android.ui.util.DividerDrawable;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class ChatLinkAttachmentHistoryFragment extends VKRecyclerFragment<Link> {
    private Adapter adapter;
    private String nextFrom;

    /* loaded from: classes3.dex */
    public enum Type {
        link,
        market
    }

    public static ChatLinkAttachmentHistoryFragment create(int peer, Type type) {
        Bundle bundle = new Bundle();
        bundle.putInt("id", peer);
        bundle.putString("local_type", type.name());
        ChatLinkAttachmentHistoryFragment fr2 = new ChatLinkAttachmentHistoryFragment();
        fr2.setArguments(bundle);
        return fr2;
    }

    public ChatLinkAttachmentHistoryFragment() {
        super(50);
        this.adapter = new Adapter();
        this.nextFrom = null;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        Resources rs = inflater.getContext().getResources();
        int padding = rs.getDimensionPixelOffset(R.dimen.standard_list_item_padding) + V.dp(96.0f);
        DividerDrawable dividerDrawable = new DividerDrawable(padding, 654311424);
        DividerItemDecoration dividers = new DividerItemDecoration(dividerDrawable, V.dp(0.5f));
        dividers.setProvider(ChatLinkAttachmentHistoryFragment$$Lambda$1.lambdaFactory$(this));
        this.list.addItemDecoration(dividers);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateContentView$0(int position) {
        return position < this.data.size() + (-1);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        Type type = Type.valueOf(getArguments().getString("local_type"));
        if (offset == 0) {
            this.nextFrom = null;
        }
        switch (type) {
            case link:
                this.currentRequest = MessagesGetHistoryAttachments.create(Link.class, getArguments().getInt("id"), this.nextFrom, count).setCallback(new SimpleCallback<VKList<Link>>() { // from class: com.vkontakte.android.fragments.messages.ChatLinkAttachmentHistoryFragment.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(VKList<Link> result) {
                        ChatLinkAttachmentHistoryFragment.this.nextFrom = MessagesGetHistoryAttachments.nextFrom(result);
                        ChatLinkAttachmentHistoryFragment.this.onDataLoaded(result, !TextUtils.isEmpty(ChatLinkAttachmentHistoryFragment.this.nextFrom));
                    }
                }).exec((Context) getActivity());
                return;
            default:
                return;
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.adapter;
    }

    /* loaded from: classes3.dex */
    private class Adapter extends UsableRecyclerView.Adapter<LinkHolder> {
        private Adapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public LinkHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new LinkHolder(parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(LinkHolder holder, int position) {
            holder.bind(ChatLinkAttachmentHistoryFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return ChatLinkAttachmentHistoryFragment.this.data.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((Link) ChatLinkAttachmentHistoryFragment.this.data.get(position)).image_src;
        }
    }
}
