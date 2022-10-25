package com.vkontakte.android.ui.holder.messages;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.ui.DialogEntryView;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class DialogHolder extends RecyclerHolder<DialogEntry> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
    private DialogsFragment dialogsFragment;
    private String userPhoto;

    public DialogHolder(Context ctx, DialogsFragment dialogsFragment, String userPhoto) {
        super(new DialogEntryView(ctx));
        this.userPhoto = userPhoto;
        this.dialogsFragment = dialogsFragment;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(DialogEntry item) {
        ((DialogEntryView) this.itemView).setData(item, this.userPhoto);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        DialogEntry lastEntry = getItem();
        if (this.dialogsFragment.selListener != null) {
            this.dialogsFragment.selListener.onItemSelected(lastEntry);
            return;
        }
        ChatFragment.Builder builder = new ChatFragment.Builder(lastEntry.profile.uid, lastEntry.profile.fullName).setPhoto(lastEntry.profile.photo);
        if (this.dialogsFragment.searchQuery != null && lastEntry.lastMessage != null) {
            builder.setMessageId(lastEntry.lastMessage.id);
        }
        builder.go(getContext());
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
    public boolean onLongClick() {
        String[] items;
        String string;
        if (this.dialogsFragment.selListener == null && this.dialogsFragment.searchQuery == null) {
            DialogEntry lastEntry = getItem();
            Bundle extra = lastEntry.profile.extra;
            boolean isGroup = lastEntry.profile.uid < 0;
            boolean isDenyMessages = extra != null && extra.getBoolean("is_messages_blocked", false);
            if (isGroup) {
                items = new String[3];
                if (isDenyMessages) {
                    string = getString(R.string.allow_messages);
                } else {
                    string = getString(R.string.deny_messages);
                }
                items[0] = string;
                items[1] = getString(R.string.clear_messages_history);
                items[2] = getString(R.string.chat_add_shortcut);
            } else {
                items = new String[]{getString(R.string.clear_messages_history), getString(R.string.chat_add_shortcut)};
            }
            new VKAlertDialog.Builder(getContext()).setItems(items, DialogHolder$$Lambda$1.lambdaFactory$(this, isGroup, isDenyMessages, lastEntry)).show();
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onLongClick$0(boolean isGroup, boolean isDenyMessages, DialogEntry lastEntry, DialogInterface dialog, int which) {
        if (isGroup) {
            switch (which) {
                case 0:
                    if (isDenyMessages) {
                        this.dialogsFragment.allowMessages(lastEntry);
                        return;
                    } else {
                        this.dialogsFragment.denyMessages(lastEntry);
                        return;
                    }
                case 1:
                    this.dialogsFragment.confirmAndClearHistory(lastEntry);
                    return;
                case 2:
                    this.dialogsFragment.createShortcut(lastEntry);
                    return;
                default:
                    return;
            }
        }
        switch (which) {
            case 0:
                this.dialogsFragment.confirmAndClearHistory(lastEntry);
                return;
            case 1:
                this.dialogsFragment.createShortcut(lastEntry);
                return;
            default:
                return;
        }
    }
}
