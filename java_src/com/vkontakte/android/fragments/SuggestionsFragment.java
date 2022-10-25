package com.vkontakte.android.fragments;

import android.app.DialogFragment;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.execute.SetSubscriptionStatus;
import com.vkontakte.android.ui.ErrorView;
import com.vkontakte.android.ui.Fonts;
import java.util.ArrayList;
import me.grishka.appkit.preloading.PrefetchInfoProvider;
@Deprecated
/* loaded from: classes.dex */
public abstract class SuggestionsFragment extends DialogFragment {
    private BaseAdapter adapter;
    private ErrorView error;
    protected ListView list;
    protected ProgressBar progress;
    private View view;
    protected ArrayList<UserProfile> users = new ArrayList<>();
    private boolean firstLoad = true;
    private boolean needUpdateFriends = false;
    private boolean needUpdateGroups = false;

    protected abstract String getListTitle();

    protected abstract void loadData();

    protected abstract void onItemClick(int i, long j, Object obj);

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        loadData();
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        FrameLayout wrap = new FrameLayout(getActivity());
        this.list = new ListView(getActivity());
        String listTitle = getListTitle();
        if (listTitle != null) {
            TextView txt = new TextView(getActivity());
            txt.setTextColor(-8815488);
            txt.setTextSize(1, 16.0f);
            txt.setTypeface(Fonts.getRobotoLight());
            txt.setText(listTitle);
            txt.setShadowLayer(Global.scale(0.5f), 0.0f, 1.0f, -1);
            txt.setPadding(Global.scale(12.0f), Global.scale(15.0f), Global.scale(12.0f), Global.scale(10.0f));
            this.list.addHeaderView(txt, null, false);
        }
        this.adapter = getAdapter();
        this.list.setAdapter((ListAdapter) this.adapter);
        this.list.setDividerHeight(0);
        this.list.setSelector(new ColorDrawable(0));
        this.list.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.vkontakte.android.fragments.SuggestionsFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int pos, long id) {
                SuggestionsFragment.this.onItemClick(pos, id, SuggestionsFragment.this.list.getItemAtPosition(pos));
            }
        });
        this.list.setCacheColorHint(getResources().getColor(R.color.cards_bg));
        wrap.addView(this.list);
        wrap.setBackgroundColor(getResources().getColor(R.color.cards_bg));
        this.error = (ErrorView) inflater.inflate(R.layout.error, (ViewGroup) null);
        this.error.setVisibility(8);
        wrap.addView(this.error);
        this.error.setOnRetryListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SuggestionsFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                SuggestionsFragment.this.error.setVisibility(8);
                SuggestionsFragment.this.progress.setVisibility(0);
                SuggestionsFragment.this.loadData();
            }
        });
        this.progress = new ProgressBar(getActivity());
        wrap.addView(this.progress, new FrameLayout.LayoutParams(Global.scale(40.0f), Global.scale(40.0f), 17));
        if (this.list.getCount() - this.list.getHeaderViewsCount() == 0 && this.firstLoad) {
            this.list.setVisibility(8);
        } else {
            this.progress.setVisibility(8);
        }
        this.view = wrap;
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onError(int code, String msg) {
        if (this.error != null) {
            this.error.setErrorInfo(code, msg);
            ViewUtils.setVisibilityAnimated(this.error, 0);
            ViewUtils.setVisibilityAnimated(this.progress, 8);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.view = null;
        this.adapter = null;
        this.list = null;
        this.progress = null;
        this.error = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateList() {
        if (this.adapter != null) {
            this.adapter.notifyDataSetChanged();
        }
        if (this.list != null) {
            Log.i("vk", "items=" + (this.list.getCount() - this.list.getHeaderViewsCount()));
            if (this.firstLoad && this.list != null && this.progress != null && this.list.getCount() - this.list.getHeaderViewsCount() > 0) {
                ViewUtils.setVisibilityAnimated(this.list, 0);
                ViewUtils.setVisibilityAnimated(this.progress, 8);
                this.firstLoad = false;
            }
        }
    }

    protected void onSubscribeClick(int pos) {
        final boolean needSubscribe;
        final UserProfile p = this.users.get(pos);
        if (p.online != 2 && p.online != -2) {
            if (p.online == 0) {
                p.online = 2;
                this.adapter.notifyDataSetChanged();
                needSubscribe = true;
            } else {
                p.online = -2;
                this.adapter.notifyDataSetChanged();
                needSubscribe = false;
            }
            SetSubscriptionStatus.createSetSubscriptionStatusAndSendAllStats(p.uid, needSubscribe).setCallback(new SimpleCallback<Integer>(getActivity()) { // from class: com.vkontakte.android.fragments.SuggestionsFragment.3
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer result) {
                    p.online = needSubscribe ? 1 : 0;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse err) {
                    p.online = needSubscribe ? 0 : 1;
                    if (SuggestionsFragment.this.adapter != null) {
                        SuggestionsFragment.this.adapter.notifyDataSetChanged();
                    }
                    super.fail(err);
                }
            }).exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public BaseAdapter getAdapter() {
        return new UsersAdapter();
    }

    protected PrefetchInfoProvider getImageLoaderAdapter() {
        return new UserPhotosAdapter();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public class UsersAdapter extends BaseAdapter {
        /* JADX INFO: Access modifiers changed from: protected */
        public UsersAdapter() {
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return SuggestionsFragment.this.users.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return SuggestionsFragment.this.users.get(position);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return SuggestionsFragment.this.users.get(position).uid;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            boolean added;
            boolean z = true;
            View view = convertView;
            if (view == null) {
                view = View.inflate(SuggestionsFragment.this.getActivity(), R.layout.suggest_list_item, null);
                ((TextView) view.findViewById(R.id.flist_item_subtext)).setTypeface(Fonts.getRobotoLight());
                view.findViewById(R.id.flist_item_online).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SuggestionsFragment.UsersAdapter.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        int p = ((Integer) v.getTag()).intValue();
                        SuggestionsFragment.this.onSubscribeClick(p);
                    }
                });
            }
            if (position == 0) {
                view.setBackgroundResource(R.drawable.bg_post_comments_top);
            } else if (position == SuggestionsFragment.this.users.size() - 1) {
                view.setBackgroundResource(R.drawable.bg_post_comments_btm);
            } else {
                view.setBackgroundResource(R.drawable.bg_post_comments_mid);
            }
            UserProfile u = SuggestionsFragment.this.users.get(position);
            ((TextView) view.findViewById(R.id.flist_item_text)).setText(u.fullName);
            ((TextView) view.findViewById(R.id.flist_item_subtext)).setText(u.university);
            ((VKImageView) view.findViewById(R.id.flist_item_photo)).setPlaceholderImage(u.uid < 0 ? R.drawable.group_placeholder : R.drawable.user_placeholder);
            ((VKImageView) view.findViewById(R.id.flist_item_photo)).load(u.photo);
            view.findViewById(R.id.flist_item_online).setTag(Integer.valueOf(position));
            if (u.online == 0) {
                added = u.isFriend;
            } else {
                added = u.online > 0;
            }
            ((ImageView) view.findViewById(R.id.flist_item_online)).setImageResource((added || u.isFriend) ? R.drawable.ic_suggest_added : R.drawable.ic_suggest_add);
            View findViewById = view.findViewById(R.id.flist_item_online);
            if (u.isFriend) {
                z = false;
            }
            findViewById.setEnabled(z);
            return view;
        }
    }

    /* loaded from: classes2.dex */
    protected class UserPhotosAdapter implements PrefetchInfoProvider {
        protected UserPhotosAdapter() {
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getItemCount() {
            return SuggestionsFragment.this.users.size();
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return 1;
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return SuggestionsFragment.this.users.get(item).photo;
        }
    }
}
