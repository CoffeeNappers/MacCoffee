package com.vkontakte.android.fragments.friends;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.Global;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.friends.FriendsDelete;
import com.vkontakte.android.api.friends.FriendsDeleteAllRequests;
import com.vkontakte.android.api.friends.FriendsGetRequests;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF2Int;
import com.vkontakte.android.ui.holder.FriendRequestHolder;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes2.dex */
public class FriendRequestsFragment extends GridFragment<RequestUserProfile> {
    private int counter;
    private boolean isOutgoing;
    private boolean isSuggest;
    private VoidF2Int<RequestUserProfile, Boolean> mAcceptListener;
    private VoidF1<UserProfile> mProfileListener;
    private BroadcastReceiver mReceiver;
    private boolean showClearAll;

    static /* synthetic */ int access$710(FriendRequestsFragment x0) {
        int i = x0.counter;
        x0.counter = i - 1;
        return i;
    }

    public FriendRequestsFragment() {
        super(20);
        this.mProfileListener = FriendRequestsFragment$$Lambda$1.lambdaFactory$(this);
        this.mAcceptListener = FriendRequestsFragment$$Lambda$2.lambdaFactory$(this);
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.friends.FriendRequestsFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                boolean z = false;
                if (Friends.ACTION_FRIEND_STATUS_CHANGED.equals(intent.getAction())) {
                    int id = intent.getIntExtra("id", 0);
                    int status = intent.getIntExtra("status", 0);
                    if (FriendRequestsFragment.this.data != null) {
                        for (int i = 0; i < FriendRequestsFragment.this.data.size(); i++) {
                            RequestUserProfile request = (RequestUserProfile) FriendRequestsFragment.this.data.get(i);
                            if (request.uid == id) {
                                if (status == 1 || status == 3) {
                                    z = true;
                                }
                                request.sent = Boolean.valueOf(z);
                                GridFragment<RequestUserProfile>.GridAdapter<?> adapter = FriendRequestsFragment.this.mo1066getAdapter();
                                if (adapter != null) {
                                    adapter.notifyDataSetChanged();
                                    return;
                                }
                                return;
                            }
                        }
                    }
                }
            }
        };
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new FriendsGetRequests(offset, count, this.isSuggest, this.isOutgoing && !this.isSuggest).setCallback(new Callback<FriendsGetRequests.Result>() { // from class: com.vkontakte.android.fragments.friends.FriendRequestsFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(FriendsGetRequests.Result result) {
                FriendRequestsFragment.this.onDataLoaded((PaginatedList) result.list);
                int count2 = Math.max(0, result.total);
                if (!FriendRequestsFragment.this.isSuggest) {
                    if (FriendRequestsFragment.this.isOutgoing) {
                        Friends.notifyCounterChanged(count2, Friends.Request.OUT);
                    } else {
                        Friends.notifyCounterChanged(count2, Friends.Request.IN);
                    }
                } else {
                    Friends.notifyCounterChanged(count2, Friends.Request.SUGGEST);
                }
                LongPollService.updateCounters();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                FriendRequestsFragment.this.onError(error);
            }
        }).exec((Context) getActivity());
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle args = getArguments();
        if (args != null) {
            this.isOutgoing = args.getBoolean("out", false);
            this.isSuggest = args.getBoolean("suggests", false);
            this.showClearAll = args.getBoolean("menu_clear_all", false);
        }
        setHasOptionsMenu(this.showClearAll);
        getActivity().registerReceiver(this.mReceiver, new IntentFilter(Friends.ACTION_FRIEND_STATUS_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(this.isSuggest ? R.string.friend_suggestions : R.string.sett_friend_requests);
        this.list.addItemDecoration(new DividerItemDecoration(new ColorDrawable(637534208), Global.scale(0.5f), this.isTablet ? null : new ColorDrawable(-1), this.isTablet ? 0 : V.dp(9.0f), null, 0).setProvider((DividerItemDecoration.Provider) mo1066getAdapter()));
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        if (this.showClearAll) {
            MenuItem clearAll = menu.add(0, R.id.clear, 0, R.string.clear);
            clearAll.setShowAsAction(2);
            clearAll.setIcon(R.drawable.ic_ab_delete);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() != R.id.clear || this.data.isEmpty()) {
            return super.onOptionsItemSelected(item);
        }
        Activity activity = getActivity();
        new VKAlertDialog.Builder(activity).setTitle(R.string.sett_friend_requests).setMessage(R.string.friends_delete_all_requests).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).setPositiveButton(R.string.yes, FriendRequestsFragment$$Lambda$3.lambdaFactory$(this, activity)).show();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onOptionsItemSelected$0(final Activity activity, DialogInterface dialogInterface, int i) {
        new FriendsDeleteAllRequests().wrapProgress(getContext()).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.friends.FriendRequestsFragment.3
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                if (FriendRequestsFragment.this.isResumed()) {
                    LongPollService.updateCounters();
                    if (activity != null) {
                        activity.finish();
                    }
                }
            }
        }).exec();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        showProgress();
        refresh();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<RequestUserProfile>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return (!this.isTablet || this.scrW < 800) ? 1 : 2;
    }

    public void setCounter(int counter) {
        this.counter = counter;
    }

    public void accept(final RequestUserProfile request, final boolean agree, final int position) {
        ((!agree || this.isOutgoing) ? new FriendsDelete(request.uid) : new FriendsAdd(request.uid, null)).wrapProgress(getActivity()).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.friends.FriendRequestsFragment.4
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                Friends.decreaseRequests();
                if (FriendRequestsFragment.this.counter > 0) {
                    FriendRequestsFragment.access$710(FriendRequestsFragment.this);
                }
                if (request.isSuggesting) {
                    Friends.notifyCounterChanged(FriendRequestsFragment.this.counter, Friends.Request.SUGGEST);
                } else if (request.isOutgoing) {
                    Friends.notifyCounterChanged(FriendRequestsFragment.this.counter, Friends.Request.OUT);
                } else {
                    Friends.notifyCounterChanged(FriendRequestsFragment.this.counter, Friends.Request.IN);
                }
                if (result.intValue() != 0) {
                    request.sent = Boolean.valueOf(agree);
                }
                FriendRequestsFragment.this.mo1066getAdapter().notifyItemChanged(position);
            }
        }).exec((Context) getActivity());
    }

    public void openUserDetails(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    /* loaded from: classes2.dex */
    private class Adapter extends GridFragment<RequestUserProfile>.GridAdapter<FriendRequestHolder> implements DividerItemDecoration.Provider {
        private Adapter() {
            super();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public FriendRequestHolder mo1206onCreateViewHolder(ViewGroup parent, int type) {
            return new FriendRequestHolder(parent).attach(FriendRequestsFragment.this.mProfileListener, FriendRequestsFragment.this.mAcceptListener);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            UserProfile[] mutualFriends = ((RequestUserProfile) FriendRequestsFragment.this.data.get(position)).mutualFriends;
            return (mutualFriends == null ? 0 : mutualFriends.length) + 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return image == 0 ? ((RequestUserProfile) FriendRequestsFragment.this.data.get(position)).photo : ((RequestUserProfile) FriendRequestsFragment.this.data.get(position)).mutualFriends[image - 1].photo;
        }

        @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
        public boolean needDrawDividerAfter(int position) {
            return true;
        }
    }
}
