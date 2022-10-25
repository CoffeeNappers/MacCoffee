package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsApproveRequest;
import com.vkontakte.android.api.groups.GroupsGetRequests;
import com.vkontakte.android.api.groups.GroupsRemoveUser;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.holder.FriendRequestHolder;
import java.util.Iterator;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class RequestsFragment extends CardRecyclerFragment<RequestUserProfile> {
    private RequestsAdapter adapter;

    public RequestsFragment() {
        super(50);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.friend_requests);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new GroupsGetRequests(getArguments().getInt("id"), offset, count).setCallback(new Callback<VKList<UserProfile>>() { // from class: com.vkontakte.android.fragments.groupadmin.RequestsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> result) {
                VKList<RequestUserProfile> r = new VKList<>();
                r.setTotal(result.total());
                Iterator it = result.iterator();
                while (it.hasNext()) {
                    UserProfile p = (UserProfile) it.next();
                    RequestUserProfile f = new RequestUserProfile(p);
                    f.message = "";
                    f.info = "";
                    r.add(f);
                }
                RequestsFragment.this.onDataLoaded((PaginatedList) r);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                RequestsFragment.this.onError(error);
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public UsableRecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new RequestsAdapter();
        }
        return this.adapter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class RequestsAdapter extends UsableRecyclerView.Adapter<FriendRequestHolder> implements CardItemDecorator.Provider {
        private RequestsAdapter() {
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onCreateViewHolder$0(UserProfile arg) {
            new ProfileFragment.Builder(arg.uid).go(RequestsFragment.this.getActivity());
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public FriendRequestHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new RequestHolder(parent).attach(RequestsFragment$RequestsAdapter$$Lambda$1.lambdaFactory$(this), RequestsFragment$RequestsAdapter$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onCreateViewHolder$1(RequestUserProfile friendRequest, Boolean accept, int adapterPos) {
            int uid = friendRequest.uid;
            if (accept.booleanValue()) {
                new GroupsApproveRequest(RequestsFragment.this.getArguments().getInt("id"), uid).persist(null, null).exec();
            } else {
                new GroupsRemoveUser(RequestsFragment.this.getArguments().getInt("id"), uid).persist(null, null).exec();
            }
            RequestsFragment.this.data.remove(friendRequest);
            notifyItemRemoved(adapterPos);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(FriendRequestHolder holder, int position) {
            holder.bind(RequestsFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return RequestsFragment.this.data.size();
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return 6;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((RequestUserProfile) RequestsFragment.this.data.get(position)).photo;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class RequestHolder extends FriendRequestHolder {
        public RequestHolder(@NonNull ViewGroup parent) {
            super(parent);
            ((TextView) this.itemView.findViewById(R.id.positive)).setText(R.string.group_accept_member);
            ((TextView) this.itemView.findViewById(R.id.negative)).setText(R.string.group_inv_decline);
        }
    }
}
