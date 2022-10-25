package com.vkontakte.android.fragments.news;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.media.TransportMediator;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.polls.PollsCreate;
import com.vkontakte.android.api.polls.PollsEdit;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import me.grishka.appkit.fragments.ContainerFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class PollEditorFragment extends ContainerFragment implements TextWatcher, View.OnClickListener, BackListener {
    private List<PollAttachment.Answer> editOptions;
    View mAddButton;
    Switch mAnonymousSwitch;
    View mAnonymousWrap;
    Drawable mDoneDrawable;
    MenuItem mDoneItem;
    ViewGroup mOptionsRoot;
    int mOwnerId;
    PollAttachment mPoll;
    ViewGroup mRootView;
    TextView mTitle;
    private List<PollAttachment.Answer> origEditOptions;
    boolean mDoneEnabled = false;
    boolean mSkipFrame = false;
    int mPreviousHeight = -1;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        private Builder() {
            super(PollEditorFragment.class, new TabletDialogActivity.Builder().setGravity(17).setInputMode(16).setMaxWidth(V.dp(720.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443));
        }

        Builder setOwnerId(int ownerId) {
            this.args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, ownerId);
            return this;
        }

        public Builder attachPoll(PollAttachment poll) {
            this.args.putParcelable("poll", poll);
            return this;
        }
    }

    public static Builder create(int ownerId) {
        return new Builder().setOwnerId(ownerId);
    }

    public static Builder edit(PollAttachment poll) {
        return new Builder().attachPoll(poll);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        this.mPoll = (PollAttachment) getArguments().getParcelable("poll");
        this.mOwnerId = getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID);
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.poll_edit, container, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(this.mPoll != null ? R.string.poll_edit : R.string.poll_create);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        this.mAddButton = view.findViewById(R.id.poll_option_add);
        this.mAddButton.setOnClickListener(this);
        this.mOptionsRoot = (ViewGroup) view.findViewById(R.id.poll_options_container);
        this.mRootView = (ViewGroup) view.findViewById(R.id.poll_edit_scroll);
        this.mTitle = (TextView) view.findViewById(R.id.poll_question);
        this.mTitle.addTextChangedListener(this);
        this.mAnonymousWrap = view.findViewById(R.id.poll_anonym_wrap);
        this.mAnonymousSwitch = (Switch) view.findViewById(R.id.poll_anonym_switch);
        updateDecorator();
        if (this.mPoll != null) {
            this.mAnonymousWrap.setVisibility(8);
            loadPoll();
        } else {
            addOptionRow(null);
            addOptionRow(null);
        }
        initAnimation();
    }

    private void loadPoll() {
        this.editOptions = new ArrayList();
        this.editOptions.addAll(this.mPoll.answers);
        this.origEditOptions = new ArrayList();
        this.origEditOptions.addAll(this.mPoll.answers);
        ArrayList<PollAttachment.Answer> answers = this.mPoll.answers;
        for (int i = 0; i < answers.size(); i++) {
            PollAttachment.Answer answer = answers.get(i);
            addOptionRow(answer.text);
        }
        this.mTitle.setText(this.mPoll.question);
        initAnimation();
    }

    private void initAnimation() {
        LayoutTransition lt = new LayoutTransition();
        lt.setStartDelay(1, lt.getDuration(3) / 3);
        lt.setStartDelay(2, lt.getDuration(0) / 2);
        this.mOptionsRoot.getViewTreeObserver().addOnPreDrawListener(PollEditorFragment$$Lambda$1.lambdaFactory$(this));
        lt.addTransitionListener(new LayoutTransition.TransitionListener() { // from class: com.vkontakte.android.fragments.news.PollEditorFragment.1
            @Override // android.animation.LayoutTransition.TransitionListener
            public void startTransition(LayoutTransition transition, ViewGroup container, View view, int transitionType) {
                if (container == PollEditorFragment.this.mOptionsRoot && transitionType == 3) {
                    PollEditorFragment.this.mSkipFrame = true;
                } else {
                    PollEditorFragment.this.mAnonymousWrap.setTranslationY(PollEditorFragment.this.mOptionsRoot.getHeight() - PollEditorFragment.this.mOptionsRoot.getMeasuredHeight());
                }
            }

            @Override // android.animation.LayoutTransition.TransitionListener
            public void endTransition(LayoutTransition transition, ViewGroup container, View view, int transitionType) {
            }
        });
        this.mOptionsRoot.setLayoutTransition(lt);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$initAnimation$0() {
        int h = this.mOptionsRoot.getHeight();
        if (this.mSkipFrame) {
            this.mSkipFrame = false;
            h = this.mPreviousHeight;
        } else {
            this.mPreviousHeight = h;
        }
        this.mAnonymousWrap.setTranslationY(h - this.mOptionsRoot.getMeasuredHeight());
        return true;
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        this.mDoneItem = menu.add(0, R.id.done, 0, R.string.done);
        MenuItem menuItem = this.mDoneItem;
        Drawable drawable = getResources().getDrawable(R.drawable.ic_check_24dp);
        this.mDoneDrawable = drawable;
        menuItem.setIcon(drawable).setShowAsAction(2);
        this.mDoneItem.setEnabled(this.mDoneEnabled);
        this.mDoneDrawable.setAlpha(this.mDoneEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.done) {
            onDone();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.poll_option_add /* 2131756218 */:
                addOptionRow(null);
                return;
            case R.id.poll_option_remove /* 2131756223 */:
                if (this.mOptionsRoot.getChildCount() >= 3) {
                    this.mOptionsRoot.removeView((View) v.getParent());
                    int index = ((Integer) v.getTag()).intValue();
                    if (this.editOptions != null && index < this.editOptions.size()) {
                        this.editOptions.remove(index);
                    }
                    updateAddButton();
                    updateDoneButton();
                    updateRemoveButtons();
                    return;
                }
                return;
            default:
                return;
        }
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        boolean changed;
        if (this.mPoll == null) {
            changed = this.mTitle.getText().toString().trim().length() > 0;
            for (int i = 1; i < this.mOptionsRoot.getChildCount() - 1; i++) {
                View child = this.mOptionsRoot.getChildAt(i);
                changed |= ((TextView) child.findViewById(R.id.poll_option_text)).getText().toString().trim().length() > 0;
            }
        } else {
            changed = (!this.mTitle.getText().toString().equals(this.mPoll.question)) | (this.mOptionsRoot.getChildCount() + (-2) != this.mPoll.answers.size());
            if (!changed) {
                for (int i2 = 1; i2 < this.mOptionsRoot.getChildCount() - 1; i2++) {
                    View child2 = this.mOptionsRoot.getChildAt(i2);
                    changed |= !((TextView) child2.findViewById(R.id.poll_option_text)).getText().toString().equals(this.mPoll.answers.get(i2 + (-1)).text);
                }
            }
        }
        if (changed) {
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.confirm_close_post_edit).setPositiveButton(R.string.delete, PollEditorFragment$$Lambda$2.lambdaFactory$(this)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBackPressed$1(DialogInterface dialog, int which) {
        getActivity().finish();
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
        updateDoneButton();
    }

    void updateRemoveButtons() {
        for (int i = 1; i < this.mOptionsRoot.getChildCount() - 1; i++) {
            this.mOptionsRoot.getChildAt(i).findViewById(R.id.poll_option_remove).setVisibility(this.mOptionsRoot.getChildCount() >= 4 ? 0 : 8);
        }
    }

    void updateAddButton() {
        this.mAddButton.setVisibility(this.mOptionsRoot.getChildCount() < 12 ? 0 : 8);
    }

    void addOptionRow(@Nullable CharSequence text) {
        View opt = getActivity().getLayoutInflater().inflate(R.layout.poll_edit_option, this.mOptionsRoot, false);
        opt.findViewById(R.id.poll_option_remove).setTag(Integer.valueOf(this.mOptionsRoot.getChildCount() - 2));
        opt.findViewById(R.id.poll_option_remove).setOnClickListener(this);
        ((TextView) opt.findViewById(R.id.poll_option_text)).setText(text);
        ((TextView) opt.findViewById(R.id.poll_option_text)).addTextChangedListener(this);
        this.mOptionsRoot.addView(opt, this.mOptionsRoot.getChildCount() - 1);
        ((ViewGroup) opt).getLayoutTransition().setAnimateParentHierarchy(false);
        updateAddButton();
        updateDoneButton();
        updateRemoveButtons();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateDecorator();
    }

    void updateDecorator() {
        for (int i = 0; i < this.mRootView.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = this.mRootView.getChildAt(i);
            ViewUtils.setBackgroundWithViewPadding(c, bg);
        }
        int pad = this.scrW >= 924 ? V.dp(32.0f) : 0;
        this.mRootView.setPadding(pad, 0, pad, 0);
    }

    void updateDoneButton() {
        boolean z = true;
        boolean disable = this.mTitle.getText().toString().trim().length() == 0;
        for (int i = 1; i < this.mOptionsRoot.getChildCount() - 1; i++) {
            View child = this.mOptionsRoot.getChildAt(i);
            disable |= ((TextView) child.findViewById(R.id.poll_option_text)).getText().toString().trim().length() == 0;
        }
        if (disable) {
            z = false;
        }
        enableDone(z);
    }

    void enableDone(boolean enable) {
        if (enable != this.mDoneEnabled) {
            this.mDoneEnabled = enable;
            if (this.mDoneDrawable != null) {
                this.mDoneDrawable.setAlpha(this.mDoneEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
            }
            if (this.mDoneItem != null) {
                this.mDoneItem.setEnabled(this.mDoneEnabled);
            }
        }
    }

    void onDone() {
        if (this.mPoll == null) {
            List<String> options = new ArrayList<>();
            for (int i = 1; i < this.mOptionsRoot.getChildCount() - 1; i++) {
                View child = this.mOptionsRoot.getChildAt(i);
                options.add(((TextView) child.findViewById(R.id.poll_option_text)).getText().toString());
            }
            new PollsCreate(this.mTitle.getText().toString(), options, this.mOwnerId, this.mAnonymousSwitch.isChecked()).setCallback(new SimpleCallback<PollAttachment>(this) { // from class: com.vkontakte.android.fragments.news.PollEditorFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(PollAttachment poll) {
                    Intent result = new Intent();
                    result.putExtra("poll", poll);
                    PollEditorFragment.this.getActivity().setResult(-1, result);
                    PollEditorFragment.this.getActivity().finish();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
            return;
        }
        ArrayList<Integer> remove = new ArrayList<>();
        ArrayList<String> add = new ArrayList<>();
        HashMap<String, String> edit = new HashMap<>();
        for (int i2 = 1; i2 < this.mOptionsRoot.getChildCount() - 1; i2++) {
            View child2 = this.mOptionsRoot.getChildAt(i2);
            String text = ((TextView) child2.findViewById(R.id.poll_option_text)).getText().toString();
            if (i2 - 1 < this.editOptions.size()) {
                PollAttachment.Answer answer = this.editOptions.get(i2 - 1);
                if (!answer.text.equals(text)) {
                    edit.put(String.valueOf(answer.id), text);
                }
            } else {
                add.add(text);
            }
        }
        for (int i3 = 0; i3 < this.origEditOptions.size(); i3++) {
            PollAttachment.Answer answer2 = this.origEditOptions.get(i3);
            if (!this.editOptions.contains(answer2)) {
                remove.add(Integer.valueOf(answer2.id));
            }
        }
        final String question = this.mTitle.getText().toString();
        new PollsEdit(this.mPoll.oid, this.mPoll.pid, question.equals(this.mPoll.question) ? null : question, add, remove, edit).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.news.PollEditorFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                PollEditorFragment.this.mPoll.question = question;
                Intent result = new Intent();
                result.putExtra("poll", PollEditorFragment.this.mPoll);
                PollEditorFragment.this.getActivity().setResult(-1, result);
                PollEditorFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }
}
