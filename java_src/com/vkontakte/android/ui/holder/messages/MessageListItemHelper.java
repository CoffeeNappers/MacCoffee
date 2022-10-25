package com.vkontakte.android.ui.holder.messages;

import android.content.res.Resources;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.text.Html;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.StyleSpan;
import android.text.style.URLSpan;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.Message;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ZhukovLayout;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GiftAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;
/* loaded from: classes3.dex */
public class MessageListItemHelper {
    public static final int TIME_STEP = 7200;

    /* loaded from: classes3.dex */
    public interface MessageListItemHelperProvider {
        UserProfile getChatUser(int i);

        int getContentWidth();

        String getUserName(int i);

        boolean isJumpedToEnd();

        void onBuildMessage();

        void setHasSeparator(boolean z);
    }

    @Nullable
    public static int[] processServiceAction(MessageListItemHelperProvider provider, Message message, MessageListItem item) {
        int[] uids = processServiceActionInner(provider, message, item);
        if (uids != null && (item.text instanceof Spannable)) {
            Object[] spans = ((Spannable) item.text).getSpans(0, item.text.length(), StyleSpan.class);
            Log.i("vk", "Len = " + spans.length);
            for (int i = 0; i < spans.length && i < uids.length; i++) {
                int start = ((Spannable) item.text).getSpanStart(spans[i]);
                int end = ((Spannable) item.text).getSpanEnd(spans[i]);
                URLSpan span = new URLSpan("vkontakte://profile/" + uids[i]) { // from class: com.vkontakte.android.ui.holder.messages.MessageListItemHelper.1
                    @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
                    public void updateDrawState(TextPaint ds) {
                    }
                };
                ((Spannable) item.text).setSpan(span, start, end, 0);
            }
        }
        return uids;
    }

    @Nullable
    private static int[] processServiceActionInner(MessageListItemHelperProvider provider, Message message, MessageListItem item) {
        String action = message.extras.getString(NativeProtocol.WEB_DIALOG_ACTION);
        if (TextUtils.isEmpty(action)) {
            return null;
        }
        Resources res = VKApplication.context.getResources();
        char c = 65535;
        switch (action.hashCode()) {
            case -431939366:
                if (action.equals("chat_invite_user")) {
                    c = 6;
                    break;
                }
                break;
            case -340613507:
                if (action.equals("chat_unpin_message")) {
                    c = 1;
                    break;
                }
                break;
            case -202488297:
                if (action.equals("chat_title_update")) {
                    c = 5;
                    break;
                }
                break;
            case 205006333:
                if (action.equals("chat_kick_user")) {
                    c = 7;
                    break;
                }
                break;
            case 284205302:
                if (action.equals("chat_pin_message")) {
                    c = 0;
                    break;
                }
                break;
            case 638435512:
                if (action.equals("chat_photo_remove")) {
                    c = 3;
                    break;
                }
                break;
            case 734200061:
                if (action.equals("chat_photo_update")) {
                    c = 2;
                    break;
                }
                break;
            case 1662195651:
                if (action.equals("chat_create")) {
                    c = 4;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return processServiceStandardAction(provider, message, item, res, R.string.chat_pin_message_f, R.string.chat_pin_message_m, false);
            case 1:
                return processServiceStandardAction(provider, message, item, res, R.string.chat_unpin_message_f, R.string.chat_unpin_message_m, false);
            case 2:
                return processServiceStandardAction(provider, message, item, res, R.string.chat_photo_updated_f, R.string.chat_photo_updated_m, false);
            case 3:
                return processServiceStandardAction(provider, message, item, res, R.string.chat_photo_removed_f, R.string.chat_photo_removed_m, false);
            case 4:
                return processServiceStandardAction(provider, message, item, res, R.string.serv_created_chat_f, R.string.serv_created_chat_m, true);
            case 5:
                return processServiceStandardAction(provider, message, item, res, R.string.serv_renamed_chat_f, R.string.serv_renamed_chat_m, true);
            case 6:
                return processServiceKickInviteChatUser(provider, message, item, res, R.string.serv_user_invited_f, R.string.serv_user_invited_m, R.string.serv_user_returned_f, R.string.serv_user_returned_m);
            case 7:
                return processServiceKickInviteChatUser(provider, message, item, res, R.string.serv_user_kicked_f, R.string.serv_user_kicked_m, R.string.serv_user_left_f, R.string.serv_user_left_m);
            default:
                Log.w("vk", "Unknown message action " + action);
                return null;
        }
    }

    private static int[] processServiceStandardAction(MessageListItemHelperProvider provider, Message message, MessageListItem item, Resources res, @StringRes int resF, @StringRes int resM, boolean showActionText) {
        UserProfile p = provider.getChatUser(message.sender);
        if (showActionText) {
            if (!p.f) {
                resF = resM;
            }
            item.text = Html.fromHtml(res.getString(resF, prepareBoldText(p.fullName), prepareBoldText(message.extras.getString("action_text"))));
        } else {
            if (!p.f) {
                resF = resM;
            }
            item.text = Html.fromHtml(res.getString(resF, prepareBoldText(p.fullName)));
        }
        return new int[]{p.uid};
    }

    private static int[] processServiceKickInviteChatUser(MessageListItemHelperProvider provider, Message message, MessageListItem item, Resources res, @StringRes int resF, @StringRes int resM, @StringRes int resFSelf, @StringRes int resMSelf) {
        String name;
        int uid = message.extras.getInt("action_mid");
        UserProfile p = provider.getChatUser(message.sender);
        if (uid == message.sender) {
            if (!p.f) {
                resFSelf = resMSelf;
            }
            item.text = Html.fromHtml(res.getString(resFSelf, prepareBoldText(p.fullName)));
            return new int[]{message.sender};
        }
        if (message.extras.containsKey("action_email")) {
            name = message.extras.getString("action_email");
        } else {
            name = provider.getUserName(uid);
        }
        if (!p.f) {
            resF = resM;
        }
        item.text = Html.fromHtml(res.getString(resF, prepareBoldText(p.fullName), prepareBoldText(name)));
        return new int[]{message.sender, uid};
    }

    private static String prepareBoldText(String text) {
        return "<b>" + text.replace("<", "&lt;") + "</b>";
    }

    private static void setTextFromMessage(MessageListItemHelperProvider provider, Message message, MessageListItem item, @Nullable Set<Integer> fwdUidSet) {
        if (message.isServiceMessage && message.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
            int[] uids = processServiceAction(provider, message, item);
            if (uids != null && fwdUidSet != null) {
                for (int id : uids) {
                    fwdUidSet.add(Integer.valueOf(id));
                }
                return;
            }
            return;
        }
        item.text = message.displayableText;
    }

    public static int fixTimes(List<MessageListItem> items) {
        ArrayList<MessageListItem> toRemove = new ArrayList<>();
        int prevDay = 0;
        int lastMessageTime = 0;
        boolean prevIsDate = false;
        for (MessageListItem item : items) {
            if (item.isTime()) {
                if (item.time == prevDay || item.time - 7200 <= lastMessageTime || prevIsDate) {
                    toRemove.add(item);
                }
                prevDay = item.time;
                prevIsDate = true;
            } else {
                prevIsDate = false;
            }
            lastMessageTime = item.time;
        }
        items.removeAll(toRemove);
        if (!items.isEmpty() && items.get(items.size() - 1).isTime()) {
            items.remove(items.size() - 1);
        }
        return toRemove.size();
    }

    public static ArrayList<MessageListItem> buildItems(MessageListItemHelperProvider provider, List<Message> msgs, @Nullable Set<Integer> fwdUidSet) {
        UserProfile profile;
        ArrayList<MessageListItem> result = new ArrayList<>();
        if (msgs.size() != 0) {
            int lastMessageTime = 0;
            int prevDay = 0;
            boolean prevReadState = true;
            boolean needDivider = msgs.get(0).readState && !msgs.get(msgs.size() + (-1)).readState;
            int lastShowedTime = 0;
            for (Message m : msgs) {
                MessageListItem item = new MessageListItem(m);
                if (!m.out && (profile = provider.getChatUser(m.sender)) != null && profile.uid != 0) {
                    item.setImageUrl(profile.photo);
                }
                setTextFromMessage(provider, m, item, fwdUidSet);
                item.hasLinks = (m.displayableText instanceof Spannable) && ((URLSpan[]) ((Spannable) m.displayableText).getSpans(0, m.displayableText.length() + (-1), URLSpan.class)).length > 0;
                item.setAttachments(m.attachments);
                item.fwdLevel = 0;
                processZhukovLayout(item, provider);
                if (needDivider && prevReadState && !item.readState && !item.isOut && !provider.isJumpedToEnd()) {
                    MessageListItem srv = new MessageListItem();
                    srv.type = 6;
                    result.add(srv);
                    provider.setHasSeparator(true);
                }
                int currentMessageTime = m.time + (TimeZone.getDefault().getRawOffset() / 1000);
                if (currentMessageTime / 86400 != prevDay) {
                    prevDay = currentMessageTime / 86400;
                    MessageListItem srv2 = new MessageListItem();
                    srv2.type = 5;
                    lastShowedTime = item.time;
                    srv2.time = lastShowedTime;
                    srv2.groupMessagesTime = srv2.time;
                    result.add(srv2);
                } else if (currentMessageTime - lastMessageTime > 7200) {
                    MessageListItem srv3 = new MessageListItem();
                    srv3.type = 5;
                    lastShowedTime = item.time;
                    srv3.time = lastShowedTime;
                    srv3.groupMessagesTime = srv3.time;
                    result.add(srv3);
                }
                lastMessageTime = currentMessageTime;
                item.groupMessagesTime = lastShowedTime;
                GiftAttachment gift = null;
                int i = 0;
                while (true) {
                    if (i >= m.attachments.size()) {
                        break;
                    }
                    Attachment attachment = m.attachments.get(i);
                    if (attachment instanceof GiftAttachment) {
                        gift = (GiftAttachment) attachment;
                        break;
                    }
                    if (attachment instanceof SnippetAttachment) {
                        ((SnippetAttachment) attachment).forceSmall = true;
                    }
                    i++;
                }
                if (gift != null) {
                    item.type = 7;
                    ArrayList<Attachment> attachments = new ArrayList<>();
                    attachments.add(gift);
                    item.setAttachments(attachments);
                }
                prevReadState = item.readState;
                boolean parentIsAdded = !TextUtils.isEmpty(m.text) || m.attachments.size() > 0 || !TextUtils.isEmpty(item.text);
                if (parentIsAdded) {
                    result.add(item);
                }
                if (item.type != 7) {
                    item.type = m.isServiceMessage ? 5 : 1;
                }
                if (m.fwdMessages.size() > 0) {
                    item.type = 2;
                    result.addAll(buildFwdItems(provider, m, m.fwdMessages, fwdUidSet, parentIsAdded));
                }
            }
            provider.onBuildMessage();
            return (ArrayList) MessageListItem.processItemIds(result);
        }
        return result;
    }

    private static List<MessageListItem> buildFwdItems(MessageListItemHelperProvider provider, Message message, List<Message.FwdMessage> fwdMessages, @Nullable Set<Integer> fwdUidSet, boolean hasTop) {
        List<MessageListItem> listItems = buildFwdItemsInner(provider, message, fwdMessages, fwdUidSet, 1, null);
        int size = listItems.size();
        int i = 0;
        while (i < size) {
            MessageListItem item = listItems.get(i);
            item.fwdLevelLast = i > 0 ? listItems.get(i - 1).fwdLevel : 0;
            item.fwdLevelNext = i < size + (-1) ? listItems.get(i + 1).fwdLevel : 0;
            i++;
        }
        if (listItems.size() == 1) {
            listItems.get(0).type = !hasTop ? 1 : 4;
        } else {
            listItems.get(0).type = !hasTop ? 2 : 3;
            listItems.get(listItems.size() - 1).type = 4;
        }
        return listItems;
    }

    private static List<MessageListItem> buildFwdItemsInner(MessageListItemHelperProvider provider, Message message, List<Message.FwdMessage> fwdMessages, @Nullable Set<Integer> fwdUidSet, int level, List<MessageListItem> items) {
        if (items == null) {
            items = new ArrayList<>();
        }
        for (int i = 0; i < fwdMessages.size(); i++) {
            Message.FwdMessage m = fwdMessages.get(i);
            MessageListItem item = new MessageListItem(message, m);
            item.fwdLevel = level;
            item.type = 3;
            for (int j = 0; j < m.attachments.size(); j++) {
                Attachment attachment = m.attachments.get(j);
                if (attachment instanceof SnippetAttachment) {
                    ((SnippetAttachment) attachment).forceSmall = true;
                }
            }
            processZhukovLayout(item, provider);
            items.add(item);
            if (fwdUidSet != null) {
                fwdUidSet.add(Integer.valueOf(m.sender));
            }
            if (m.fwdMessages.size() > 0 && level <= 10) {
                buildFwdItemsInner(provider, message, m.fwdMessages, fwdUidSet, level + 1, items);
            }
        }
        return items;
    }

    public static void processZhukovLayout(MessageListItem item, MessageListItemHelperProvider provider) {
        int sz = Math.min(provider.getContentWidth(), Global.scale(350.0f));
        ZhukovLayout.processThumbs(((sz - Global.scale(126.0f)) - (item.fwdLevel * Global.scale(8.0f))) - (item.fwdLevel == 0 ? 0 : Global.scale(6.0f)), sz, item.getOrCreateAttachments());
    }

    public static void processZhukovLayout(List<Attachment> attachments, MessageListItemHelperProvider provider) {
        int sz = Math.min(provider.getContentWidth(), Global.scale(350.0f));
        ZhukovLayout.processThumbs(sz - Global.scale(126.0f), sz, attachments);
    }
}
