package com.vkontakte.android.utils;

import android.content.Context;
import android.content.DialogInterface;
import android.support.annotation.Nullable;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.messages.MessagesAddChatUser;
import com.vkontakte.android.api.messages.MessagesAllowFromGroup;
import com.vkontakte.android.api.messages.MessagesDenyFromGroup;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF2;
/* loaded from: classes3.dex */
public class ApiMethodsHelper {
    public static <T> void clearHistory(Context ctx, int uid, T object, VoidF2<Integer, T> f) {
        new VKAlertDialog.Builder(ctx).setTitle(R.string.confirm).setMessage(R.string.clear_messages_history_confirm).setPositiveButton(R.string.yes, ApiMethodsHelper$$Lambda$1.lambdaFactory$(uid, ctx, f, object)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    public static void addUserToChat(Context ctx, int id, UserProfile p, int uid, Callback<Boolean> callback) {
        if (p != null) {
            uid = p.uid;
        }
        new MessagesAddChatUser(id, uid).setCallback(callback).wrapProgress(ctx).exec(ctx);
    }

    public static void removeUserFromChat(Context ctx, int chatId, int uid, @Nullable VoidF1<Integer> f) {
        new VKAlertDialog.Builder(ctx).setTitle(R.string.confirm).setMessage(VKAccountManager.isCurrentUser(uid) ? R.string.chat_leave_confirm : R.string.delete_chat_user_confirm).setPositiveButton(R.string.yes, ApiMethodsHelper$$Lambda$2.lambdaFactory$(chatId, uid, ctx, f)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    public static void denyMessagesFromGroup(Context ctx, int groupId, Callback<Boolean> callback) {
        new MessagesDenyFromGroup(groupId).setCallback(callback).wrapProgress(ctx).exec(ctx);
    }

    public static void allowMessagesFromGroup(Context ctx, int groupId, Callback<Boolean> callback) {
        new MessagesAllowFromGroup(groupId).setCallback(callback).wrapProgress(ctx).exec(ctx);
    }
}
