package com.vkontakte.android.data;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.SearchIndexer;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsGet;
import com.vkontakte.android.api.groups.GroupsJoin;
import com.vkontakte.android.api.groups.GroupsLeave;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.GroupsCache;
import com.vkontakte.android.functions.Predicate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Groups {
    public static final String ACTION_GROUP_INVITES_CHANGED = "com.vkontakte.android.GROUP_INVITES_CHANGED";
    public static final String ACTION_GROUP_LIST_CHANGED = "com.vkontakte.android.GROUP_LIST_CHANGED";
    public static final String ACTION_GROUP_STATUS_CHANGED = "com.vkontakte.android.ACTION_GROUP_STATUS_CHANGED";
    private static ArrayList<Group> groups = new ArrayList<>();
    private static SearchIndexer<Group> index = new SearchIndexer<>();
    private static ExecutorService executor = Executors.newSingleThreadExecutor();

    /* loaded from: classes2.dex */
    public interface GetGroupsCallback {
        void onError();

        void onResult(@NonNull List<Group> list);
    }

    /* loaded from: classes2.dex */
    public enum JoinType {
        ACCEPT,
        UNSURE,
        DECLINE
    }

    /* loaded from: classes2.dex */
    public interface SearchGroupsCallback {
        void onResult(@NonNull List<Group> list);
    }

    public static void reload(final boolean forceNetwork) {
        Log.i("vk", "RELOAD GROUPS " + forceNetwork);
        new Thread(new Runnable() { // from class: com.vkontakte.android.data.Groups.1
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<Group> result = new ArrayList<>();
                if (!forceNetwork) {
                    result.addAll(GroupsCache.get());
                }
                if (!forceNetwork && result.size() != 0) {
                    ArrayList unused = Groups.groups = result;
                } else {
                    new GroupsGet(VKAccountManager.getCurrent().getUid()).setCallback(new Callback<ArrayList<Group>>() { // from class: com.vkontakte.android.data.Groups.1.1
                        {
                            AnonymousClass1.this = this;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void success(ArrayList<Group> list) {
                            Groups.groups.clear();
                            Groups.groups.addAll(list);
                            GroupsCache.replace(list);
                            Groups.index.bind(Groups.groups);
                            Groups.index.build();
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                            Groups.groups.clear();
                            Groups.groups.addAll(GroupsCache.get());
                            Groups.index.bind(Groups.groups);
                            Groups.index.build();
                        }
                    }).execSync();
                }
                Groups.index.bind(Groups.groups);
                Groups.index.build();
                VKApplication.context.sendBroadcast(new Intent(Groups.ACTION_GROUP_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
            }
        }).start();
    }

    public static void addGroup(Group group, boolean sendGlobalNotify) {
        groups.add(group);
        GroupsCache.add(group, VKApplication.context);
        index.bind(groups);
        index.build();
        if (sendGlobalNotify) {
            VKApplication.context.sendBroadcast(new Intent(ACTION_GROUP_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
        }
    }

    public static void getGroups(ArrayList<Group> out) {
        out.addAll(groups);
    }

    public static void getAdminedGroups(ArrayList<Group> out) {
        for (int i = 0; i < groups.size(); i++) {
            Group g = groups.get(i);
            if (g.isAdmin) {
                out.add(g);
            }
        }
    }

    public static void getAdminedGroups(ArrayList<Group> out, int minLevel) {
        for (int i = 0; i < groups.size(); i++) {
            Group g = groups.get(i);
            if (g.adminLevel >= minLevel) {
                out.add(g);
            }
        }
    }

    public static boolean isGroupMember(int gid) {
        Iterator<Group> it = groups.iterator();
        while (it.hasNext()) {
            Group g = it.next();
            if (g.id == gid) {
                return true;
            }
        }
        return false;
    }

    public static boolean isGroupAdmin(int gid) {
        Iterator<Group> it = groups.iterator();
        while (it.hasNext()) {
            Group g = it.next();
            if (g.id == gid) {
                Log.i("vk", "is group admin " + gid + " -> " + g.isAdmin);
                return g.isAdmin;
            }
        }
        return false;
    }

    public static Group getById(int gid) {
        Iterator<Group> it = groups.iterator();
        while (it.hasNext()) {
            Group g = it.next();
            if (g.id == gid) {
                return g;
            }
        }
        return null;
    }

    public static int getAdminLevel(int gid) {
        Iterator<Group> it = groups.iterator();
        while (it.hasNext()) {
            Group g = it.next();
            if (g.id == gid) {
                return g.adminLevel;
            }
        }
        return 0;
    }

    public static void reset() {
        groups.clear();
        index = new SearchIndexer<>();
    }

    public static List<Group> search(String q) {
        return index.search(q);
    }

    public static void resultFromApi(JSONObject resp, JSONObject data) {
        try {
            reload(true);
        } catch (Exception e) {
        }
    }

    public static ResultlessAPIRequest joinGroup(Group group, JoinType type) {
        if (type == JoinType.DECLINE) {
            return new GroupsLeave(group.id);
        }
        return new GroupsJoin(group.id, type == JoinType.UNSURE);
    }

    public static void notifyGroupStatusChanged(int id, int status) {
        VKApplication.context.sendBroadcast(new Intent(ACTION_GROUP_STATUS_CHANGED).putExtra("id", id).putExtra("status", status), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void decreaseInvites() {
        LongPollService.setNumGroupInvitations(LongPollService.getNumGroupInvitations() - 1);
        VKApplication.context.sendBroadcast(new Intent(ACTION_GROUP_INVITES_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void getGroups(int adminLevel, @Nullable GetGroupsCallback callback) {
        if (groups.size() == 0) {
            executor.submit(Groups$$Lambda$1.lambdaFactory$(callback, adminLevel));
        } else if (callback != null) {
            ArrayList<Group> result = new ArrayList<>();
            getAdminedGroups(result, adminLevel);
            callback.onResult(result);
        }
    }

    public static /* synthetic */ void lambda$getGroups$0(@Nullable GetGroupsCallback callback, int adminLevel) {
        List<Group> cached = GroupsCache.get();
        final AtomicBoolean err = new AtomicBoolean();
        if (cached != null && cached.size() > 0) {
            groups.addAll(cached);
        } else {
            new GroupsGet(VKAccountManager.getCurrent().getUid()).setCallback(new Callback<ArrayList<Group>>() { // from class: com.vkontakte.android.data.Groups.2
                @Override // com.vkontakte.android.api.Callback
                public void success(ArrayList<Group> arrayList) {
                    Groups.groups.clear();
                    Groups.groups.addAll(arrayList);
                    GroupsCache.replace(arrayList);
                    Groups.index.bind(Groups.groups);
                    Groups.index.build();
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    Groups.groups.clear();
                    Groups.groups.addAll(GroupsCache.get());
                    Groups.index.bind(Groups.groups);
                    Groups.index.build();
                    err.set(true);
                }
            }).execSync();
        }
        index.bind(groups);
        index.build();
        VKApplication.context.sendBroadcast(new Intent(ACTION_GROUP_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
        if (callback != null) {
            if (err.get()) {
                callback.onError();
                return;
            }
            ArrayList<Group> result = new ArrayList<>();
            getAdminedGroups(result, adminLevel);
            callback.onResult(result);
        }
    }

    public static void search(@Nullable String query, int minLevel, @Nullable SearchGroupsCallback callback) {
        executor.submit(Groups$$Lambda$2.lambdaFactory$(callback, query, minLevel));
    }

    public static /* synthetic */ void lambda$search$2(@Nullable SearchGroupsCallback callback, @Nullable String query, int minLevel) {
        if (callback != null) {
            ArrayList<Group> result = new ArrayList<>(search(query));
            filter(result, Groups$$Lambda$3.lambdaFactory$(minLevel));
            callback.onResult(result);
        }
    }

    public static /* synthetic */ boolean lambda$null$1(int minLevel, Group g) {
        return g.deactivation != null && g.adminLevel < minLevel;
    }

    private static void filter(@NonNull ArrayList<Group> groups2, @NonNull Predicate<Group> p) {
        Iterator<Group> iterator = groups2.iterator();
        while (iterator.hasNext()) {
            if (p.f(iterator.next())) {
                iterator.remove();
            }
        }
    }
}
