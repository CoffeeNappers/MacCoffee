package com.vk.music.view;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import com.vk.core.util.CollectionUtils;
import com.vk.core.util.DrawableUtils;
import com.vk.core.util.Resourcer;
import com.vk.core.util.Screen;
import com.vk.core.widget.LifecycleListener;
import com.vk.music.model.SearchSuggestionModel;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.ViewAdapter;
import com.vk.music.view.adapter.ViewRefs;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.Utils;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.views.UsableRecyclerView;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public final class SearchSuggestionContainer extends UsableRecyclerView implements SearchSuggestionModel.Callback {
    private static final int SEARCH_DELAY = 300;
    private static final int VIEW_TYPE_CAPTION_POPULAR = 3;
    private static final int VIEW_TYPE_CAPTION_RECENTS = 1;
    private static final int VIEW_TYPE_HINTS = 5;
    private static final int VIEW_TYPE_POPULAR = 4;
    private static final int VIEW_TYPE_RECENT = 2;
    private static final int VIEW_TYPE_SEARCH_ACTION = 6;
    final Activity activity;
    final MergeRecyclerAdapter adapter;
    final MergeRecyclerAdapter emptyAdapter;
    final ItemAdapter<String> hintsAdapter;
    Listener listener;
    LoadHintsCommand loadHintsCommand;
    final SearchSuggestionModel model;
    final ItemAdapter<String> popularAdapter;
    final ViewAdapter popularCaptionAdapter;
    TextView popularCaptionView;
    final ItemAdapter<String> recentsAdapter;
    final ViewAdapter recentsCaptionAdapter;
    final Resourcer resourcer;
    final ViewAdapter searchActionAdapter;
    TextView searchActionView;
    EditText searchInputView;
    final TextWatcher searchTextWatcher;
    final UserListener userListener;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface Listener {
        void onSearchRequested();
    }

    /* loaded from: classes2.dex */
    final class LoadHintsCommand implements Runnable {
        CharSequence query;

        LoadHintsCommand() {
        }

        LoadHintsCommand query(@NonNull CharSequence query) {
            this.query = query;
            return this;
        }

        @Override // java.lang.Runnable
        public void run() {
            SearchSuggestionContainer.this.model.loadHints(this.query.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class UserListener extends LifecycleListener implements View.OnClickListener, TextView.OnEditorActionListener {
        UserListener() {
        }

        public void onSearchClick() {
            CharSequence text = SearchSuggestionContainer.this.getSearchText();
            if (text != null && TextUtils.isGraphic(text)) {
                requestSearch(text.toString());
            }
        }

        public void onRecentOrPopularClick(@NonNull String s) {
            SearchSuggestionContainer.this.setSearchText(s, false);
            requestSearch(s);
        }

        public void onHintClick(@NonNull String s) {
            SearchSuggestionContainer.this.setSearchText(s, false);
            requestSearch(s);
        }

        public void onClearRecentsClick() {
            SearchSuggestionContainer.this.model.clearRecents();
            SearchSuggestionContainer.this.recentsAdapter.setItems(null);
            SearchSuggestionContainer.this.recentsCaptionAdapter.setEnabled(false);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
        }

        @Override // android.widget.TextView.OnEditorActionListener
        public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
            if (actionId == 3) {
                onSearchClick();
                return true;
            }
            return false;
        }

        private void requestSearch(@NonNull String query) {
            SearchSuggestionContainer.this.model.addRecent(query);
            if (SearchSuggestionContainer.this.listener != null) {
                SearchSuggestionContainer.this.listener.onSearchRequested();
            }
        }
    }

    public SearchSuggestionContainer(Context context, SearchSuggestionModel model) {
        super(context);
        this.activity = Utils.castToActivity(context);
        this.resourcer = Resourcer.of(this.activity);
        this.model = model;
        this.loadHintsCommand = new LoadHintsCommand();
        this.userListener = new UserListener();
        this.searchTextWatcher = new TextWatcher() { // from class: com.vk.music.view.SearchSuggestionContainer.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                SearchSuggestionContainer.this.removeCallbacks(SearchSuggestionContainer.this.loadHintsCommand);
                if (s.length() == 0) {
                    SearchSuggestionContainer.this.hintsAdapter.setItems(null);
                    SearchSuggestionContainer.this.setAdapter(SearchSuggestionContainer.this.emptyAdapter);
                    return;
                }
                SearchSuggestionContainer.this.setAdapter(SearchSuggestionContainer.this.adapter);
                SearchSuggestionContainer.this.postDelayed(SearchSuggestionContainer.this.loadHintsCommand.query(s), 300L);
            }
        };
        setPadding(0, Screen.dp(8), 0, Screen.dp(8));
        setClipToPadding(false);
        setLayoutManager(new LinearLayoutManager(this.activity));
        setHasFixedSize(true);
        ItemViewHolder.Builder.Init init = SearchSuggestionContainer$$Lambda$1.lambdaFactory$(this);
        ItemViewHolder.ClickListener<String> clickListener = SearchSuggestionContainer$$Lambda$2.lambdaFactory$(this);
        ItemViewHolder.Binder<String> binder = new ItemViewHolder.Binder<String>() { // from class: com.vk.music.view.SearchSuggestionContainer.2
            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            @NonNull
            public ViewRefs onCreate(@NonNull View itemView) {
                TextView text = (TextView) itemView;
                text.setTextColor(SearchSuggestionContainer.this.resourcer.color(R.color.music_blue_text_button));
                return new ViewRefs().put(text);
            }

            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            public void onBind(@NonNull ViewRefs refs, @NonNull String s, int position) {
                ((TextView) refs.next()).setText(s);
            }
        };
        LayoutInflater inflater = LayoutInflater.from(this.activity);
        this.recentsCaptionAdapter = new ViewAdapter(SearchSuggestionContainer$$Lambda$3.lambdaFactory$(this, inflater), 1);
        this.recentsAdapter = new ItemAdapter.Builder(inflater).layout(R.layout.music_search_suggestion_item).init(init).registerClickListener(clickListener).binder(binder).viewType(2).build();
        this.popularCaptionAdapter = new ViewAdapter(SearchSuggestionContainer$$Lambda$4.lambdaFactory$(this, inflater), SearchSuggestionContainer$$Lambda$5.lambdaFactory$(this, model), 3);
        this.popularAdapter = new ItemAdapter.Builder(inflater).layout(R.layout.music_search_suggestion_item).init(init).registerClickListener(clickListener).binder(binder).viewType(4).build();
        this.emptyAdapter = new MergeRecyclerAdapter();
        this.emptyAdapter.addAdapter(this.recentsCaptionAdapter);
        this.emptyAdapter.addAdapter(this.recentsAdapter);
        this.emptyAdapter.addAdapter(this.popularCaptionAdapter);
        this.emptyAdapter.addAdapter(this.popularAdapter);
        this.hintsAdapter = new ItemAdapter.Builder(inflater).layout(R.layout.music_search_suggestion_item).binder(new ItemViewHolder.Binder<String>() { // from class: com.vk.music.view.SearchSuggestionContainer.3
            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            @NonNull
            public ViewRefs onCreate(@NonNull View itemView) {
                return new ViewRefs().put(itemView);
            }

            @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
            public void onBind(@NonNull ViewRefs refs, @NonNull String s, int position) {
                ((TextView) refs.next()).setText(s);
            }
        }).registerClickListener(SearchSuggestionContainer$$Lambda$6.lambdaFactory$(this)).viewType(5).build();
        this.searchActionAdapter = new ViewAdapter(SearchSuggestionContainer$$Lambda$7.lambdaFactory$(this, inflater), SearchSuggestionContainer$$Lambda$8.lambdaFactory$(this), 6);
        this.adapter = new MergeRecyclerAdapter();
        this.adapter.addAdapter(this.hintsAdapter);
        this.adapter.addAdapter(this.searchActionAdapter);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View itemView) {
        ((TextView) itemView).setTextColor(this.resourcer.color(R.color.music_blue_text_button));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(View v, String s, int position) {
        this.userListener.onRecentOrPopularClick(s);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$new$3(LayoutInflater inflater, ViewGroup viewGroup) {
        View captionView = inflater.inflate(R.layout.music_caption_with_button, viewGroup, false);
        ((TextView) captionView.findViewById(R.id.caption_title)).setText(R.string.music_caption_recents);
        TextView captionButton = (TextView) captionView.findViewById(R.id.caption_button);
        captionButton.setText(R.string.music_button_clear);
        captionButton.setOnClickListener(SearchSuggestionContainer$$Lambda$10.lambdaFactory$(this));
        return captionView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$2(View v) {
        this.userListener.onClearRecentsClick();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$new$4(LayoutInflater inflater, ViewGroup viewGroup) {
        this.popularCaptionView = (TextView) inflater.inflate(R.layout.music_caption, viewGroup, false);
        this.popularCaptionView.setText(R.string.music_caption_popular);
        return this.popularCaptionView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5(SearchSuggestionModel model) {
        DrawableUtils.setLeft(this.popularCaptionView, CollectionUtils.isEmpty(model.getRecents()) ? 0 : R.drawable.music_divider_1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$6(View v, String s, int position) {
        this.userListener.onHintClick(s);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ View lambda$new$8(LayoutInflater inflater, ViewGroup viewGroup) {
        this.searchActionView = (TextView) inflater.inflate(R.layout.music_search_suggestion_item, viewGroup, false);
        this.searchActionView.setTextColor(this.resourcer.color(R.color.music_blue_text_button));
        this.searchActionView.setOnClickListener(SearchSuggestionContainer$$Lambda$9.lambdaFactory$(this));
        return this.searchActionView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$7(View v) {
        this.userListener.onSearchClick();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$9() {
        this.searchActionView.setText(this.resourcer.str(R.string.music_search_for, getSearchText()));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.model.subscribe(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.model.unsubscribe(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void attach(@NonNull EditText inputView) {
        this.searchInputView = inputView;
        this.searchInputView.setImeOptions(3);
        this.searchInputView.setOnEditorActionListener(this.userListener);
        this.searchInputView.removeTextChangedListener(this.searchTextWatcher);
        this.searchInputView.addTextChangedListener(this.searchTextWatcher);
        bind();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void detach() {
        if (this.searchInputView != null) {
            this.searchInputView.removeTextChangedListener(this.searchTextWatcher);
            this.searchInputView = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setListener(@Nullable Listener listener) {
        this.listener = listener;
    }

    private void bind() {
        boolean z = true;
        CharSequence query = getSearchText();
        if (TextUtils.isEmpty(query)) {
            if (mo1204getAdapter() == null || mo1204getAdapter() != this.emptyAdapter) {
                setAdapter(this.emptyAdapter);
            }
            List<String> recents = this.model.getRecents();
            this.recentsCaptionAdapter.setEnabled(!CollectionUtils.isEmpty(recents));
            this.recentsAdapter.setItems(recents);
            List<String> popular = this.model.getPopular();
            if (popular == null) {
                this.popularCaptionAdapter.setEnabled(false);
                this.model.loadPopular();
                return;
            }
            ViewAdapter viewAdapter = this.popularCaptionAdapter;
            if (CollectionUtils.isEmpty(popular)) {
                z = false;
            }
            viewAdapter.setEnabled(z);
            this.popularAdapter.setItems(popular);
            return;
        }
        if (mo1204getAdapter() == null || mo1204getAdapter() != this.adapter) {
            setAdapter(this.adapter);
        }
        List<String> hints = this.model.getHints();
        if (hints == null) {
            this.model.loadHints(query.toString());
        } else {
            this.hintsAdapter.setItems(hints);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public CharSequence getSearchText() {
        if (this.searchInputView != null) {
            return this.searchInputView.getText();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSearchText(@Nullable String text, boolean ignoreSearch) {
        if (this.searchInputView != null) {
            if (ignoreSearch) {
                this.searchInputView.removeTextChangedListener(this.searchTextWatcher);
            }
            this.searchInputView.setText(text);
            this.searchInputView.setSelection(this.searchInputView.length());
            if (ignoreSearch) {
                this.searchInputView.addTextChangedListener(this.searchTextWatcher);
            }
        }
    }

    @Override // com.vk.music.model.SearchSuggestionModel.Callback
    public void onRecentsChanged(@NonNull SearchSuggestionModel model) {
        bind();
    }

    @Override // com.vk.music.model.SearchSuggestionModel.Callback
    public void onPopularLoadingDone(@NonNull SearchSuggestionModel model) {
        bind();
    }

    @Override // com.vk.music.model.SearchSuggestionModel.Callback
    public void onPopularLoadingError(@NonNull SearchSuggestionModel model, @NonNull String reason) {
    }

    @Override // com.vk.music.model.SearchSuggestionModel.Callback
    public void onHintsLoadingDone(@NonNull SearchSuggestionModel model) {
        bind();
    }

    @Override // com.vk.music.model.SearchSuggestionModel.Callback
    public void onHintsLoadingError(@NonNull SearchSuggestionModel model, @NonNull String reason) {
    }
}
