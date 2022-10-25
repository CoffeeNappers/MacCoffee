package com.vk.sharing.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.view.MarginLayoutParamsCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.ViewAnimator;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.Screen;
import com.vk.sharing.action.ActionsInfo;
import com.vk.sharing.attachment.AttachmentViewHolder;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public final class SharingView extends ScrollView {
    private static final int CONTENT_CHILD_EMPTY = 2;
    private static final int CONTENT_CHILD_ERROR = 3;
    private static final int CONTENT_CHILD_LIST = 0;
    private static final int CONTENT_CHILD_PROGRESS = 1;
    private static final int FOOTER_CHILD_ACTIONS = 0;
    private static final int FOOTER_CHILD_CANCEL = 2;
    private static final int FOOTER_CHILD_SEND = 1;
    private static final int HEADER_CHILD_COMMON = 0;
    private static final int HEADER_CHILD_SEARCH = 1;
    @NonNull
    private final SharingActionsView actionsView;
    @NonNull
    private final TargetsAdapter adapter;
    boolean animating;
    @Nullable
    private View attachmentView;
    @Nullable
    private AttachmentViewHolder attachmentViewHolder;
    @NonNull
    private final View backButton;
    @NonNull
    private final View.OnClickListener backClickListener;
    @NonNull
    private final View bottomSheet;
    @Nullable
    private View cancelButton;
    @Nullable
    private EditText commentInputView;
    @NonNull
    private final ViewAnimator contentAnimator;
    @NonNull
    private final View contentContainer;
    @Nullable
    private TextView emptyView;
    @Nullable
    private TextView errorView;
    @NonNull
    private final ViewAnimator footerAnimator;
    @NonNull
    private final ViewAnimator headerAnimator;
    @NonNull
    private final RecyclerView list;
    private String predefinedComment;
    @Nullable
    Presenter presenter;
    @NonNull
    private final RecyclerView.OnScrollListener scrollListener;
    @NonNull
    private final View searchButton;
    @Nullable
    private View searchClearButton;
    @Nullable
    private EditText searchInputView;
    @NonNull
    private final TextWatcher searchInputWatcher;
    @Nullable
    private View sendButton;
    @Nullable
    private TextView sendButtonCounter;
    @NonNull
    private final View.OnClickListener sendClickListener;
    @NonNull
    private final LinearLayout sendContainer;
    @NonNull
    private final TextView subTitleView;
    @NonNull
    private List<Target> targets;
    @NonNull
    private final TextView titleView;
    private static final int HEADER_MARGIN_START_COMMON = Screen.dp(16);
    private static final int HEADER_MARGIN_START_BACK_BUTTON = Screen.dp(56);
    private static final int HEADER_MARGIN_END_SEARCH_INPUT_EMPTY = Screen.dp(4);
    private static final int HEADER_MARGIN_END_SEARCH_INPUT = Screen.dp(56);
    private static final int FOOTER_MARGIN_TOP_CONTENT = Screen.dp(0);
    private static final int FOOTER_MARGIN_TOP_NO_CONTENT = Screen.dp(8);
    private static final int FOOTER_MARGIN_START_ATTACHMENT = Screen.dp(16);
    private static final int FOOTER_MARGIN_TOP_ATTACHMENT = Screen.dp(8);

    /* loaded from: classes2.dex */
    public interface Presenter {
        void onActionClick(int i);

        void onBackClick();

        void onClearClick();

        void onListItemClick(@NonNull Target target, int i);

        void onListScrolledToTheEnd();

        void onOutsideClick();

        void onRetryClick();

        void onSearchClick();

        void onSearchInputChanged(@NonNull String str);

        void onSendClick();

        void onViewHidden();

        void onViewShown();
    }

    public SharingView(Context context) {
        this(context, null);
    }

    public SharingView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SharingView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.targets = new ArrayList(0);
        this.predefinedComment = null;
        setFillViewport(true);
        inflate(context, R.layout.layout_sharing_view, this);
        new KeyboardListener(this);
        this.bottomSheet = findViewById(R.id.sharing_bottom_sheet);
        int maxBottomSheetWidth = Screen.dp(512);
        if (getResources().getDisplayMetrics().widthPixels > maxBottomSheetWidth) {
            this.bottomSheet.getLayoutParams().width = maxBottomSheetWidth;
        }
        this.backButton = findViewById(R.id.sharing_back_button);
        this.searchButton = findViewById(R.id.sharing_search_button);
        this.headerAnimator = (ViewAnimator) findViewById(R.id.sharing_header_animator);
        this.titleView = (TextView) findViewById(R.id.sharing_title);
        this.subTitleView = (TextView) findViewById(R.id.sharing_subtitle);
        this.backClickListener = SharingView$$Lambda$1.lambdaFactory$(this);
        this.backButton.setOnClickListener(this.backClickListener);
        this.searchButton.setOnClickListener(SharingView$$Lambda$2.lambdaFactory$(this));
        this.searchInputWatcher = new TextWatcher() { // from class: com.vk.sharing.view.SharingView.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (SharingView.this.presenter != null) {
                    SharingView.this.presenter.onSearchInputChanged(s.toString());
                }
            }
        };
        this.contentContainer = findViewById(R.id.content);
        this.contentAnimator = (ViewAnimator) findViewById(R.id.content_animator);
        this.adapter = new TargetsAdapter();
        this.list = (RecyclerView) findViewById(R.id.targets_recycler);
        this.list.setAdapter(this.adapter);
        this.list.setHasFixedSize(true);
        findViewById(R.id.retry_button).setOnClickListener(SharingView$$Lambda$3.lambdaFactory$(this));
        final LinearLayoutManager targetsLayoutManager = (LinearLayoutManager) this.list.getLayoutManager();
        this.scrollListener = new RecyclerView.OnScrollListener() { // from class: com.vk.sharing.view.SharingView.2
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                if (targetsLayoutManager.findLastCompletelyVisibleItemPosition() == SharingView.this.targets.size() - 1 && SharingView.this.presenter != null) {
                    SharingView.this.presenter.onListScrolledToTheEnd();
                }
            }
        };
        findViewById(R.id.sharing_touch_outside).setOnClickListener(SharingView$$Lambda$4.lambdaFactory$(this));
        this.footerAnimator = (ViewAnimator) findViewById(R.id.sharing_footer_animator);
        this.actionsView = (SharingActionsView) findViewById(R.id.sharing_actions_container);
        this.actionsView.setListener(SharingView$$Lambda$5.lambdaFactory$(this));
        this.sendContainer = (LinearLayout) findViewById(R.id.sharing_send_container);
        this.sendClickListener = SharingView$$Lambda$6.lambdaFactory$(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View v) {
        onBackPressed();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(View v) {
        if (this.presenter != null) {
            this.presenter.onSearchClick();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2(View v) {
        if (this.presenter != null) {
            this.presenter.onRetryClick();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3(View v) {
        if (this.presenter != null) {
            this.presenter.onOutsideClick();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$4(int actionId) {
        if (this.presenter != null) {
            this.presenter.onActionClick(actionId);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5(View v) {
        if (this.presenter != null) {
            this.presenter.onSendClick();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.list.addOnScrollListener(this.scrollListener);
    }

    @Override // android.widget.ScrollView, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        this.list.removeOnScrollListener(this.scrollListener);
        super.onDetachedFromWindow();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onOpenedKeyboard(int keyboardHeight) {
        if (this.bottomSheet.getHeight() <= getHeight()) {
            this.bottomSheet.setTranslationY(keyboardHeight);
            this.bottomSheet.animate().translationYBy(-keyboardHeight).setInterpolator(AnimationUtils.decelerationCurve).setDuration(225L).withLayer().start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onHiddenKeyboard(int keyboardHeight) {
        this.bottomSheet.setTranslationY(-keyboardHeight);
        this.bottomSheet.animate().translationYBy(keyboardHeight).setInterpolator(AnimationUtils.standartCurve).setDuration(225L).withLayer().start();
    }

    public void onBackPressed() {
        if (this.presenter != null) {
            this.presenter.onBackClick();
        }
    }

    public void setPresenter(@Nullable Presenter presenter) {
        this.presenter = presenter;
    }

    public void setAttachmentViewHolder(@Nullable AttachmentViewHolder attachmentViewHolder) {
        this.attachmentViewHolder = attachmentViewHolder;
    }

    public void setActionsInfo(@NonNull ActionsInfo actionsInfo) {
        this.actionsView.setInfo(actionsInfo);
        if (actionsInfo.haveComment()) {
            this.predefinedComment = actionsInfo.getComment();
        }
    }

    public void setTargets(@NonNull List<Target> targets) {
        this.targets = targets;
        this.adapter.notifyDataSetChanged();
    }

    public void updateTargetAtPosition(int position) {
        this.adapter.onBindViewHolder((TargetViewHolder) this.list.mo1203findViewHolderForAdapterPosition(position), position);
    }

    public void show() {
        if (ViewCompat.isAttachedToWindow(this)) {
            animateShow();
        } else {
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.sharing.view.SharingView.3
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    SharingView.this.getViewTreeObserver().removeOnPreDrawListener(this);
                    SharingView.this.animateShow();
                    return false;
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void animateShow() {
        if (!isAnimating()) {
            this.animating = true;
            this.bottomSheet.setTranslationY(this.bottomSheet.getHeight());
            this.bottomSheet.animate().translationY(0.0f).setDuration(225L).setInterpolator(AnimationUtils.decelerationCurve).setListener(new AnimatorListenerAdapter() { // from class: com.vk.sharing.view.SharingView.4
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    SharingView.this.animating = false;
                    if (SharingView.this.presenter != null) {
                        SharingView.this.presenter.onViewShown();
                    }
                }
            }).withLayer().start();
        }
    }

    public void hide() {
        if (ViewCompat.isAttachedToWindow(this)) {
            animateHide();
        } else {
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.sharing.view.SharingView.5
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    SharingView.this.getViewTreeObserver().removeOnPreDrawListener(this);
                    SharingView.this.animateHide();
                    return false;
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void animateHide() {
        if (!isAnimating()) {
            this.animating = true;
            this.bottomSheet.animate().translationY(this.bottomSheet.getHeight()).setDuration(195L).setInterpolator(AnimationUtils.accelerationCurve).withLayer().setListener(new AnimatorListenerAdapter() { // from class: com.vk.sharing.view.SharingView.6
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    SharingView.this.animating = false;
                    if (SharingView.this.presenter != null) {
                        SharingView.this.presenter.onViewHidden();
                    }
                }
            }).start();
        }
    }

    public boolean isAnimating() {
        return this.animating;
    }

    public void showHeaderCommon() {
        this.headerAnimator.setDisplayedChild(0);
        if (this.searchInputView != null) {
            this.searchInputView.removeTextChangedListener(this.searchInputWatcher);
        }
    }

    public void showHeaderSearch() {
        this.headerAnimator.setDisplayedChild(1);
        if (this.searchInputView == null) {
            this.searchInputView = (EditText) findViewById(R.id.sharing_search_input);
            if (this.searchInputView == null) {
                return;
            }
        }
        this.searchInputView.removeTextChangedListener(this.searchInputWatcher);
        this.searchInputView.addTextChangedListener(this.searchInputWatcher);
        EditText editText = this.searchInputView;
        EditText editText2 = this.searchInputView;
        editText2.getClass();
        editText.post(SharingView$$Lambda$7.lambdaFactory$(editText2));
    }

    public void showHeaderBackButton() {
        this.backButton.setVisibility(0);
        changeHeaderAnimatorStartMargin(HEADER_MARGIN_START_BACK_BUTTON);
    }

    public void hideHeaderBackButton() {
        this.backButton.setVisibility(8);
        changeHeaderAnimatorStartMargin(HEADER_MARGIN_START_COMMON);
    }

    public void showHeaderSearchButton() {
        this.searchButton.setVisibility(0);
    }

    public void hideHeaderSearchButton() {
        this.searchButton.setVisibility(8);
    }

    private void changeHeaderAnimatorStartMargin(int margin) {
        ViewGroup.MarginLayoutParams layoutParams = (ViewGroup.MarginLayoutParams) this.headerAnimator.getLayoutParams();
        layoutParams.leftMargin = margin;
        MarginLayoutParamsCompat.setMarginStart(layoutParams, margin);
        this.headerAnimator.requestLayout();
    }

    public void showContent() {
        this.contentContainer.setVisibility(0);
        changeFooterAnimatorTopMargin(FOOTER_MARGIN_TOP_NO_CONTENT);
    }

    public void hideContent() {
        this.contentContainer.setVisibility(8);
        changeFooterAnimatorTopMargin(FOOTER_MARGIN_TOP_CONTENT);
    }

    private void changeFooterAnimatorTopMargin(int margin) {
        ViewGroup.MarginLayoutParams layoutParams = (ViewGroup.MarginLayoutParams) this.footerAnimator.getLayoutParams();
        layoutParams.topMargin = margin;
        this.footerAnimator.requestLayout();
    }

    public void showLoading() {
        this.contentAnimator.setDisplayedChild(1);
    }

    public void showList() {
        if (this.targets.size() == 0) {
            this.contentAnimator.setDisplayedChild(2);
        } else {
            this.contentAnimator.setDisplayedChild(0);
        }
    }

    public void showError() {
        this.contentAnimator.setDisplayedChild(3);
    }

    public void showFooterActions() {
        this.footerAnimator.setDisplayedChild(0);
    }

    public void hideFooter() {
        this.footerAnimator.setVisibility(8);
    }

    public void showFooterSend() {
        this.footerAnimator.setDisplayedChild(1);
        if (this.commentInputView == null) {
            this.commentInputView = (EditText) findViewById(R.id.sharing_comment_input);
            if (this.commentInputView == null) {
                return;
            }
        }
        if (this.predefinedComment != null && !this.predefinedComment.isEmpty()) {
            this.commentInputView.setText(this.predefinedComment);
            this.commentInputView.setEnabled(false);
        } else {
            EditText editText = this.commentInputView;
            EditText editText2 = this.commentInputView;
            editText2.getClass();
            editText.post(SharingView$$Lambda$8.lambdaFactory$(editText2));
        }
        if (this.sendButton == null) {
            this.sendButton = findViewById(R.id.sharing_send_button);
            this.sendButton.setOnClickListener(this.sendClickListener);
        }
    }

    public void showFooterCancel() {
        this.footerAnimator.setDisplayedChild(2);
        if (this.cancelButton == null) {
            this.cancelButton = findViewById(R.id.sharing_cancel_button);
            this.cancelButton.setOnClickListener(this.backClickListener);
        }
    }

    public void showFooterAttachments() {
        if (this.attachmentView == null) {
            if (this.attachmentViewHolder != null) {
                this.attachmentView = this.attachmentViewHolder.create(getContext(), this.sendContainer);
                if (this.attachmentView.getLayoutParams() == null) {
                    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
                    params.setMargins(FOOTER_MARGIN_START_ATTACHMENT, FOOTER_MARGIN_TOP_ATTACHMENT, 0, FOOTER_MARGIN_TOP_ATTACHMENT);
                    this.attachmentView.setLayoutParams(params);
                }
                this.sendContainer.addView(this.attachmentView, 1);
                return;
            }
            return;
        }
        this.attachmentView.setVisibility(0);
    }

    public void hideFooterAttachments() {
        if (this.attachmentView != null) {
            this.attachmentView.setVisibility(8);
        }
    }

    public boolean isSearchQueryEmpty() {
        return this.searchInputView == null || !TextUtils.isGraphic(this.searchInputView.getText());
    }

    public void setTitle(@Nullable String title) {
        if (TextUtils.isEmpty(title)) {
            this.titleView.setVisibility(8);
            return;
        }
        this.titleView.setVisibility(0);
        this.titleView.setText(title);
    }

    public void setSubtitle(@Nullable String subtitle) {
        if (TextUtils.isEmpty(subtitle)) {
            this.subTitleView.setVisibility(8);
            return;
        }
        this.subTitleView.setVisibility(0);
        this.subTitleView.setText(subtitle);
    }

    public void setSendButtonCount(int count) {
        if (this.sendButtonCounter == null) {
            this.sendButtonCounter = (TextView) findViewById(R.id.sharing_send_button_counter);
            if (this.sendButtonCounter == null) {
                return;
            }
        }
        if (count <= 1) {
            this.sendButtonCounter.setVisibility(8);
            return;
        }
        this.sendButtonCounter.setVisibility(0);
        this.sendButtonCounter.setText(String.valueOf(count));
    }

    public void setEmptyText(@NonNull String text) {
        if (this.emptyView == null) {
            this.emptyView = (TextView) findViewById(R.id.empty_text);
        }
        this.emptyView.setText(text);
    }

    public void showKeyboard() {
        View view = findFocus();
        if (view != null) {
            showKeyboard(view);
        } else {
            showKeyboard(this);
        }
    }

    private void showKeyboard(@NonNull View view) {
        ((InputMethodManager) getContext().getSystemService("input_method")).showSoftInput(view, 0);
    }

    public void hideKeyboard() {
        ((InputMethodManager) getContext().getSystemService("input_method")).hideSoftInputFromWindow(getWindowToken(), 0);
    }

    @NonNull
    public String getCommentText() {
        return this.commentInputView != null ? this.commentInputView.getText().toString() : "";
    }

    public void setSearchQuery(@Nullable String query) {
        if (this.searchInputView != null) {
            this.searchInputView.setText(query);
        }
    }

    public void setSearchHint(@Nullable String hint) {
        if (this.searchInputView != null) {
            this.searchInputView.setHint(hint);
        }
    }

    public void setErrorMessage(@Nullable String message) {
        if (this.errorView == null) {
            this.errorView = (TextView) findViewById(R.id.error_text);
        }
        this.errorView.setText(message);
    }

    public void showClearButton() {
        if (this.searchClearButton == null) {
            this.searchClearButton = findViewById(R.id.sharing_clear_button);
            if (this.searchClearButton != null) {
                this.searchClearButton.setOnClickListener(SharingView$$Lambda$9.lambdaFactory$(this));
            } else {
                return;
            }
        }
        this.searchClearButton.setVisibility(0);
        if (this.searchInputView != null) {
            changeSearchInputEndMargin(this.searchInputView, HEADER_MARGIN_END_SEARCH_INPUT);
            changeSearchInputEllipsize(this.searchInputView, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showClearButton$6(View v) {
        if (this.presenter != null) {
            this.presenter.onClearClick();
        }
    }

    public void hideClearButton() {
        if (this.searchClearButton != null) {
            this.searchClearButton.setVisibility(8);
            if (this.searchInputView != null) {
                changeSearchInputEndMargin(this.searchInputView, HEADER_MARGIN_END_SEARCH_INPUT_EMPTY);
                changeSearchInputEllipsize(this.searchInputView, TextUtils.TruncateAt.END);
            }
        }
    }

    private static void changeSearchInputEndMargin(@NonNull View v, int margin) {
        ViewGroup.MarginLayoutParams layoutParams = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
        layoutParams.rightMargin = margin;
        MarginLayoutParamsCompat.setMarginEnd(layoutParams, margin);
        v.requestLayout();
    }

    private static void changeSearchInputEllipsize(@NonNull TextView v, @Nullable TextUtils.TruncateAt truncateAt) {
        v.setEllipsize(truncateAt);
    }

    public void scrollListToStart() {
        this.list.smoothScrollToPosition(0);
    }

    public void enableSendFooter() {
        if (this.sendButton != null) {
            this.sendButton.setEnabled(true);
        }
        if (this.commentInputView != null) {
            this.commentInputView.setEnabled(true);
        }
    }

    public void disableSendFooter() {
        if (this.sendButton != null) {
            this.sendButton.setEnabled(false);
        }
        if (this.commentInputView != null) {
            this.commentInputView.setEnabled(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class TargetsAdapter extends RecyclerView.Adapter<TargetViewHolder> {
        private TargetsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public TargetViewHolder mo1206onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            return new TargetViewHolder(new TargetView(parent.getContext()));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(@NonNull TargetViewHolder holder, int position) {
            holder.bind((Target) SharingView.this.targets.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return SharingView.this.targets.size();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class TargetViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        @NonNull
        TargetView view;

        TargetViewHolder(@NonNull TargetView itemView) {
            super(itemView);
            this.view = itemView;
            this.view.setOnClickListener(this);
        }

        void bind(@Nullable Target target) {
            this.view.setTarget(target);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(@NonNull View v) {
            Target target = this.view.getTarget();
            int position = getAdapterPosition();
            if (target != null && position != -1 && SharingView.this.presenter != null) {
                SharingView.this.presenter.onListItemClick(target, position);
            }
        }
    }
}
