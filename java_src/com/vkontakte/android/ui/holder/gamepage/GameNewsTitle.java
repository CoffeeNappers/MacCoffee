package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.content.DialogInterface;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsJoin;
import com.vkontakte.android.api.groups.GroupsLeave;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class GameNewsTitle extends RecyclerHolder<Data> implements View.OnClickListener {
    TextView subscribeButton;

    /* loaded from: classes3.dex */
    public static class Data {
        int appId;
        boolean isMember;

        public Data(int appId, boolean isMember) {
            this.appId = appId;
            this.isMember = isMember;
        }
    }

    public GameNewsTitle(@NonNull Context context) {
        super((int) R.layout.apps_news_title, context);
        TextView textView = (TextView) $(R.id.subscribe);
        this.subscribeButton = textView;
        textView.setOnClickListener(this);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Data item) {
        this.subscribeButton.setText(item.isMember ? R.string.games_group_news_unsubscribe : R.string.games_group_news_subscribe);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (getItem() != null) {
            if (getItem().isMember) {
                leaveGroup();
            } else {
                joinGroup();
            }
        }
    }

    private void joinGroup() {
        GroupsJoin.createGroupsJoinAndSendAllStats(getItem().appId, false).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.ui.holder.gamepage.GameNewsTitle.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                GameNewsTitle.this.getItem().isMember = true;
                GameNewsTitle.this.subscribeButton.setText(R.string.games_group_news_unsubscribe);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(GameNewsTitle.this.getContext()).setTitle(R.string.error).setMessage(error.getCodeValue() == 15 ? R.string.page_blacklist : R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(getContext()).exec(getContext());
    }

    private void leaveGroup() {
        new GroupsLeave(getItem().appId).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.ui.holder.gamepage.GameNewsTitle.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                GameNewsTitle.this.getItem().isMember = false;
                GameNewsTitle.this.subscribeButton.setText(R.string.games_group_news_subscribe);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                new VKAlertDialog.Builder(GameNewsTitle.this.getContext()).setTitle(R.string.error).setMessage(error.getCodeValue() == 15 ? R.string.page_blacklist : R.string.err_text).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            }
        }).wrapProgress(getContext()).exec(getContext());
    }
}
