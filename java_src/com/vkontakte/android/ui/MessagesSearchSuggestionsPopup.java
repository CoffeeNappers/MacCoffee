package com.vkontakte.android.ui;

import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.text.Html;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.SearchIndexer;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesSearchDialogs;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class MessagesSearchSuggestionsPopup {
    private static SearchIndexer<DialogEntry> index = new SearchIndexer<>();
    private SuggestionsAdapter adapter;
    private boolean allowMsgs;
    private Context c;
    private android.widget.TextView emptyView;
    private android.widget.TextView footerView;
    private UsableRecyclerView list;
    private Runnable pendingSearch;
    private ProgressBar progress;
    private VKAPIRequest req;
    private SearchViewWrapper searchView;
    private DialogsFragment.SelectionListener selListener;
    private FrameLayout wrap;
    private ArrayList<UserProfile> users = new ArrayList<>();
    private VoidF1<UserProfile> onItemClickListener = MessagesSearchSuggestionsPopup$$Lambda$1.lambdaFactory$(this);

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(UserProfile p) {
        if (p != null) {
            if (this.selListener != null) {
                DialogEntry e = new DialogEntry();
                e.profile = p;
                this.selListener.onItemSelected(e);
                return;
            }
            new ChatFragment.Builder(p.uid, p.fullName).setPhoto(p.photo).go(this.c);
            ViewUtils.postDelayed(MessagesSearchSuggestionsPopup$$Lambda$4.lambdaFactory$(this), 1000L);
        } else if (this.searchView != null) {
            this.wrap.setVisibility(8);
            this.searchView.submitQuery();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0() {
        if (this.searchView != null) {
            this.searchView.setExpanded(false);
        }
    }

    public MessagesSearchSuggestionsPopup(SearchViewWrapper s, Context context, boolean allowMsgs) {
        this.allowMsgs = allowMsgs;
        this.searchView = s;
        this.c = context;
        this.list = new DropDownListView(context);
        this.list.setLayoutManager(new LinearLayoutManager(context));
        UsableRecyclerView usableRecyclerView = this.list;
        SuggestionsAdapter suggestionsAdapter = new SuggestionsAdapter();
        this.adapter = suggestionsAdapter;
        usableRecyclerView.setAdapter(suggestionsAdapter);
        this.list.setSelector(R.drawable.highlight);
        this.list.setClipToPadding(false);
        this.list.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.vkontakte.android.ui.MessagesSearchSuggestionsPopup.1
            CardItemDecoration mDecorator;
            int mLastWidth;

            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                int padding;
                boolean z = true;
                if (MessagesSearchSuggestionsPopup.this.list.getWidth() != this.mLastWidth) {
                    int scrW = MessagesSearchSuggestionsPopup.this.list.getResources().getConfiguration().screenWidthDp;
                    boolean isTabletDecorator = scrW >= 924;
                    if (this.mDecorator == null) {
                        if (isTabletDecorator) {
                            z = false;
                        }
                        this.mDecorator = new CardItemDecoration(null, z);
                        MessagesSearchSuggestionsPopup.this.list.addItemDecoration(this.mDecorator);
                    }
                    if (scrW >= 600) {
                        padding = V.dp(12.0f);
                    } else if (scrW >= 480) {
                        padding = V.dp(8.0f);
                    } else {
                        padding = 0;
                    }
                    int paddingTop = V.dp(8.0f) + padding;
                    int margin = isTabletDecorator ? V.dp(Math.max(16, ((scrW - 840) - 84) / 2)) : 0;
                    MessagesSearchSuggestionsPopup.this.list.setPadding(margin + padding, paddingTop, margin + padding, padding);
                    this.mDecorator.setPadding(padding, paddingTop, padding, padding);
                    this.mLastWidth = MessagesSearchSuggestionsPopup.this.list.getWidth();
                }
            }
        });
        this.footerView = new android.widget.TextView(context);
        this.footerView.setLayoutParams(new ViewGroup.LayoutParams(-1, V.dp(48.0f)));
        this.footerView.setBackgroundResource(R.drawable.highlight);
        this.footerView.setClickable(true);
        this.footerView.setMinHeight(V.dp(48.0f));
        this.footerView.setGravity(17);
        this.footerView.setTextSize(16.0f);
        this.footerView.setSingleLine();
        this.footerView.setEllipsize(TextUtils.TruncateAt.MIDDLE);
        this.footerView.setPadding(V.dp(12.0f), 0, V.dp(12.0f), 0);
        this.footerView.setTextColor(-11435592);
        this.footerView.setOnClickListener(MessagesSearchSuggestionsPopup$$Lambda$2.lambdaFactory$(this));
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.addView(this.footerView, new ViewGroup.LayoutParams(-1, V.dp(48.0f)));
        if (allowMsgs) {
            this.list.addFooterView(linearLayout);
        }
        this.list.onWindowFocusChanged(true);
        this.emptyView = new android.widget.TextView(this.c);
        this.emptyView.setTextAppearance(this.c, R.style.EmptyTextView);
        this.emptyView.setGravity(17);
        this.emptyView.setText(R.string.nothing_found);
        this.progress = new ProgressBar(this.c);
        this.progress.setVisibility(8);
        this.wrap = new FrameLayout(this.c);
        this.wrap.addView(this.list);
        this.wrap.addView(this.emptyView, new FrameLayout.LayoutParams(-2, -2, 17));
        this.wrap.addView(this.progress, new FrameLayout.LayoutParams(Global.scale(40.0f), Global.scale(40.0f), 17));
        this.wrap.setVisibility(8);
        this.emptyView.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2(View v) {
        this.onItemClickListener.f(null);
    }

    public void updateSearchIndex() {
        ArrayList<DialogEntry> dialogEntries = new ArrayList<>();
        Messages.getAllLoadedDialogs(dialogEntries);
        index.bind(dialogEntries).build();
    }

    public void setSelectionListener(DialogsFragment.SelectionListener sl) {
        this.selListener = sl;
    }

    public View getView() {
        return this.wrap;
    }

    public void updateQuery(String q) {
        int i = 1;
        int i2 = 8;
        Log.i("vk", "update query " + q);
        this.emptyView.setVisibility(8);
        this.progress.setVisibility(8);
        if (q.length() > 0) {
            this.footerView.setText(Html.fromHtml(this.c.getResources().getString(R.string.search_in_msgs, q.replace("<", "&lt;"))));
            this.users.clear();
            this.users.addAll(Friends.search(q));
            for (DialogEntry dialogEntry : index.search(q)) {
                if (!this.users.contains(dialogEntry.profile)) {
                    this.users.add(dialogEntry.profile);
                }
            }
            updateList();
            if (this.req != null) {
                this.req.cancel();
                this.req = null;
            }
            if (this.pendingSearch != null) {
                this.list.removeCallbacks(this.pendingSearch);
            }
            this.pendingSearch = MessagesSearchSuggestionsPopup$$Lambda$3.lambdaFactory$(this, q);
            ProgressBar progressBar = this.progress;
            int count = this.list.getCount();
            if (!this.allowMsgs) {
                i = 0;
            }
            if (count <= i) {
                i2 = 0;
            }
            progressBar.setVisibility(i2);
            this.list.postDelayed(this.pendingSearch, 1000L);
            if (this.wrap.getVisibility() != 0) {
                this.wrap.setVisibility(0);
                return;
            }
            return;
        }
        this.wrap.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: searchOnServer */
    public void lambda$updateQuery$3(String q) {
        this.req = new MessagesSearchDialogs(q).setCallback(new Callback<ArrayList<UserProfile>>() { // from class: com.vkontakte.android.ui.MessagesSearchSuggestionsPopup.2
            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<UserProfile> res) {
                int i = 8;
                MessagesSearchSuggestionsPopup.this.req = null;
                Iterator it = MessagesSearchSuggestionsPopup.this.users.iterator();
                while (it.hasNext()) {
                    UserProfile u = (UserProfile) it.next();
                    Iterator<UserProfile> it2 = res.iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            UserProfile u2 = it2.next();
                            if (u2.uid == u.uid) {
                                res.remove(u2);
                                break;
                            }
                        }
                    }
                }
                MessagesSearchSuggestionsPopup.this.users.addAll(res);
                MessagesSearchSuggestionsPopup.this.updateList();
                MessagesSearchSuggestionsPopup.this.progress.setVisibility(8);
                android.widget.TextView textView = MessagesSearchSuggestionsPopup.this.emptyView;
                if (MessagesSearchSuggestionsPopup.this.list.getCount() <= 0) {
                    i = 0;
                }
                textView.setVisibility(i);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                int i = 8;
                MessagesSearchSuggestionsPopup.this.req = null;
                MessagesSearchSuggestionsPopup.this.progress.setVisibility(8);
                android.widget.TextView textView = MessagesSearchSuggestionsPopup.this.emptyView;
                if (MessagesSearchSuggestionsPopup.this.list.getCount() <= 0) {
                    i = 0;
                }
                textView.setVisibility(i);
            }
        });
        this.req.exec((View) this.list);
        this.pendingSearch = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateList() {
        this.adapter.setData(this.users);
    }

    public boolean onKeyPreIme(int code, KeyEvent event) {
        if (this.wrap.getVisibility() == 0 && code == 4) {
            if (event.getAction() != 1) {
                return true;
            }
            this.wrap.setVisibility(8);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SuggestionsAdapter extends UsableRecyclerView.Adapter<UserHolder> {
        private List<UserProfile> users;

        private SuggestionsAdapter() {
            this.users = Collections.emptyList();
        }

        public void setData(List<UserProfile> users) {
            this.users = users == null ? Collections.emptyList() : new ArrayList<>(users);
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UserHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return UserHolder.simple(parent, R.layout.dialog_search_item).onClick(MessagesSearchSuggestionsPopup.this.onItemClickListener);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UserHolder holder, int position) {
            holder.bind(this.users.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.users.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return this.users.get(item).photo;
        }
    }

    /* loaded from: classes3.dex */
    private class DropDownListView extends UsableRecyclerView {
        public DropDownListView(Context context) {
            super(context);
        }

        @Override // android.view.View
        public boolean hasWindowFocus() {
            return true;
        }

        @Override // android.view.View
        public boolean isFocused() {
            return true;
        }

        @Override // android.view.ViewGroup, android.view.View
        public boolean hasFocus() {
            return true;
        }
    }
}
