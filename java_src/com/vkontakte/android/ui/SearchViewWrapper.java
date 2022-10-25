package com.vkontakte.android.ui;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v4.view.MenuItemCompat;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.ActionMode;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.vk.attachpicker.AttachActivity;
import com.vk.stories.ShareStoryActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.utils.VoiceUtils;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class SearchViewWrapper {
    public static final int CONFIRM_TIMEOUT = 400;
    public static final int VOICE_RECOGNITION_RESULT = 20000;
    private View actionBtn;
    private Activity activity;
    private View clearBtn;
    private boolean collapseCalled;
    private Runnable confirmRunnable;
    private boolean expanded;
    private View focusView;
    private android.widget.EditText input;
    private SearchListener listener;
    private Menu menu;
    private MenuItem menuItem;
    private String newText;
    private boolean showVoiceOnEmpty;
    private ViewStateListener stateListener;
    private View view;
    private boolean[] visibilities;
    private View voiceBtn;
    private boolean wasExpanded;

    /* loaded from: classes3.dex */
    public interface SearchListener {
        void onQueryChanged(String str);

        void onQueryConfirmed(String str);

        void onQuerySubmitted(String str);
    }

    /* loaded from: classes3.dex */
    public interface ViewStateListener {
        void onViewExpansionStateChanged(boolean z);
    }

    private boolean shouldUseWhiteTheme() {
        return (this.activity instanceof AttachActivity) || (this.activity instanceof ShareStoryActivity);
    }

    public SearchViewWrapper(Activity act, SearchListener listener) {
        this(act, listener, CONFIRM_TIMEOUT);
    }

    public SearchViewWrapper(Activity act, SearchListener _listener, int timeout) {
        this.expanded = false;
        this.collapseCalled = false;
        this.wasExpanded = false;
        this.activity = act;
        this.listener = _listener;
        this.view = new FrameLayout(act) { // from class: com.vkontakte.android.ui.SearchViewWrapper.1
            @Override // android.widget.FrameLayout, android.view.View
            protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                super.onMeasure(View.MeasureSpec.getSize(widthMeasureSpec) | 1073741824, View.MeasureSpec.getSize(heightMeasureSpec) | 1073741824);
            }
        };
        ((ViewGroup) this.view).addView(View.inflate(new ContextThemeWrapper(act, shouldUseWhiteTheme() ? R.style.AttachTransparentTheme : R.style.ActionBarTheme), R.layout.toolbar_search_expanded, null));
        this.clearBtn = this.view.findViewById(R.id.search_clear);
        this.voiceBtn = this.view.findViewById(R.id.search_voice);
        this.actionBtn = this.view.findViewById(R.id.search_done);
        this.clearBtn.setOnClickListener(SearchViewWrapper$$Lambda$1.lambdaFactory$(this));
        this.voiceBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.SearchViewWrapper.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Intent intent = new Intent("android.speech.action.RECOGNIZE_SPEECH");
                intent.putExtra("android.speech.extra.LANGUAGE_MODEL", "free_form");
                intent.putExtra("android.speech.extra.MAX_RESULTS", 10);
                SearchViewWrapper.this.activity.startActivityForResult(intent, 20000);
            }
        });
        if (!VoiceUtils.voiceSearchAvailable()) {
            this.voiceBtn.setVisibility(8);
        }
        this.clearBtn.setVisibility(4);
        this.actionBtn.setVisibility(8);
        this.focusView = new View(act);
        this.focusView.setFocusable(true);
        this.focusView.setFocusableInTouchMode(true);
        ((ViewGroup) this.view).addView(this.focusView);
        this.input = (android.widget.EditText) this.view.findViewById(R.id.search_input);
        this.input.setTag(this);
        this.input.addTextChangedListener(new AnonymousClass3(timeout));
        this.input.setOnEditorActionListener(SearchViewWrapper$$Lambda$2.lambdaFactory$(this, act));
        this.input.setOnKeyListener(SearchViewWrapper$$Lambda$3.lambdaFactory$(this));
        if (Build.VERSION.SDK_INT < 23) {
            this.input.setCustomSelectionActionModeCallback(new ActionMode.Callback() { // from class: com.vkontakte.android.ui.SearchViewWrapper.4
                @Override // android.view.ActionMode.Callback
                public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public void onDestroyActionMode(ActionMode mode) {
                }
            });
        }
        if (shouldUseWhiteTheme()) {
            ImageView searchClear = (ImageView) getView().findViewById(R.id.search_clear);
            searchClear.setImageDrawable(new RecoloredDrawable(searchClear.getDrawable(), this.activity.getResources().getColor(R.color.attach_title)));
            ImageView searchVoice = (ImageView) getView().findViewById(R.id.search_voice);
            searchVoice.setImageDrawable(new RecoloredDrawable(searchVoice.getDrawable(), this.activity.getResources().getColor(R.color.attach_title)));
            android.widget.EditText searchEditText = (android.widget.EditText) getView().findViewById(R.id.search_input);
            searchEditText.setHintTextColor(Color.parseColor("#A8AAAD"));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View v) {
        clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.SearchViewWrapper$3  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass3 implements TextWatcher {
        private Runnable animation;
        private boolean lastHasText;
        final /* synthetic */ int val$timeout;

        AnonymousClass3(int i) {
            this.val$timeout = i;
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            int i = 0;
            boolean hasText = s.length() > 0;
            if (!SearchViewWrapper.this.showVoiceOnEmpty || !VoiceUtils.voiceSearchAvailable()) {
                View view = SearchViewWrapper.this.clearBtn;
                if (!hasText) {
                    i = 4;
                }
                V.setVisibilityAnimated(view, i);
            } else if (this.lastHasText != hasText) {
                this.lastHasText = hasText;
                ViewUtils.removeCallbacks(this.animation);
                if (hasText) {
                    V.setVisibilityAnimated(SearchViewWrapper.this.voiceBtn, 8);
                    this.animation = SearchViewWrapper$3$$Lambda$1.lambdaFactory$(this);
                    ViewUtils.postDelayed(this.animation, 300L);
                } else {
                    V.setVisibilityAnimated(SearchViewWrapper.this.clearBtn, 8);
                    this.animation = SearchViewWrapper$3$$Lambda$2.lambdaFactory$(this);
                    ViewUtils.postDelayed(this.animation, 300L);
                }
            }
            if (!hasText) {
                SearchViewWrapper.this.listener.onQuerySubmitted(null);
            }
            SearchViewWrapper.this.listener.onQueryChanged(s.toString());
            if (SearchViewWrapper.this.confirmRunnable != null) {
                SearchViewWrapper.this.input.removeCallbacks(SearchViewWrapper.this.confirmRunnable);
            }
            if (hasText) {
                SearchViewWrapper.this.confirmRunnable = SearchViewWrapper$3$$Lambda$3.lambdaFactory$(this, s);
                SearchViewWrapper.this.input.postDelayed(SearchViewWrapper.this.confirmRunnable, this.val$timeout);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$afterTextChanged$0() {
            V.setVisibilityAnimated(SearchViewWrapper.this.clearBtn, 0);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$afterTextChanged$1() {
            V.setVisibilityAnimated(SearchViewWrapper.this.voiceBtn, 0);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$afterTextChanged$2(Editable s) {
            SearchViewWrapper.this.listener.onQueryConfirmed(s.toString());
            SearchViewWrapper.this.confirmRunnable = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$new$1(Activity act, android.widget.TextView v, int actionId, KeyEvent event) {
        View focus = act.getCurrentFocus();
        if (focus != null) {
            InputMethodManager imm = (InputMethodManager) act.getSystemService("input_method");
            imm.hideSoftInputFromWindow(focus.getWindowToken(), 0);
            focus.clearFocus();
        }
        this.input.clearFocus();
        this.listener.onQuerySubmitted(v.getText().toString());
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$new$2(View v, int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            setExpanded(false);
            return true;
        }
        return false;
    }

    public View getView() {
        return this.view;
    }

    public void onCreateOptionsMenu(Menu menu) {
        Drawable drawable;
        this.menu = menu;
        MenuItem search = menu.add(R.string.search);
        search.setIcon(R.drawable.ic_menu_search);
        if (shouldUseWhiteTheme() && (drawable = search.getIcon()) != null) {
            drawable.mutate();
            drawable.setColorFilter(this.activity.getResources().getColor(R.color.attach_title), PorterDuff.Mode.SRC_ATOP);
        }
        search.setShowAsAction(10);
        search.setActionView(this.view);
        if (this.expanded) {
            search.expandActionView();
            this.input.clearFocus();
        }
        if (this.newText != null) {
            this.input.setText(this.newText);
            this.newText = null;
        }
        MenuItemCompat.setOnActionExpandListener(search, new AnonymousClass5(menu, search));
        this.menuItem = search;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.SearchViewWrapper$5  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass5 implements MenuItemCompat.OnActionExpandListener {
        final /* synthetic */ Menu val$menu;
        final /* synthetic */ MenuItem val$search;

        AnonymousClass5(Menu menu, MenuItem menuItem) {
            this.val$menu = menu;
            this.val$search = menuItem;
        }

        @Override // android.support.v4.view.MenuItemCompat.OnActionExpandListener
        public boolean onMenuItemActionExpand(MenuItem item) {
            SearchViewWrapper.this.wasExpanded = true;
            if (SearchViewWrapper.this.stateListener != null) {
                SearchViewWrapper.this.stateListener.onViewExpansionStateChanged(true);
            }
            SearchViewWrapper.this.input.requestFocus();
            SearchViewWrapper.this.input.post(SearchViewWrapper$5$$Lambda$1.lambdaFactory$(this));
            SearchViewWrapper.this.visibilities = new boolean[this.val$menu.size()];
            for (int i = 0; i < this.val$menu.size(); i++) {
                if (this.val$menu.getItem(i) != this.val$search) {
                    SearchViewWrapper.this.visibilities[i] = this.val$menu.getItem(i).isVisible();
                    this.val$menu.getItem(i).setVisible(false);
                }
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onMenuItemActionExpand$0() {
            InputMethodManager imm = (InputMethodManager) SearchViewWrapper.this.activity.getSystemService("input_method");
            imm.showSoftInput(SearchViewWrapper.this.input, 0);
        }

        @Override // android.support.v4.view.MenuItemCompat.OnActionExpandListener
        public boolean onMenuItemActionCollapse(MenuItem item) {
            SearchViewWrapper.this.wasExpanded = false;
            SearchViewWrapper.this.collapseCalled = true;
            if (SearchViewWrapper.this.stateListener != null) {
                SearchViewWrapper.this.stateListener.onViewExpansionStateChanged(false);
            }
            InputMethodManager imm = (InputMethodManager) SearchViewWrapper.this.activity.getSystemService("input_method");
            imm.hideSoftInputFromWindow(SearchViewWrapper.this.input.getWindowToken(), 0);
            SearchViewWrapper.this.clear();
            for (int i = 0; i < this.val$menu.size(); i++) {
                if (this.val$menu.getItem(i) != this.val$search && SearchViewWrapper.this.visibilities != null) {
                    this.val$menu.getItem(i).setVisible(SearchViewWrapper.this.visibilities[i]);
                }
            }
            return true;
        }
    }

    public void onVisibilityChanged(boolean visible) {
        if (visible && this.wasExpanded) {
            this.menuItem.expandActionView();
            this.input.clearFocus();
        }
    }

    public boolean isExpanded() {
        return this.expanded;
    }

    public void setExpanded(boolean expanded) {
        if (this.menuItem == null) {
            this.expanded = expanded;
        } else if (expanded) {
            this.menuItem.expandActionView();
        } else {
            this.menuItem.collapseActionView();
        }
    }

    public void setHint(String hint) {
        this.input.setHint(hint);
    }

    public void setText(String text) {
        this.input.setText(text);
        if (!TextUtils.isEmpty(text)) {
            this.input.setSelection(text.length());
        }
    }

    public void setTextAndSubmit(String text) {
        setText(text);
        this.listener.onQuerySubmitted(text);
    }

    public String getText() {
        return this.input.getText().toString();
    }

    public void clearFocus() {
        this.input.clearFocus();
        this.focusView.requestFocus();
    }

    public void setStateListener(ViewStateListener l) {
        this.stateListener = l;
    }

    public void clear() {
        setText("");
        this.listener.onQueryChanged("");
    }

    public void submitQuery() {
        if (!TextUtils.isEmpty(getText())) {
            this.input.post(SearchViewWrapper$$Lambda$4.lambdaFactory$(this));
            this.listener.onQuerySubmitted(getText());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$submitQuery$3() {
        InputMethodManager imm = (InputMethodManager) this.activity.getSystemService("input_method");
        imm.hideSoftInputFromWindow(this.input.getWindowToken(), 0);
        this.input.clearFocus();
    }

    public void setShowVoiceOnEmpty(boolean value) {
        this.showVoiceOnEmpty = value;
        updateVoiceButton();
    }

    public void setOnActionVisible(boolean visible) {
        this.actionBtn.setVisibility(visible ? 0 : 8);
    }

    public void setOnActionEnabled(boolean enabled) {
        this.actionBtn.setEnabled(enabled);
        this.actionBtn.setAlpha(enabled ? 1.0f : 0.39f);
    }

    public void setOnActionClickListener(View.OnClickListener listener) {
        this.actionBtn.setOnClickListener(listener);
    }

    private void updateVoiceButton() {
        if (VoiceUtils.voiceSearchAvailable()) {
            this.voiceBtn.setVisibility((!this.showVoiceOnEmpty || this.input.getText().length() != 0) ? 8 : 0);
        }
    }
}
