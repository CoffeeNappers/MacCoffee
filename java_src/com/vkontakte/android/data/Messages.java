package com.vkontakte.android.data;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.LruCache;
import android.util.Pair;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.AvatarDataSource;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.ChatUser;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.Message;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesDelete;
import com.vkontakte.android.api.messages.MessagesGetChat;
import com.vkontakte.android.api.messages.MessagesGetDialogs;
import com.vkontakte.android.api.messages.MessagesGetHistory;
import com.vkontakte.android.api.messages.MessagesGetUnreadCount;
import com.vkontakte.android.api.messages.MessagesMarkAsRead;
import com.vkontakte.android.api.messages.MessagesSearch;
import com.vkontakte.android.api.messages.MessagesSearchDialogs;
import com.vkontakte.android.api.messages.MessagesSend;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.PendingAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.background.CountingLock;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.cache.MessagesAction;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploaderIntentService;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Semaphore;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Messages {
    public static final String ACTION_MESSAGE_ID_CHANGED = "com.vkontakte.android.MESSAGE_ID_CHANGED";
    public static final String ACTION_SEND_FAILED = "com.vkontakte.android.MESSAGE_SEND_FAILED";
    private static final boolean DEBUG = true;
    public static final String METHOD_NAME = "messages.getById";
    private static VKAPIRequest loadDlgsReq;
    private static LruCache<Integer, ArrayList<Message>> histories = new LruCache<>(20);
    private static ArrayList<DialogEntry> dialogs = new ArrayList<>();
    private static ArrayList<Message> pendingUploads = new ArrayList<>();
    private static long lastUpdated = -1;
    public static Semaphore updateLock = new Semaphore(1, true);
    public static Semaphore counterLock = new Semaphore(1, true);
    public static CountingLock sendLock = new CountingLock();

    /* loaded from: classes2.dex */
    public interface GetChatUsersCallback {
        void onUsersLoaded(ArrayList<ChatUser> arrayList, String str, String str2);
    }

    /* loaded from: classes2.dex */
    public interface GetDialogsCallback {
        void onDialogsLoaded(ArrayList<DialogEntry> arrayList);

        void onError(int i, String str);
    }

    /* loaded from: classes2.dex */
    public interface GetMessagesCallback {
        void onError(int i, String str);

        void onMessagesLoaded(ArrayList<Message> arrayList, int i);
    }

    /* loaded from: classes2.dex */
    public interface GetUnreadCountCallback {
        void onUnreadCountLoaded(int i, int i2);
    }

    /* loaded from: classes2.dex */
    public interface SearchCallback {
        void onDialogsLoaded(ArrayList<DialogEntry> arrayList, int i);

        void onError(int i, String str);
    }

    /* loaded from: classes2.dex */
    public interface SearchDialogsCallback {
        void onError(int i, String str);

        void onResult(List<UserProfile> list);
    }

    public static void add(final Message msg, UserProfile peerProfile, final String senderPhoto) {
        if (senderPhoto == null) {
            Log.e("vk", "sender photo is null!");
        }
        Log.i("vk", "Add message " + msg.id + " START");
        if (!msg.out) {
            try {
                counterLock.acquire();
            } catch (Exception e) {
            }
        }
        lastUpdated = System.currentTimeMillis();
        VKApplication.context.getSharedPreferences("msg", 0).edit().putLong(ServerKeys.UPDATED, lastUpdated).apply();
        if (histories.get(Integer.valueOf(msg.peer)) == null) {
            histories.put(Integer.valueOf(msg.peer), new ArrayList<>());
        }
        ArrayList<Message> list = histories.get(Integer.valueOf(msg.peer));
        boolean appended = true;
        if (list.size() == 0) {
            list.add(msg);
        } else if (list.get(0).time < msg.time) {
            list.add(0, msg);
        } else {
            int prevTime = Integer.MAX_VALUE;
            int i = 0;
            while (true) {
                if (i < list.size()) {
                    if (msg.time >= prevTime && list.get(i).time <= msg.time) {
                        list.add(i, msg);
                        break;
                    } else {
                        prevTime = list.get(i).time;
                        i++;
                    }
                } else {
                    break;
                }
            }
            appended = false;
        }
        if (!msg.out) {
            counterLock.release();
        }
        Runnable rr = Messages$$Lambda$1.lambdaFactory$(msg);
        if (Looper.myLooper() == Looper.getMainLooper()) {
            APIController.runInBg(rr);
        } else {
            rr.run();
        }
        if (!appended) {
            if (!msg.out && !msg.readState) {
                try {
                    updateLock.acquire();
                } catch (Exception e2) {
                }
                Iterator<DialogEntry> it = dialogs.iterator();
                while (it.hasNext()) {
                    DialogEntry e3 = it.next();
                    if (e3.profile.uid == msg.peer) {
                        e3.unreadCount++;
                    }
                }
                updateLock.release();
                return;
            }
            return;
        }
        try {
            updateLock.acquire();
        } catch (Exception e4) {
        }
        boolean found = false;
        Iterator<DialogEntry> it2 = dialogs.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            DialogEntry e5 = it2.next();
            if (e5.profile.uid == msg.peer) {
                e5.lastMessage = msg;
                e5.lastMessagePhoto = senderPhoto;
                if (!msg.out && !msg.readState) {
                    e5.unreadCount++;
                }
                dialogs.remove(e5);
                int prevTime2 = Integer.MAX_VALUE;
                int i2 = 0;
                while (true) {
                    if (i2 < dialogs.size()) {
                        if (e5.lastMessage.time >= prevTime2 && dialogs.get(i2).lastMessage.time <= e5.lastMessage.time) {
                            dialogs.add(Math.max(i2 - 1, 0), e5);
                            break;
                        } else {
                            prevTime2 = dialogs.get(i2).lastMessage.time;
                            i2++;
                        }
                    } else {
                        break;
                    }
                }
                found = true;
            }
        }
        updateLock.release();
        if (!found) {
            Log.d("vk", "didn't find dialog for " + msg.peer);
            int _unreadCount = 0;
            if (!msg.out && !msg.readState) {
                Log.d("vk", "getting unread count from cache");
                _unreadCount = Cache.getNumUnreadMessages(msg.peer);
                Log.d("vk", "result=" + _unreadCount);
                if (_unreadCount == -1) {
                    final int[] res = {0};
                    new MessagesGetUnreadCount(msg.peer).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.data.Messages.1
                        @Override // com.vkontakte.android.api.Callback
                        public void success(Integer count) {
                            res[0] = count.intValue();
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse err) {
                            Log.e("vk", "Error getting unread count");
                        }
                    }).execSync();
                    _unreadCount = res[0];
                }
            }
            final int unreadCount = _unreadCount;
            Log.d("vk", "Final unread count value " + unreadCount);
            if (peerProfile != null) {
                DialogEntry e6 = new DialogEntry();
                e6.lastMessage = msg;
                e6.lastMessagePhoto = senderPhoto;
                e6.profile = peerProfile;
                e6.unreadCount = unreadCount;
                try {
                    updateLock.acquire();
                } catch (Exception e7) {
                }
                dialogs.add(0, e6);
                updateLock.release();
            } else {
                ArrayList<Integer> ids = new ArrayList<>();
                ids.add(Integer.valueOf(msg.peer));
                if (msg.peer < 2000000000) {
                    Friends.getUsers(ids, new Friends.GetUsersCallback() { // from class: com.vkontakte.android.data.Messages.2
                        @Override // com.vkontakte.android.data.Friends.GetUsersCallback
                        public void onUsersLoaded(ArrayList<UserProfile> users) {
                            DialogEntry e8 = new DialogEntry();
                            e8.lastMessage = msg;
                            e8.lastMessagePhoto = senderPhoto;
                            e8.unreadCount = unreadCount;
                            if (users == null || users.size() == 0) {
                                e8.profile = new UserProfile();
                                UserProfile userProfile = e8.profile;
                                UserProfile userProfile2 = e8.profile;
                                UserProfile userProfile3 = e8.profile;
                                e8.profile.photo = "";
                                userProfile3.fullName = "";
                                userProfile2.lastName = "";
                                userProfile.firstName = "";
                                try {
                                    JSONObject args = new JSONObject();
                                    args.put(ServerKeys.USER_IDS, msg.peer);
                                    args.put(GraphRequest.FIELDS_PARAM, "photo_50,photo_100,is_friend,sex");
                                    JSONObject data = new JSONObject();
                                    Cache.putApiRequest("users.get", args, getClass().getMethod("getProfileResult", new Class[0]), data);
                                } catch (Exception e9) {
                                }
                            } else {
                                e8.profile = users.get(0);
                            }
                            try {
                                Messages.updateLock.acquire();
                            } catch (Exception e10) {
                            }
                            Messages.dialogs.add(0, e8);
                            Messages.updateLock.release();
                        }
                    });
                } else {
                    getChatUsers(msg.peer - 2000000000, new GetChatUsersCallback() { // from class: com.vkontakte.android.data.Messages.3
                        @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
                        public void onUsersLoaded(ArrayList<ChatUser> users, String title, String photo) {
                            UserProfile p = new UserProfile();
                            p.fullName = title;
                            if (title == null) {
                                p.fullName = msg.title;
                            }
                            p.uid = msg.peer;
                            if (photo != null) {
                                p.photo = photo;
                            } else if (users != null && users.size() > 0) {
                                p.photo = Messages.createChatPhoto(users);
                            }
                            DialogEntry e8 = new DialogEntry();
                            e8.lastMessage = msg;
                            e8.lastMessagePhoto = senderPhoto;
                            e8.profile = p;
                            e8.unreadCount = unreadCount;
                            try {
                                Messages.updateLock.acquire();
                            } catch (Exception e9) {
                            }
                            Messages.dialogs.add(0, e8);
                            Messages.updateLock.release();
                            if (title == null) {
                                try {
                                    JSONObject args = new JSONObject();
                                    args.put("chat_id", msg.peer - 2000000000);
                                    args.put(GraphRequest.FIELDS_PARAM, "photo_rec,photo_medium_rec,sex");
                                    JSONObject data = new JSONObject();
                                    data.put("id", msg.peer - 2000000000);
                                    Cache.putApiRequest("messages.getChat", args, getClass().getMethod("getChatUsersResult", new Class[0]), data);
                                } catch (Exception x) {
                                    L.e(x, new Object[0]);
                                }
                            }
                        }
                    });
                }
            }
        }
        Log.i("vk", "Add message " + msg.id + " END");
    }

    public static /* synthetic */ void lambda$add$0(Message msg) {
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        ArrayList<Message> al = new ArrayList<>();
        al.add(msg);
        Cache.addMessages(al);
        updateLock.release();
    }

    public static void getAllLoadedDialogs(ArrayList<DialogEntry> out) {
        out.addAll(dialogs);
    }

    public static Message getById(int id) {
        Message m = Cache.getMessageByID(id);
        if (m == null) {
            final Message[] res = {null};
            new VKAPIRequest(METHOD_NAME).param("message_ids", id).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.data.Messages.4
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject o) {
                    try {
                        res[0] = new Message(APIUtils.unwrapArray(o, ServerKeys.RESPONSE).array.getJSONObject(0));
                    } catch (Exception x) {
                        Log.w("vk", x);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).execSync();
            return res[0];
        }
        return m;
    }

    public static void getDialogs(int offset, int count, GetDialogsCallback callback) {
        Log.i("vk", "getDialogs " + offset + ", " + count + " [size=" + dialogs.size() + "]");
        if (dialogs.size() >= offset + count && updateLock.tryAcquire()) {
            ArrayList<DialogEntry> result = new ArrayList<>();
            for (DialogEntry e : dialogs.subList(offset, offset + count)) {
                Log.d("vk", "added " + e);
                UserProfile p = Friends.get(e.profile.uid);
                if (p != null) {
                    e.profile = p;
                }
                result.add(new DialogEntry(e));
            }
            updateLock.release();
            Log.d("vk", "Returned dialogs from ram " + result.size());
            callback.onDialogsLoaded(result);
            return;
        }
        new Thread(Messages$$Lambda$2.lambdaFactory$(offset, count, callback)).start();
    }

    public static /* synthetic */ void lambda$getDialogs$2(int offset, int count, GetDialogsCallback callback) {
        int cacheCount = Cache.getDialogsCount();
        Log.i("vk", "cache count " + cacheCount);
        if (dialogs.size() < cacheCount && cacheCount >= offset + count) {
            try {
                updateLock.acquire();
            } catch (Exception e) {
            }
            ArrayList<DialogEntry> cached = Cache.getDialogs(dialogs.size(), Math.min(cacheCount - dialogs.size(), count));
            dialogs.addAll(cached);
            ArrayList<Integer> uids = new ArrayList<>();
            Iterator<DialogEntry> it = cached.iterator();
            while (it.hasNext()) {
                DialogEntry e2 = it.next();
                if (e2.profile.uid > 2000000000 && !e2.lastMessage.out && !uids.contains(Integer.valueOf(e2.lastMessage.sender))) {
                    uids.add(Integer.valueOf(e2.lastMessage.sender));
                }
                if (e2.profile.uid < 2000000000 && e2.profile.photo == null && !uids.contains(Integer.valueOf(e2.profile.uid))) {
                    uids.add(Integer.valueOf(e2.profile.uid));
                }
            }
            updateLock.release();
            Friends.getUsers(uids, Messages$$Lambda$10.lambdaFactory$(cached, offset, count, callback));
            return;
        }
        loadDlgsReq = new MessagesGetDialogs(offset, count * 2).setCallback(new AnonymousClass5(callback, count));
        loadDlgsReq.execSync();
        loadDlgsReq = null;
    }

    public static /* synthetic */ void lambda$null$1(ArrayList cached, int offset, int count, GetDialogsCallback callback, ArrayList users) {
        Log.i("vk", "On users loaded " + users);
        SparseArray<UserProfile> u = new SparseArray<>();
        Iterator it = users.iterator();
        while (it.hasNext()) {
            UserProfile p = (UserProfile) it.next();
            u.put(p.uid, p);
        }
        Log.d("vk", "U=" + u);
        Iterator it2 = cached.iterator();
        while (it2.hasNext()) {
            DialogEntry e = (DialogEntry) it2.next();
            if (e.profile.uid > 2000000000 && !e.lastMessage.out) {
                if (Utils.containsKey(u, e.lastMessage.sender)) {
                    e.lastMessagePhoto = u.get(e.lastMessage.sender).photo;
                } else {
                    Log.e("vk", "Can't find photo for " + e.lastMessage.sender);
                }
            }
            if (e.profile.uid < 2000000000 && e.profile.photo == null) {
                if (Utils.containsKey(u, e.profile.uid)) {
                    e.profile = u.get(e.profile.uid);
                } else {
                    Log.e("vk", "Can't find profile for " + e.profile.uid);
                }
            }
        }
        if (dialogs.size() >= offset + count) {
            try {
                updateLock.acquire();
            } catch (Exception e2) {
            }
            ArrayList<DialogEntry> result = new ArrayList<>();
            for (DialogEntry e3 : dialogs.subList(offset, offset + count)) {
                result.add(new DialogEntry(e3));
            }
            if (callback != null) {
                callback.onDialogsLoaded(result);
            }
            updateLock.release();
        }
    }

    /* renamed from: com.vkontakte.android.data.Messages$5 */
    /* loaded from: classes2.dex */
    public static class AnonymousClass5 implements Callback<VKList<DialogEntry>> {
        final /* synthetic */ GetDialogsCallback val$callback;
        final /* synthetic */ int val$count;

        AnonymousClass5(GetDialogsCallback getDialogsCallback, int i) {
            this.val$callback = getDialogsCallback;
            this.val$count = i;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<DialogEntry> vKList) {
            long unused = Messages.lastUpdated = System.currentTimeMillis();
            VKApplication.context.getSharedPreferences("msg", 0).edit().putLong(ServerKeys.UPDATED, Messages.lastUpdated).commit();
            ArrayList uids = new ArrayList();
            Iterator it = vKList.iterator();
            while (it.hasNext()) {
                DialogEntry e = (DialogEntry) it.next();
                if (e.profile.uid > 2000000000 && !e.lastMessage.out && !uids.contains(Integer.valueOf(e.lastMessage.sender))) {
                    uids.add(Integer.valueOf(e.lastMessage.sender));
                }
            }
            ArrayList msgs = new ArrayList();
            ArrayList usrs = new ArrayList();
            ArrayList unreadCounts = new ArrayList();
            Iterator it2 = vKList.iterator();
            while (it2.hasNext()) {
                DialogEntry dlg = (DialogEntry) it2.next();
                msgs.add(dlg.lastMessage);
                usrs.add(dlg.profile);
                unreadCounts.add(new Pair(Integer.valueOf(dlg.lastMessage.peer), Integer.valueOf(dlg.unreadCount)));
            }
            Cache.addMessages(msgs);
            Cache.updatePeers(usrs, false);
            Cache.updateMessagesUnreadCount(unreadCounts);
            Friends.getUsers(uids, Messages$5$$Lambda$1.lambdaFactory$(vKList, this.val$callback, this.val$count));
        }

        public static /* synthetic */ void lambda$success$0(VKList results, GetDialogsCallback callback, int count, ArrayList users) {
            SparseArray<UserProfile> u = new SparseArray<>();
            Iterator it = users.iterator();
            while (it.hasNext()) {
                UserProfile p = (UserProfile) it.next();
                u.put(p.uid, p);
            }
            Iterator it2 = results.iterator();
            while (it2.hasNext()) {
                DialogEntry e = (DialogEntry) it2.next();
                if (e.profile.uid > 2000000000 && !e.lastMessage.out && Utils.containsKey(u, e.lastMessage.sender)) {
                    e.lastMessagePhoto = u.get(e.lastMessage.sender).photo;
                }
            }
            try {
                Messages.updateLock.acquire();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
            Messages.dialogs.addAll(results);
            Messages.updateLock.release();
            if (callback != null) {
                ArrayList<DialogEntry> res = new ArrayList<>();
                for (DialogEntry e2 : results.subList(0, Math.min(results.size(), count))) {
                    res.add(new DialogEntry(e2));
                }
                callback.onDialogsLoaded(res);
            }
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            Log.w("vk", "Error appkit_loading dialogs " + error);
            if (this.val$callback != null) {
                this.val$callback.onError(error.getCode(), error.message);
            }
        }
    }

    public static void setReadState(int mid, boolean state) {
        APIController.runInBg(Messages$$Lambda$3.lambdaFactory$(mid, state));
    }

    public static /* synthetic */ void lambda$setReadState$3(int mid, boolean state) {
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        Cache.setMessageReadState(mid, state);
        Iterator<DialogEntry> it = dialogs.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            DialogEntry e2 = it.next();
            if (e2.lastMessage.id == mid) {
                e2.lastMessage.readState = state;
                break;
            }
        }
        Set<Integer> keys = histories.snapshot().keySet();
        for (Integer num : keys) {
            int k = num.intValue();
            ArrayList<Message> msgs = histories.get(Integer.valueOf(k));
            if (msgs != null) {
                Iterator<Message> it2 = msgs.iterator();
                while (it2.hasNext()) {
                    Message msg = it2.next();
                    if (msg.id == mid) {
                        msg.readState = state;
                        updateLock.release();
                        return;
                    }
                }
                continue;
            }
        }
        updateLock.release();
    }

    public static void setReadStateBefore(int peer, int mid) {
        setReadStateUpto(peer, mid, true);
        VKApplication.context.sendBroadcast(LongPollService.createActionMessageRSteteChangedIntent(peer, mid, true), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void setReadStateUpto(int peer, int mid, boolean in) {
        if (!in) {
            sendLock.await();
        }
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        Cache.setMessageReadStateUpto(mid, peer, true, in);
        Iterator<DialogEntry> it = dialogs.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            DialogEntry e2 = it.next();
            if (e2.lastMessage.peer == peer && e2.lastMessage.id <= mid && e2.lastMessage.out != in) {
                e2.lastMessage.readState = true;
                e2.unreadCount = 0;
                break;
            }
        }
        ArrayList<Message> msgs = histories.get(Integer.valueOf(peer));
        if (msgs != null) {
            Iterator<Message> it2 = msgs.iterator();
            while (it2.hasNext()) {
                Message msg = it2.next();
                if (msg.id <= mid && msg.out != in) {
                    msg.readState = true;
                }
            }
        }
        updateLock.release();
    }

    public static int getUnreadCountFast(int peer) {
        int result = -1;
        if (updateLock.tryAcquire() && counterLock.tryAcquire()) {
            Iterator<DialogEntry> it = dialogs.iterator();
            while (it.hasNext()) {
                DialogEntry e = it.next();
                if (e.lastMessage.peer == peer) {
                    result = e.unreadCount;
                }
            }
            counterLock.release();
            updateLock.release();
            return result;
        }
        return -1;
    }

    public static int getUnreadCount(int peer) {
        int cache;
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        try {
            counterLock.acquire();
        } catch (Exception e2) {
        }
        Log.i("vk", "Get unread count " + peer + " START");
        try {
            Iterator<DialogEntry> it = dialogs.iterator();
            while (true) {
                if (it.hasNext()) {
                    DialogEntry e3 = it.next();
                    if (e3.lastMessage.peer == peer) {
                        updateLock.release();
                        cache = e3.unreadCount;
                        break;
                    }
                } else {
                    updateLock.release();
                    cache = Cache.getNumUnreadMessages(peer);
                    if (cache == -1) {
                        final int[] res = {0};
                        new MessagesGetUnreadCount(peer).setCallback(new SimpleCallback<Integer>() { // from class: com.vkontakte.android.data.Messages.6
                            @Override // com.vkontakte.android.api.Callback
                            public void success(Integer count) {
                                res[0] = count.intValue();
                            }
                        }).execSync();
                        Cache.updateMessagesUnreadCount(Collections.singletonList(new Pair(Integer.valueOf(peer), Integer.valueOf(res[0]))));
                        cache = res[0];
                    }
                }
            }
            return cache;
        } finally {
            Log.i("vk", "Get unread count " + peer + " END");
            counterLock.release();
        }
    }

    public static void getUnreadCount(int peer, GetUnreadCountCallback callback) {
        APIController.runInBg(Messages$$Lambda$4.lambdaFactory$(callback, peer));
    }

    public static void getHistory(int peer, int offset, int count, int startMsgID, GetMessagesCallback callback) {
        new Thread(Messages$$Lambda$5.lambdaFactory$(peer, offset, count, startMsgID, callback)).start();
    }

    public static /* synthetic */ void lambda$getHistory$5(final int peer, final int offset, int count, final int startMsgID, final GetMessagesCallback callback) {
        Thread.currentThread().setName("GetHistory " + peer);
        Log.i("vk", "Messages.getHistory(" + peer + ", " + offset + ", " + count + ", " + startMsgID + ", " + callback + ")");
        int numUnread1 = 0;
        if (startMsgID == -1) {
            numUnread1 = getUnreadCount(peer);
        }
        try {
            LongPollService.addMessage.acquire();
        } catch (Exception e) {
        }
        final ArrayList<Message> result = new ArrayList<>();
        final int ccnt = Cache.getMessagesHistoryCount(peer);
        if (startMsgID == 0 || startMsgID == -1) {
            Log.i("vk", "get history " + peer + ", offset=" + (offset + numUnread1) + ", count=" + count + ", cached=" + ccnt);
            if (ccnt >= (offset != 0 ? count : 1) + Math.max(offset + numUnread1, 0)) {
                result.addAll(Cache.getMessagesHistory(peer, Math.max(offset + numUnread1, 0), count));
                callback.onMessagesLoaded(result, (startMsgID == 0 || offset + numUnread1 <= 0) ? 0 : offset + numUnread1);
                if (histories.get(Integer.valueOf(peer)) == null) {
                    histories.put(Integer.valueOf(peer), new ArrayList<>());
                }
                ArrayList<Message> ramCache = histories.get(Integer.valueOf(peer));
                if (ramCache.size() > Math.max(offset + numUnread1, 0)) {
                    ramCache.subList(Math.max(offset + numUnread1, 0), ramCache.size()).clear();
                }
                if (ramCache.size() == Math.max(offset + numUnread1, 0)) {
                    int len = ramCache.size();
                    ramCache.addAll(result);
                    Collections.reverse(ramCache.subList(len, result.size() + len));
                }
                Log.i("vk", "Returinig peer " + peer + " history from cache");
                LongPollService.addMessage.release();
                return;
            }
        }
        final int _numUnread = numUnread1;
        new MessagesGetHistory(peer, startMsgID > 0 ? offset : Math.max(0, offset + numUnread1), count, startMsgID).setCallback(new Callback<MessagesGetHistory.Result>() { // from class: com.vkontakte.android.data.Messages.7
            @Override // com.vkontakte.android.api.Callback
            public void success(MessagesGetHistory.Result r) {
                int i;
                result.addAll(r.msgs);
                GetMessagesCallback getMessagesCallback = callback;
                ArrayList<Message> arrayList = result;
                if (startMsgID == 0 || offset + _numUnread <= 0) {
                    i = _numUnread > 0 ? 0 : r.offset;
                } else {
                    i = offset + _numUnread;
                }
                getMessagesCallback.onMessagesLoaded(arrayList, i);
                if ((startMsgID == 0 || ((startMsgID == -1 && _numUnread == 0) || offset + _numUnread <= 0)) && ccnt >= Math.max(0, offset + _numUnread)) {
                    Cache.addMessages(r.msgs);
                }
                if (startMsgID == 0 || startMsgID == -1) {
                    if (Messages.histories.get(Integer.valueOf(peer)) == null) {
                        Messages.histories.put(Integer.valueOf(peer), new ArrayList());
                    }
                    ArrayList ramCache2 = (ArrayList) Messages.histories.get(Integer.valueOf(peer));
                    if (ramCache2.size() > Math.max(offset + _numUnread, 0)) {
                        ramCache2.subList(Math.max(offset + _numUnread, 0), ramCache2.size()).clear();
                    }
                    if (ramCache2.size() == Math.max(offset + _numUnread, 0)) {
                        int len2 = ramCache2.size();
                        ramCache2.addAll(result);
                        Collections.reverse(ramCache2.subList(len2, result.size() + len2));
                    }
                }
                Cache.updateMessagesUnreadCount(Collections.singletonList(new Pair(Integer.valueOf(peer), Integer.valueOf(r.unread))));
                Log.i("vk", "Returinig peer " + peer + " history from network");
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                Log.i("vk", "FAIL " + error);
                callback.onError(error.getCode(), error.message);
            }
        }).execSync();
        LongPollService.addMessage.release();
    }

    public static Message send(Message m) {
        String ref = m.extras.getString("ref");
        String refSource = m.extras.getString("ref_source");
        return send(m.peer, m.text, m.attachments, m.fwdMessages, m.id, ref, refSource);
    }

    public static Message send(int peer, @Nullable String text, List<Attachment> attachments, List<?> fwd, int _id) {
        return send(peer, text, attachments, fwd, _id, null, null);
    }

    public static Message send(int peer, @Nullable String text, List<Attachment> attachments, List<?> fwd, int _id, String ref, String refSource) {
        final Message m = new Message();
        if (!TextUtils.isEmpty(ref)) {
            m.putStringExtra("ref", ref);
        }
        if (!TextUtils.isEmpty(refSource)) {
            m.putStringExtra("ref_source", refSource);
        }
        final int id = _id == 0 ? VKApplication.context.getSharedPreferences("longpoll", 0).getInt("tmp_msg_id", -1) : _id;
        if (_id == 0) {
            VKApplication.context.getSharedPreferences("longpoll", 0).edit().putInt("tmp_msg_id", id - 1).apply();
        }
        m.id = id;
        m.peer = peer;
        m.out = peer != VKAccountManager.getCurrent().getUid();
        m.sender = VKAccountManager.getCurrent().getUid();
        m.time = TimeUtils.getCurrentTime();
        m.generateRandomId();
        m.setText(text);
        m.addAttachments(attachments);
        ArrayList<Integer> fwdIds = new ArrayList<>();
        if (fwd != null) {
            for (int i = 0; i < fwd.size(); i++) {
                Object fm = fwd.get(i);
                if (fm instanceof Message) {
                    fwdIds.add(Integer.valueOf(((Message) fm).id));
                    m.addFwdMessage(((Message) fm).forward(), fwd.size());
                }
                if (fm instanceof Message.FwdMessage) {
                    fwdIds.add(Integer.valueOf(((Message.FwdMessage) fm).id));
                    m.addFwdMessage((Message.FwdMessage) fm, fwd.size());
                }
            }
        }
        GeoAttachment geo = null;
        Iterator<Attachment> it = attachments.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Attachment att = it.next();
            if (att instanceof GeoAttachment) {
                attachments.remove(att);
                geo = (GeoAttachment) att;
                break;
            }
        }
        int uploadId = -1;
        Iterator<Attachment> it2 = attachments.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Attachment att2 = it2.next();
            if (att2 instanceof PendingAttachment) {
                uploadId = ((PendingAttachment) att2).getUploadId();
                break;
            }
        }
        if (uploadId == -1) {
            LongPollService.sendingMessages.add(m);
            sendLock.increment();
            new MessagesSend(peer, m, attachments, fwdIds, geo).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.data.Messages.8
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer mid) {
                    Cache.setMessageID(m.id, m.peer, mid.intValue());
                    Intent intent = new Intent(Messages.ACTION_MESSAGE_ID_CHANGED);
                    intent.putExtra("oldID", m.id);
                    intent.putExtra("newID", mid);
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    m.id = mid.intValue();
                    m.time = TimeUtils.getCurrentTime();
                    Messages.removeFromSending(m);
                    Messages.broadcastNewMessage(m);
                    Messages.sendLock.decrement();
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Log.w("vk", "msg " + id + " failed to send with error " + error);
                    Messages.removeFromSending(m);
                    m.sendFailed = true;
                    Messages.add(m, null, VKAccountManager.getCurrent().getPhoto());
                    Intent intent = new Intent(Messages.ACTION_SEND_FAILED);
                    intent.putExtra("id", m.id);
                    if (error.getCodeValue() == 7) {
                        intent.putExtra(ShareConstants.WEB_DIALOG_PARAM_PRIVACY, true);
                    }
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    Messages.sendLock.decrement();
                }
            }).exec();
        } else {
            for (int i2 = 0; i2 < m.attachments.size(); i2++) {
                Attachment att3 = m.attachments.get(i2);
                if (att3 instanceof PendingAttachment) {
                    PendingAttachment pa = (PendingAttachment) att3;
                    if (!UploaderIntentService.hasTaskWithID(pa.getUploadId())) {
                        Context context = VKApplication.context;
                        Upload.start(context, pa.mo901createUploadTask(context));
                    } else if (UploaderIntentService.isTaskFailed(pa.getUploadId())) {
                        Upload.retry(VKApplication.context, pa.getUploadId());
                    }
                }
            }
            pendingUploads.add(new Message(m));
        }
        add(m, null, VKAccountManager.getCurrent().getPhoto());
        return m;
    }

    public static void uploadDone(int id, Attachment result) {
        Message msg = null;
        Iterator<Message> it = pendingUploads.iterator();
        while (it.hasNext()) {
            Message m = it.next();
            int i = 0;
            while (true) {
                if (i < m.attachments.size()) {
                    Attachment a = m.attachments.get(i);
                    if (!(a instanceof PendingAttachment) || ((PendingAttachment) a).getUploadId() != id) {
                        i++;
                    } else {
                        m.attachments.set(i, result);
                        add(m, null, VKApplication.context.getSharedPreferences(null, 0).getString("userphoto", ""));
                        msg = m;
                        continue;
                        break;
                    }
                }
            }
            if (msg != null) {
                break;
            }
        }
        if (msg != null) {
            for (int i2 = 0; i2 < msg.attachments.size(); i2++) {
                if (msg.attachments.get(i2) instanceof PendingAttachment) {
                    return;
                }
            }
            pendingUploads.remove(msg);
            GeoAttachment geo = null;
            ArrayList<Attachment> attachments = new ArrayList<>();
            attachments.addAll(msg.attachments);
            Iterator<Attachment> it2 = attachments.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                Attachment att = it2.next();
                if (att instanceof GeoAttachment) {
                    attachments.remove(att);
                    geo = (GeoAttachment) att;
                    break;
                }
            }
            ArrayList<Integer> fwdIds = new ArrayList<>();
            for (int i3 = 0; i3 < msg.fwdMessages.size(); i3++) {
                fwdIds.add(Integer.valueOf(msg.fwdMessages.get(i3).id));
            }
            final Message m2 = msg;
            sendLock.increment();
            LongPollService.sendingMessages.add(m2);
            new MessagesSend(msg.peer, msg, attachments, fwdIds, geo).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.data.Messages.9
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer mid) {
                    Cache.setMessageID(m2.id, m2.peer, mid.intValue());
                    Intent intent = new Intent(Messages.ACTION_MESSAGE_ID_CHANGED);
                    intent.putExtra("oldID", m2.id);
                    intent.putExtra("newID", mid);
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    m2.id = mid.intValue();
                    Messages.removeFromSending(m2);
                    Messages.broadcastNewMessage(m2);
                    Messages.sendLock.decrement();
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Messages.removeFromSending(m2);
                    m2.sendFailed = true;
                    Messages.add(m2, null, VKAccountManager.getCurrent().getPhoto());
                    Intent intent = new Intent(Messages.ACTION_SEND_FAILED);
                    intent.putExtra("id", m2.id);
                    if (error.getCodeValue() == 7) {
                        intent.putExtra(ShareConstants.WEB_DIALOG_PARAM_PRIVACY, true);
                    }
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    Messages.sendLock.decrement();
                }
            }).exec();
        }
    }

    public static void uploadFailed(int id) {
        Message msg = null;
        Iterator<Message> it = pendingUploads.iterator();
        while (it.hasNext()) {
            Message m = it.next();
            int i = 0;
            while (true) {
                if (i < m.attachments.size()) {
                    Attachment a = m.attachments.get(i);
                    if (!(a instanceof PendingAttachment) || ((PendingAttachment) a).getUploadId() != id) {
                        i++;
                    } else {
                        msg = m;
                        continue;
                        break;
                    }
                }
            }
            if (msg != null) {
                break;
            }
        }
        if (msg != null) {
            pendingUploads.remove(msg);
            removeFromSending(msg);
            msg.sendFailed = true;
            add(msg, null, VKAccountManager.getCurrent().getPhoto());
            Intent intent = new Intent(ACTION_SEND_FAILED);
            intent.putExtra("id", msg.id);
            VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        }
    }

    public static void removeFromSending(Message m) {
        Log.d("vk", "remove from sending: " + m.id);
        LongPollService.sendingMessages.remove(m);
        if (LongPollService.sendingMessages.size() == 0 && LongPollService.pendingReceivedMessages.size() > 0) {
            Iterator<Message> it = LongPollService.pendingReceivedMessages.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Message msg = it.next();
                if (msg.id == m.id) {
                    LongPollService.pendingReceivedMessages.remove(msg);
                    break;
                }
            }
            ArrayList<Message> toRemove = new ArrayList<>();
            Iterator<Message> it2 = LongPollService.pendingReceivedMessages.iterator();
            while (it2.hasNext()) {
                Message msg2 = it2.next();
                if (Cache.containsMessage(msg2.id)) {
                    toRemove.add(msg2);
                }
            }
            LongPollService.pendingReceivedMessages.removeAll(toRemove);
            if (LongPollService.pendingReceivedMessages.size() != 0) {
                Cache.addMessages(LongPollService.pendingReceivedMessages);
                Iterator<Message> it3 = LongPollService.pendingReceivedMessages.iterator();
                while (it3.hasNext()) {
                    broadcastNewMessage(it3.next());
                }
            }
        }
    }

    public static void broadcastNewMessage(Message m) {
        ArrayList<Integer> ids = new ArrayList<>();
        ids.add(Integer.valueOf(m.peer));
        if (m.peer < 2000000000) {
            Friends.getUsers(ids, Messages$$Lambda$6.lambdaFactory$(m));
        } else {
            getChatUsers(m.peer - 2000000000, Messages$$Lambda$7.lambdaFactory$(m));
        }
    }

    public static /* synthetic */ void lambda$broadcastNewMessage$6(Message m, ArrayList users) {
        Intent intent = new Intent(LongPollService.ACTION_NEW_MESSAGE);
        intent.putExtra("message", m);
        intent.putExtra("peer_id", m.peer);
        intent.putExtra("peer_profile", (Parcelable) users.get(0));
        intent.putExtra("sender_photo", VKAccountManager.getCurrent().getPhoto());
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static /* synthetic */ void lambda$broadcastNewMessage$7(Message m, ArrayList users, String title, String photo) {
        UserProfile p = new UserProfile();
        p.fullName = title;
        p.uid = m.peer;
        if (photo != null) {
            p.photo = photo;
        } else {
            p.photo = createChatPhoto(users);
        }
        Intent intent = new Intent(LongPollService.ACTION_NEW_MESSAGE);
        intent.putExtra("message", m);
        intent.putExtra("peer_id", m.peer);
        intent.putExtra("peer_profile", p);
        intent.putExtra("sender_photo", VKAccountManager.getCurrent().getPhoto());
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void getChatUsers(int chatID, GetChatUsersCallback getChatUsersCallback) {
        if (Cache.needUpdateChat(chatID)) {
            Log.w("vk", "need update chat " + chatID);
            getChatUsersFromApi(chatID, getChatUsersCallback);
            return;
        }
        new Thread(Messages$$Lambda$8.lambdaFactory$(chatID, getChatUsersCallback)).start();
    }

    public static /* synthetic */ void lambda$getChatUsers$8(int chatID, GetChatUsersCallback getChatUsersCallback) {
        ArrayList<ChatUser> users = Cache.getChatUsers(chatID);
        Log.d("vk", "get users from cache, size=" + users.size());
        if (users.size() == 0) {
            Log.d("vk", "cache returned empty list, fallback to api");
            getChatUsersFromApi(chatID, getChatUsersCallback);
        } else if (!haveUserDomains(users)) {
            Log.d("vk", "cache returned chat users without domains, fallback to api");
            getChatUsersFromApi(chatID, getChatUsersCallback);
        } else {
            String[] info = Cache.getChatInfo(chatID);
            getChatUsersCallback.onUsersLoaded(users, info[0], info[1]);
        }
    }

    private static boolean haveUserDomains(ArrayList<ChatUser> users) {
        Iterator<ChatUser> it = users.iterator();
        while (it.hasNext()) {
            ChatUser cu = it.next();
            if (cu.user != null && (cu.user.domain == null || cu.user.domain.isEmpty())) {
                return false;
            }
        }
        return true;
    }

    private static void getChatUsersFromApi(final int chatID, final GetChatUsersCallback getChatUsersCallback) {
        new MessagesGetChat(chatID).setCallback(new Callback<MessagesGetChat.Result>() { // from class: com.vkontakte.android.data.Messages.10
            @Override // com.vkontakte.android.api.Callback
            public void success(MessagesGetChat.Result r) {
                Log.i("vk", "chat users loaded");
                UserProfile p = new UserProfile();
                p.uid = chatID + 2000000000;
                p.fullName = r.title;
                p.photo = r.photo;
                p.online = r.adminID;
                Bundle x = new Bundle();
                x.putInt("dnd", r.dnd);
                x.putBoolean("mute", r.mute);
                p.extra = x;
                ArrayList<UserProfile> al = new ArrayList<>();
                al.add(p);
                Cache.updatePeers(al, false);
                Cache.updateChat(chatID, r.title, r.users, r.photo);
                getChatUsersCallback.onUsersLoaded(r.users, r.title, r.photo);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                ArrayList<ChatUser> users = new ArrayList<>();
                if (error.getCodeValue() == 100) {
                    Cache.updateChat(chatID, null, users, null);
                }
                getChatUsersCallback.onUsersLoaded(users, null, null);
            }
        }).exec();
    }

    public static void markAsRead(final ArrayList<Integer> ids) {
        new MessagesMarkAsRead(ids).setCallback(new ResultlessCallback() { // from class: com.vkontakte.android.data.Messages.11
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Iterator it = ids.iterator();
                while (it.hasNext()) {
                    int id = ((Integer) it.next()).intValue();
                    Intent intent = new Intent(LongPollService.ACTION_MESSAGE_RSTATE_CHANGED);
                    intent.putExtra(LongPollService.EXTRA_MSG_ID, id);
                    intent.putExtra(LongPollService.EXTRA_READ_STATE, true);
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                }
            }
        }).exec();
    }

    public static void markAsRead(final int peer, final int id) {
        new MessagesMarkAsRead(peer, id).setCallback(new ResultlessCallback() { // from class: com.vkontakte.android.data.Messages.12
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Messages.setReadStateBefore(peer, id);
            }
        }).exec();
    }

    public static void deleteMessageLocally(int mid) {
        Cache.deleteMessages(Collections.singletonList(Integer.valueOf(mid)));
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        Iterator<DialogEntry> it = dialogs.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            final DialogEntry d = it.next();
            if (d.lastMessage.id == mid) {
                dialogs.remove(d);
                getHistory(d.profile.uid, 0, 1, 0, new GetMessagesCallback() { // from class: com.vkontakte.android.data.Messages.13
                    @Override // com.vkontakte.android.data.Messages.GetMessagesCallback
                    public void onMessagesLoaded(ArrayList<Message> msgs, int offsetFromEnd) {
                        if (msgs.size() > 0) {
                            d.lastMessage = msgs.get(0);
                            if (d.profile.uid > 2000000000) {
                                d.lastMessagePhoto = Friends.getUsersBlocking(Collections.singletonList(Integer.valueOf(d.lastMessage.sender))).get(0).photo;
                            }
                            int prevTime = Integer.MAX_VALUE;
                            int i = 0;
                            while (true) {
                                if (i < Messages.dialogs.size()) {
                                    if (d.lastMessage.time < prevTime || ((DialogEntry) Messages.dialogs.get(i)).lastMessage.time > d.lastMessage.time) {
                                        prevTime = ((DialogEntry) Messages.dialogs.get(i)).lastMessage.time;
                                        i++;
                                    } else {
                                        Messages.dialogs.add(Math.max(i - 1, 0), d);
                                        break;
                                    }
                                } else {
                                    break;
                                }
                            }
                        }
                        Intent intent = new Intent(LongPollService.ACTION_REFRESH_DIALOGS_LIST);
                        intent.putExtra("no_refresh_chat", true);
                        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    }

                    @Override // com.vkontakte.android.data.Messages.GetMessagesCallback
                    public void onError(int code, String msg) {
                    }
                });
                break;
            }
        }
        updateLock.release();
    }

    public static void delete(List<Integer> _ids, boolean onlyLocal) {
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        Map<Integer, ArrayList<Message>> histories2 = histories.snapshot();
        Set<Integer> cachedChats = histories2.keySet();
        for (Integer num : cachedChats) {
            int peer = num.intValue();
            Iterator<Message> history = histories2.get(Integer.valueOf(peer)).iterator();
            while (history.hasNext()) {
                Message msg = history.next();
                if (_ids.contains(Integer.valueOf(msg.id))) {
                    history.remove();
                }
            }
        }
        updateLock.release();
        ArrayList<Integer> failed = new ArrayList<>();
        final ArrayList<Integer> ids = new ArrayList<>();
        ids.addAll(_ids);
        Iterator<Integer> it = ids.iterator();
        while (it.hasNext()) {
            int id = it.next().intValue();
            if (id < 0) {
                failed.add(Integer.valueOf(id));
            }
        }
        Cache.deleteMessages(failed);
        Iterator<Integer> it2 = failed.iterator();
        while (it2.hasNext()) {
            int id2 = it2.next().intValue();
            Intent intent = new Intent(LongPollService.ACTION_MESSAGE_DELETED);
            intent.putExtra(LongPollService.EXTRA_MSG_ID, id2);
            VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        }
        ids.removeAll(failed);
        if (ids.size() > 0 && !onlyLocal) {
            new MessagesDelete(ids).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.data.Messages.14
                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    Cache.deleteMessages(ids);
                }
            }).exec();
        }
    }

    public static int getChatAdmin(int chatID) {
        return Cache.getChatAdmin(chatID);
    }

    public static void applyActions(ArrayList<MessagesAction> actions) {
        Friends.GetUsersCallback getUsersCallback;
        Cache.applyMessagesActions(actions);
        histories.evictAll();
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        dialogs.clear();
        dialogs.addAll(Cache.getDialogs(0, 20));
        ArrayList<Integer> uids = new ArrayList<>();
        Iterator<DialogEntry> it = dialogs.iterator();
        while (it.hasNext()) {
            DialogEntry e2 = it.next();
            if (e2.profile.uid > 2000000000 && !e2.lastMessage.out && !uids.contains(Integer.valueOf(e2.lastMessage.sender))) {
                uids.add(Integer.valueOf(e2.lastMessage.sender));
            }
            if (e2.profile.uid < 2000000000 && e2.profile.photo == null && !uids.contains(Integer.valueOf(e2.profile.uid))) {
                uids.add(Integer.valueOf(e2.profile.uid));
            }
        }
        updateLock.release();
        getUsersCallback = Messages$$Lambda$9.instance;
        Friends.getUsers(uids, getUsersCallback);
    }

    public static /* synthetic */ void lambda$applyActions$9(ArrayList users) {
        Log.i("vk", "On users loaded " + users);
        SparseArray<UserProfile> u = new SparseArray<>();
        Iterator it = users.iterator();
        while (it.hasNext()) {
            UserProfile p = (UserProfile) it.next();
            u.put(p.uid, p);
        }
        Log.d("vk", "U=" + u);
        try {
            updateLock.acquire();
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        Iterator<DialogEntry> it2 = dialogs.iterator();
        while (it2.hasNext()) {
            DialogEntry e2 = it2.next();
            if (e2.profile.uid > 2000000000 && !e2.lastMessage.out) {
                if (Utils.containsKey(u, e2.lastMessage.sender)) {
                    e2.lastMessagePhoto = u.get(e2.lastMessage.sender).photo;
                } else {
                    Log.e("vk", "Can't find photo for " + e2.lastMessage.sender);
                }
            }
            if (e2.profile.uid < 2000000000 && e2.profile.photo == null) {
                if (Utils.containsKey(u, e2.profile.uid)) {
                    e2.profile = u.get(e2.profile.uid);
                } else {
                    Log.e("vk", "Can't find profile for " + e2.profile.uid);
                }
            }
        }
        updateLock.release();
    }

    public static void reset() {
        VKApplication.context.getSharedPreferences("longpoll", 0).edit().putInt("pts", 0).commit();
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        dialogs.clear();
        updateLock.release();
        histories.evictAll();
        pendingUploads.clear();
    }

    public static void removeDialog(int peer) {
        Cache.deleteDialog(peer);
        histories.remove(Integer.valueOf(peer));
        try {
            updateLock.acquire();
        } catch (Exception e) {
        }
        Iterator<DialogEntry> itr = dialogs.iterator();
        while (true) {
            if (!itr.hasNext()) {
                break;
            }
            DialogEntry e2 = itr.next();
            if (e2.profile.uid == peer) {
                itr.remove();
                break;
            }
        }
        updateLock.release();
    }

    public static void resetCache() {
        Cache.deleteAllMessages();
        if (loadDlgsReq != null) {
            loadDlgsReq.cancel();
            loadDlgsReq = null;
        }
    }

    public static long getLastUpdated() {
        if (lastUpdated == -1) {
            lastUpdated = VKApplication.context.getSharedPreferences("msg", 0).getLong(ServerKeys.UPDATED, lastUpdated);
        }
        return lastUpdated;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.data.Messages$15 */
    /* loaded from: classes2.dex */
    public static class AnonymousClass15 implements Callback<MessagesSearch.Result> {
        final /* synthetic */ SearchCallback val$callback;

        AnonymousClass15(SearchCallback searchCallback) {
            this.val$callback = searchCallback;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(MessagesSearch.Result r) {
            ArrayList<Integer> uids = new ArrayList<>();
            Iterator it = r.msgs.iterator();
            while (it.hasNext()) {
                Message m = (Message) it.next();
                if (!uids.contains(Integer.valueOf(m.peer)) && m.peer < 2000000000) {
                    uids.add(Integer.valueOf(m.peer));
                }
                if (!uids.contains(Integer.valueOf(m.sender))) {
                    uids.add(Integer.valueOf(m.sender));
                }
            }
            Iterator<UserProfile> it2 = r.chats.iterator();
            while (it2.hasNext()) {
                UserProfile c = it2.next();
                if (c.photo.startsWith("M")) {
                    String[] ids = c.photo.split(",");
                    for (int i = 1; i < ids.length; i++) {
                        try {
                            int uid = Integer.parseInt(ids[i]);
                            if (!uids.contains(Integer.valueOf(uid))) {
                                uids.add(Integer.valueOf(uid));
                            }
                        } catch (Exception e) {
                        }
                    }
                }
            }
            Friends.getUsers(uids, Messages$15$$Lambda$1.lambdaFactory$(r, this.val$callback));
        }

        public static /* synthetic */ void lambda$success$0(MessagesSearch.Result r, SearchCallback callback, ArrayList users) {
            SparseArray<UserProfile> u = new SparseArray<>();
            Iterator it = users.iterator();
            while (it.hasNext()) {
                UserProfile p = (UserProfile) it.next();
                u.put(p.uid, p);
            }
            Iterator<UserProfile> it2 = r.chats.iterator();
            while (it2.hasNext()) {
                UserProfile c = it2.next();
                if (c.photo.startsWith("M")) {
                    String[] ids = c.photo.split(",");
                    ArrayList<String> ph = new ArrayList<>();
                    ph.add("M");
                    for (int i = 1; i < ids.length; i++) {
                        try {
                            int uid = Integer.parseInt(ids[i]);
                            ph.add(u.get(uid).photo);
                        } catch (Exception x) {
                            L.e(x, new Object[0]);
                        }
                    }
                    c.photo = TextUtils.join("|", ph);
                }
                u.put(c.uid, c);
            }
            ArrayList<DialogEntry> result = new ArrayList<>();
            Iterator it3 = r.msgs.iterator();
            while (it3.hasNext()) {
                Message m = (Message) it3.next();
                DialogEntry e = new DialogEntry();
                e.lastMessage = m;
                e.lastMessagePhoto = u.get(m.sender).photo;
                e.profile = u.get(m.peer);
                if (e.profile == null) {
                    e.profile = new UserProfile();
                    e.profile.uid = m.peer;
                }
                result.add(e);
            }
            if (callback != null) {
                callback.onDialogsLoaded(result, r.msgs.total());
            }
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            if (this.val$callback != null) {
                this.val$callback.onError(error.getCode(), error.message);
            }
        }
    }

    public static void search(String q, int offset, int count, SearchCallback callback) {
        new MessagesSearch(q, offset, count).setCallback(new AnonymousClass15(callback)).exec();
    }

    public static void searchDialogs(@NonNull String query, @Nullable final SearchDialogsCallback callback) {
        new MessagesSearchDialogs(query).setCallback(new Callback<ArrayList<UserProfile>>() { // from class: com.vkontakte.android.data.Messages.16
            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<UserProfile> result) {
                if (callback != null) {
                    callback.onResult(result);
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (callback != null) {
                    callback.onError(error.getCode(), error.message);
                }
            }
        }).exec();
    }

    public static Bitmap createShortcutIcon(String url) {
        ActivityManager am = (ActivityManager) VKApplication.context.getSystemService("activity");
        int iconSize = am.getLauncherLargeIconSize();
        Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getBitmap(Uri.parse(url)));
        Bitmap icon = Bitmap.createBitmap(iconSize, iconSize, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(icon);
        Paint paint = new Paint();
        paint.setColor(ViewCompat.MEASURED_STATE_MASK);
        paint.setAntiAlias(true);
        paint.setFilterBitmap(true);
        c.drawColor(ViewCompat.MEASURED_STATE_MASK, PorterDuff.Mode.CLEAR);
        c.drawRoundRect(new RectF(0.0f, 0.0f, c.getWidth(), c.getHeight()), c.getWidth() / 2, c.getWidth() / 2, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        c.drawBitmap(photo, (Rect) null, new Rect(0, 0, c.getWidth(), c.getHeight()), paint);
        return icon;
    }

    public static Intent getShortcutIntent(UserProfile profile) {
        Bitmap icon = createShortcutIcon(profile.photo);
        Intent sIntent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/write" + profile.uid));
        sIntent.addFlags(268435456);
        Intent intent = new Intent("com.android.launcher.action.INSTALL_SHORTCUT");
        intent.putExtra("android.intent.extra.shortcut.INTENT", sIntent);
        intent.putExtra("android.intent.extra.shortcut.NAME", profile.fullName);
        intent.putExtra("android.intent.extra.shortcut.ICON", icon);
        return intent;
    }

    public static String createChatPhoto(ArrayList<ChatUser> users) {
        Uri.Builder bldr = new Uri.Builder();
        bldr.scheme(AvatarDataSource.CHAT_AVATAR_SCHEME).authority("c");
        ArrayList<String> pp = new ArrayList<>();
        for (int i = 0; i < users.size(); i++) {
            ChatUser cu = users.get(i);
            if (cu.user.uid != VKAccountManager.getCurrent().getUid() && !pp.contains(cu.user.photo)) {
                pp.add(cu.user.photo);
                if (pp.size() == 4) {
                    break;
                }
            }
        }
        int i2 = 0;
        Iterator<String> it = pp.iterator();
        while (it.hasNext()) {
            String photo = it.next();
            bldr.appendQueryParameter("photo" + i2, photo);
            i2++;
        }
        return bldr.build().toString();
    }

    public static void setDnd(int peer, int time, boolean mute) {
    }
}
