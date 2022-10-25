package com.vkontakte.android.fragments.messages;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesGetHistoryAttachments;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.documents.DocumentsByTypeFragment;
/* loaded from: classes2.dex */
public class ChatDocAttachmentHistoryFragment extends DocumentsByTypeFragment {
    private String nextFrom = null;

    public static ChatDocAttachmentHistoryFragment create(int peer) {
        ChatDocAttachmentHistoryFragment fragment = new ChatDocAttachmentHistoryFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("peer_id", peer);
        fragment.setArguments(bundle);
        return fragment;
    }

    public ChatDocAttachmentHistoryFragment() {
        setRefreshEnabled(true);
    }

    @Override // com.vkontakte.android.fragments.documents.DocumentsByTypeFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.documents.DocumentsByTypeFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (getActivity() != null) {
            if (offset == 0) {
                this.nextFrom = null;
            }
            this.currentRequest = MessagesGetHistoryAttachments.create(Document.class, getArguments().getInt("peer_id"), this.nextFrom, count).setCallback(new SimpleCallback<VKList<Document>>(this) { // from class: com.vkontakte.android.fragments.messages.ChatDocAttachmentHistoryFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Document> res) {
                    ChatDocAttachmentHistoryFragment.this.nextFrom = MessagesGetHistoryAttachments.nextFrom(res);
                    ChatDocAttachmentHistoryFragment.this.getActivity().invalidateOptionsMenu();
                    ChatDocAttachmentHistoryFragment.this.onDataLoaded(res, !TextUtils.isEmpty(ChatDocAttachmentHistoryFragment.this.nextFrom));
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                }
            }).exec((Context) getActivity());
        }
    }
}
