package com.vk.music.attach.controller;

import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
/* loaded from: classes2.dex */
public abstract class SearchController extends Controller {
    private static final long SEARCH_DELAY = 400;
    private Handler handler = new Handler(Looper.getMainLooper());
    private Runnable searchCommand = SearchController$$Lambda$1.lambdaFactory$(this);
    private TextWatcher searchTextWatcher = new TextWatcher() { // from class: com.vk.music.attach.controller.SearchController.1
        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            SearchController.this.handler.removeCallbacks(SearchController.this.searchCommand);
            if (TextUtils.isGraphic(s)) {
                SearchController.this.handler.postDelayed(SearchController.this.searchCommand, SearchController.SEARCH_DELAY);
            } else {
                SearchController.this.onStopSearch();
            }
        }
    };

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void onStartSearch();

    protected abstract void onStopSearch();

    @Override // com.vk.music.attach.controller.Controller, android.support.v4.app.Fragment
    public void onResume() {
        super.onResume();
        getHostController().getSearchView().addTextChangedListener(this.searchTextWatcher);
    }

    @Override // com.vk.music.attach.controller.Controller, android.support.v4.app.Fragment
    public void onPause() {
        super.onPause();
        getHostController().getSearchView().removeTextChangedListener(this.searchTextWatcher);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.music.attach.controller.Controller
    public void onViewDetached() {
        super.onViewDetached();
        this.handler.removeCallbacks(this.searchCommand);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @NonNull
    public final String getSearchText() {
        return getHostController().getSearchView().getText().toString().trim();
    }

    protected final void setSearchText(@Nullable String text) {
        getHostController().getSearchView().setText(text);
    }
}
