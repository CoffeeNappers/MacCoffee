package com.vkontakte.android.ui.controllers;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.text.SpannableStringBuilder;
import android.text.style.ImageSpan;
import android.view.View;
import com.vk.sharing.target.GroupsForCommentsImpersonation;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.TextView;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ReplyBarController {
    private Delegate delegate;
    private int ownerId;
    private View replyBarView;
    private boolean restrictToCurrentGroup;
    private TextView textViewFrom;
    private TextView textViewTo;
    private String replyToName = "";
    private String fromName = "";
    private boolean fromYourName = false;

    /* loaded from: classes3.dex */
    public interface Delegate {
        void onTextFromClick();

        void onTextToReset();

        void onViewVisibilityChanged(int i);
    }

    public ReplyBarController(final View replyBarView, int ownerId, boolean restrictToCurrentGroup, final Delegate delegate) {
        this.replyBarView = replyBarView;
        this.ownerId = ownerId;
        this.restrictToCurrentGroup = restrictToCurrentGroup;
        replyBarView.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.ui.controllers.ReplyBarController.1
            @Override // android.view.View.OnLayoutChangeListener
            public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                Log.i("ReplyBarController", "onLayoutChange");
                replyBarView.post(new Runnable() { // from class: com.vkontakte.android.ui.controllers.ReplyBarController.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ReplyBarController.this.updateMaxWidth();
                    }
                });
            }
        });
        this.delegate = delegate;
        this.textViewTo = (TextView) replyBarView.findViewById(R.id.to);
        this.textViewFrom = (TextView) replyBarView.findViewById(R.id.from);
        this.textViewTo.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.controllers.ReplyBarController.2
            @Override // android.view.View.OnClickListener
            public void onClick(View o) {
                ReplyBarController.this.setReplyToName("");
                delegate.onTextToReset();
            }
        });
        this.textViewFrom.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.controllers.ReplyBarController.3
            @Override // android.view.View.OnClickListener
            public void onClick(View o) {
                delegate.onTextFromClick();
            }
        });
        replyBarView.setVisibility(8);
        initReplyBar();
    }

    private void initReplyBar() {
        if (this.restrictToCurrentGroup) {
            Groups.getGroups(2, new Groups.GetGroupsCallback() { // from class: com.vkontakte.android.ui.controllers.ReplyBarController.4
                @Override // com.vkontakte.android.data.Groups.GetGroupsCallback
                public void onResult(@NonNull List<Group> groups) {
                    Group currentGroup = null;
                    for (Group g : groups) {
                        if (g.id == (-ReplyBarController.this.ownerId)) {
                            currentGroup = g;
                        }
                    }
                    if (currentGroup == null) {
                        ReplyBarController.this.doInit(false);
                    } else {
                        ReplyBarController.this.doInit(true);
                    }
                }

                @Override // com.vkontakte.android.data.Groups.GetGroupsCallback
                public void onError() {
                    ReplyBarController.this.doInit(false);
                }
            });
        } else {
            GroupsForCommentsImpersonation.getInstance().load(new Callback<ArrayList<Group>>() { // from class: com.vkontakte.android.ui.controllers.ReplyBarController.5
                @Override // com.vkontakte.android.api.Callback
                public void success(ArrayList<Group> result) {
                    if (result.size() == 0) {
                        ReplyBarController.this.doInit(false);
                    } else {
                        ReplyBarController.this.doInit(true);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    ReplyBarController.this.doInit(false);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doInit(boolean enabled) {
        if (enabled) {
            setFromYouAsName();
            return;
        }
        this.replyBarView.setVisibility(8);
        this.delegate.onViewVisibilityChanged(8);
    }

    public void setFromYouAsName() {
        this.fromName = this.replyBarView.getResources().getString(R.string.community_comments_from_your_name);
        this.fromYourName = true;
        updateView();
    }

    public void resetReplyToName() {
        setReplyToName("");
    }

    public void setReplyToName(String replyToName) {
        if (replyToName == null) {
            replyToName = "";
        }
        this.replyToName = replyToName;
        updateView();
    }

    public void setFromName(String fromName) {
        if (fromName == null) {
            fromName = "";
        }
        this.fromName = fromName;
        this.fromYourName = false;
        updateView();
    }

    private void updateView() {
        int i = 0;
        updateTextViewTo();
        updateTextViewFrom();
        boolean show = this.textViewTo.getText().length() > 0 || this.textViewFrom.getText().length() > 0;
        updateMaxWidth();
        V.setVisibilityAnimated(this.replyBarView, show ? 0 : 8);
        Delegate delegate = this.delegate;
        if (!show) {
            i = 8;
        }
        delegate.onViewVisibilityChanged(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateMaxWidth() {
        int newMaxWidth;
        int currentMaxWidth = this.textViewTo.getMaxWidth();
        if (this.textViewTo.getText().length() > 0 && this.textViewFrom.getText().length() > 0) {
            int currentWidth = this.replyBarView.getWidth();
            if (currentWidth > 0 && (newMaxWidth = (int) (this.replyBarView.getWidth() * 0.65d)) != currentMaxWidth) {
                this.textViewTo.setMaxWidth(newMaxWidth);
            }
        } else if (Integer.MAX_VALUE != currentMaxWidth) {
            this.textViewTo.setMaxWidth(Integer.MAX_VALUE);
        }
    }

    private void updateTextViewFrom() {
        if (!this.fromName.isEmpty()) {
            this.textViewFrom.setText(getSpannableWithHighlightedName(R.string.community_comments_from_frm, this.fromName, !this.fromYourName));
        } else {
            this.textViewFrom.setText("");
        }
    }

    private void updateTextViewTo() {
        if (!this.replyToName.isEmpty()) {
            this.textViewTo.setText(getSpannableWithHighlightedName(R.string.community_comments_reply_to_frm, this.replyToName, false));
        } else {
            this.textViewTo.setText("");
        }
    }

    private SpannableStringBuilder getSpannableWithHighlightedName(int resourceId, String name, boolean addCommunityIcon) {
        String formattedStr = this.replyBarView.getContext().getResources().getString(resourceId);
        int indNameStart = formattedStr.indexOf("%s");
        int indNameEnd = indNameStart + 2;
        String str = String.format(formattedStr, name);
        int indNameEnd2 = indNameEnd + (str.length() - formattedStr.length());
        SpannableStringBuilder ssb = new SpannableStringBuilder(str);
        ssb.setSpan(new Font.TypefaceSpan(Font.Medium, -11435592), indNameStart, indNameEnd2, 0);
        if (addCommunityIcon) {
            ssb.insert(indNameStart, (CharSequence) "A ");
            Drawable d = this.replyBarView.getContext().getResources().getDrawable(R.drawable.ic_comment_group_16dp);
            d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            ssb.setSpan(new ImageSpan(d, 0), indNameStart, indNameStart + 1, 0);
        }
        return ssb;
    }
}
