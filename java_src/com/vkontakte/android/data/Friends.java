package com.vkontakte.android.data;

import android.content.Intent;
import android.preference.PreferenceManager;
import android.util.LruCache;
import android.util.SparseArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.SearchIndexer;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.friends.FriendsGet;
import com.vkontakte.android.api.users.UsersGet;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Semaphore;
/* loaded from: classes2.dex */
public class Friends {
    public static final String ACTION_FRIEND_COUNTER_CHANGED = "com.vkontakte.android.FRIEND_COUNTER_CHANGED";
    public static final String ACTION_FRIEND_LIST_CHANGED = "com.vkontakte.android.FRIEND_LIST_CHANGED";
    public static final String ACTION_FRIEND_REQUESTS_CHANGED = "com.vkontakte.android.FRIEND_REQUESTS_CHANGED";
    public static final String ACTION_FRIEND_STATUS_CHANGED = "com.vkontakte.android.ACTION_FRIEND_STATUS_CHANGED";
    public static final int CASE_ABL = 5;
    public static final int CASE_ABL_FIRST = 15;
    public static final int CASE_ACC = 3;
    public static final int CASE_ACC_FIRST = 13;
    public static final int CASE_DAT = 2;
    public static final int CASE_DAT_FIRST = 12;
    public static final int CASE_GEN = 1;
    public static final int CASE_GEN_FIRST = 11;
    public static final int CASE_INS = 4;
    public static final int CASE_INS_FIRST = 14;
    public static final int CASE_NOM = 0;
    public static final int CASE_NOM_FIRST = 10;
    private static final boolean DEBUG = false;
    public static final int IMPORT_SERVICE_CONTACTS = 0;
    public static final int IMPORT_SERVICE_FACEBOOK = 2;
    public static final int IMPORT_SERVICE_GOOGLE = 1;
    public static final int IMPORT_SERVICE_MAIL = 3;
    private static final int SORT_FIRST = 1;
    private static final int SORT_HINTS = 0;
    private static final int SORT_LAST = 2;
    private static ArrayList<UserProfile> friends;
    private static ArrayList<Integer> hints = new ArrayList<>();
    private static ArrayList<Folder> lists = new ArrayList<>();
    private static LruCache<Integer, UserProfile> users = new LruCache<>(100);
    private static SearchIndexer<UserProfile> index = new SearchIndexer<>();
    private static boolean loadedOnlines = false;
    private static Semaphore semaphore = new Semaphore(1, true);
    private static boolean loading = false;
    private static ArrayList<Section> sections = new ArrayList<>();
    private static boolean sorting = false;

    /* loaded from: classes2.dex */
    public interface GetImportedContactsCallback {
        void onUsersLoaded(ArrayList<UserProfile> arrayList, ArrayList<UserProfile> arrayList2);
    }

    /* loaded from: classes2.dex */
    public interface GetUsersCallback {
        void onUsersLoaded(ArrayList<UserProfile> arrayList);
    }

    /* loaded from: classes2.dex */
    public enum Request {
        IN,
        OUT,
        SUGGEST
    }

    /* loaded from: classes2.dex */
    public static class Section {
        public List<UserProfile> list;
        public int startPos;
        public String title;
    }

    static {
        friends = Cache.getFriends();
        friends = new ArrayList<>();
    }

    public static void reload(final boolean forceNetwork) {
        Log.d("vk", "RELOAD FRIENDS " + forceNetwork);
        if (!loading) {
            new Thread(new Runnable() { // from class: com.vkontakte.android.data.Friends.1
                @Override // java.lang.Runnable
                public void run() {
                    ArrayList<UserProfile> result = new ArrayList<>();
                    if (!forceNetwork) {
                        result = Cache.getFriends();
                        ArrayList unused = Friends.lists = Cache.getFriendLists();
                    }
                    if (forceNetwork || result.size() == 0) {
                        boolean unused2 = Friends.loading = true;
                        new FriendsGet(VKAccountManager.getCurrent().getUid(), false).setCallback(new Callback<FriendsGet.Result>() { // from class: com.vkontakte.android.data.Friends.1.1
                            @Override // com.vkontakte.android.api.Callback
                            public void success(FriendsGet.Result result2) {
                                try {
                                    Friends.semaphore.acquire();
                                } catch (Exception e) {
                                }
                                Friends.friends.clear();
                                Friends.friends.addAll(result2.friends);
                                Friends.semaphore.release();
                                Friends.hints.clear();
                                for (UserProfile p : result2.friends) {
                                    Friends.hints.add(Integer.valueOf(p.uid));
                                }
                                Cache.updateFriends(result2.friends, true);
                                Friends.index.bind(Friends.friends);
                                Friends.updateIndex();
                                Friends.updateSorting();
                                Friends.lists.clear();
                                Friends.lists.addAll(result2.lists);
                                Cache.updateFriendLists(Friends.lists, true);
                                VKApplication.context.sendBroadcast(new Intent(Friends.ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
                                boolean unused3 = Friends.loadedOnlines = true;
                                boolean unused4 = Friends.loading = false;
                            }

                            @Override // com.vkontakte.android.api.Callback
                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                ArrayList unused3 = Friends.friends = Cache.getFriends();
                                ArrayList unused4 = Friends.lists = Cache.getFriendLists();
                                Log.w("vk", "reload friends failed, got " + Friends.friends.size() + " from cache");
                                Friends.index.bind(Friends.friends);
                                Friends.updateIndex();
                                Friends.updateSorting();
                                VKApplication.context.sendBroadcast(new Intent(Friends.ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
                                boolean unused5 = Friends.loadedOnlines = true;
                                boolean unused6 = Friends.loading = false;
                            }
                        }).setBackground(true).exec();
                        return;
                    }
                    try {
                        Friends.semaphore.acquire();
                    } catch (Exception e) {
                    }
                    HashMap<Integer, Integer> onlines = new HashMap<>();
                    Iterator it = Friends.friends.iterator();
                    while (it.hasNext()) {
                        UserProfile p = (UserProfile) it.next();
                        onlines.put(Integer.valueOf(p.uid), Integer.valueOf(p.online));
                    }
                    ArrayList unused3 = Friends.friends = result;
                    Iterator it2 = Friends.friends.iterator();
                    while (it2.hasNext()) {
                        UserProfile p2 = (UserProfile) it2.next();
                        if (onlines.containsKey(Integer.valueOf(p2.uid))) {
                            p2.online = onlines.get(Integer.valueOf(p2.uid)).intValue();
                        }
                    }
                    Friends.semaphore.release();
                    Friends.index.bind(Friends.friends);
                    Friends.updateIndex();
                    Friends.updateSorting();
                    VKApplication.context.sendBroadcast(new Intent(Friends.ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateIndex() {
        index.build();
        index.add(new UserProfile(VKAccountManager.getCurrent()));
    }

    public static boolean isFriend(int uid) {
        Iterator<UserProfile> it = friends.iterator();
        while (it.hasNext()) {
            UserProfile user = it.next();
            if (user != null && user.uid == uid) {
                return true;
            }
        }
        return false;
    }

    public static void getFriends(ArrayList<UserProfile> out) {
        if (!loadedOnlines && NetworkStateReceiver.isConnected()) {
            reload(true);
        }
        out.addAll(friends);
    }

    public static void getFriends(ArrayList<UserProfile> out, int count) {
        if (!loadedOnlines && NetworkStateReceiver.isConnected()) {
            reload(true);
        }
        int count2 = Math.min(count, friends.size());
        for (int i = 0; i < count2; i++) {
            out.add(friends.get(i));
        }
    }

    public static int getOnlineStatus(int uid) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        Iterator<UserProfile> it = friends.iterator();
        while (it.hasNext()) {
            UserProfile user = it.next();
            if (user.uid == uid) {
                semaphore.release();
                return user.online;
            }
        }
        semaphore.release();
        return 0;
    }

    public static UserProfile get(int uid) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        Iterator<UserProfile> it = friends.iterator();
        while (it.hasNext()) {
            UserProfile user = it.next();
            if (user.uid == uid) {
                semaphore.release();
                return user;
            }
        }
        semaphore.release();
        return null;
    }

    public static UserProfile getFromAll(int uid) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        Iterator<UserProfile> it = friends.iterator();
        while (it.hasNext()) {
            UserProfile user = it.next();
            if (user.uid == uid) {
                semaphore.release();
                return user;
            }
        }
        semaphore.release();
        UserProfile p = users.get(Integer.valueOf(uid));
        if (p == null) {
            ArrayList<UserProfile> fromCache = Cache.getUsers(Arrays.asList(Integer.valueOf(uid)), false);
            if (fromCache.size() > 0) {
                UserProfile p2 = fromCache.get(0);
                users.put(Integer.valueOf(p2.uid), p2);
                return p2;
            }
            ArrayList<UserProfile> pp = Cache.getUsers(Arrays.asList(Integer.valueOf(uid)), true);
            if (pp.size() > 0) {
                UserProfile p3 = pp.get(0);
                users.put(Integer.valueOf(p3.uid), p3);
                return p3;
            }
            return null;
        }
        return p;
    }

    public static void addLocally(UserProfile user) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        friends.add(user);
        semaphore.release();
        ArrayList<UserProfile> al = new ArrayList<>();
        al.add(user);
        hints.add(Math.min(hints.size(), 4), Integer.valueOf(user.uid));
        Cache.updateFriends(al, false);
        index.add(user);
        VKApplication.context.sendBroadcast(new Intent(ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void removeLocally(int uid) {
        UserProfile p = get(uid);
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        friends.remove(p);
        hints.remove(Integer.valueOf(uid));
        semaphore.release();
        Cache.removeFriend(uid);
        updateIndex();
        VKApplication.context.sendBroadcast(new Intent(ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void setOnlines(ArrayList<Integer> onlines, ArrayList<Integer> mobileOnlines) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        Iterator<UserProfile> it = friends.iterator();
        while (it.hasNext()) {
            UserProfile user = it.next();
            if (onlines.contains(Integer.valueOf(user.uid))) {
                user.online = 1;
            } else if (mobileOnlines.contains(Integer.valueOf(user.uid))) {
                user.online = 3;
            } else {
                user.online = 0;
            }
        }
        semaphore.release();
    }

    public static void setOnlineStatus(int uid, int status) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        Iterator<UserProfile> it = friends.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            UserProfile user = it.next();
            if (user.uid == uid) {
                user.online = status;
                break;
            }
        }
        semaphore.release();
    }

    public static void intersect(ArrayList<UserProfile> list, ArrayList<UserProfile> result) {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        ArrayList<Integer> uids = new ArrayList<>();
        Iterator<UserProfile> it = friends.iterator();
        while (it.hasNext()) {
            uids.add(Integer.valueOf(it.next().uid));
        }
        semaphore.release();
        Iterator<UserProfile> it2 = list.iterator();
        while (it2.hasNext()) {
            UserProfile p = it2.next();
            if (uids.contains(Integer.valueOf(p.uid))) {
                result.add(p);
            }
        }
    }

    private static UserProfile getGroup(int gid) {
        Group g = Groups.getById(Math.abs(gid));
        if (g == null) {
            return null;
        }
        UserProfile user = new UserProfile();
        user.uid = -g.id;
        user.fullName = g.name;
        user.photo = g.photo;
        return user;
    }

    public static void getUsers(Collection<Integer> uids, GetUsersCallback callback) {
        getUsers(uids, callback, 0);
    }

    public static void getUsers(Collection<Integer> uids, final GetUsersCallback callback, final int nameCase) {
        final ArrayList<Integer> ids = new ArrayList<>();
        ids.addAll(uids);
        ids.remove((Object) 0);
        final ArrayList<UserProfile> profiles = new ArrayList<>();
        for (Integer num : uids) {
            int uid = num.intValue();
            UserProfile p = (uid > 0 || uid < -2000000000) ? users.get(Integer.valueOf((nameCase << 24) | uid)) : getGroup(uid);
            if (p != null && !Utils.isBlank(p.fullName)) {
                profiles.add(p);
                ids.remove(Integer.valueOf(p.uid));
            }
        }
        if (nameCase == 0) {
            for (Integer num2 : uids) {
                int uid2 = num2.intValue();
                if (uid2 >= 0) {
                    Iterator<UserProfile> it = friends.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        UserProfile p2 = it.next();
                        if (p2 != null && p2.uid == uid2) {
                            profiles.add(p2);
                            ids.remove(Integer.valueOf(p2.uid));
                            break;
                        }
                    }
                }
            }
        }
        if (ids.size() == 0) {
            callback.onUsersLoaded(profiles);
        } else {
            new Thread(new Runnable() { // from class: com.vkontakte.android.data.Friends.2
                @Override // java.lang.Runnable
                public void run() {
                    if (ids.size() > 0) {
                        ArrayList<UserProfile> fromCache = Cache.getUsers(ids, false, nameCase);
                        profiles.addAll(fromCache);
                        Iterator<UserProfile> it2 = fromCache.iterator();
                        while (it2.hasNext()) {
                            UserProfile p3 = it2.next();
                            if (!Utils.isBlank(p3.fullName)) {
                                ids.remove(Integer.valueOf(p3.uid));
                                Friends.users.put(Integer.valueOf(p3.uid | (nameCase << 24)), p3);
                            }
                        }
                    }
                    if (ids.size() > 0) {
                        boolean success = false;
                        final int[] retriesLeft = {3};
                        while (retriesLeft[0] > 0 && !success) {
                            success = new UsersGet(ids, nameCase).setCallback(new Callback<ArrayList<UserProfile>>() { // from class: com.vkontakte.android.data.Friends.2.1
                                @Override // com.vkontakte.android.api.Callback
                                public void success(ArrayList<UserProfile> r) {
                                    Cache.updatePeers(r, true, nameCase);
                                    Iterator<UserProfile> it3 = r.iterator();
                                    while (it3.hasNext()) {
                                        UserProfile p4 = it3.next();
                                        Friends.users.put(Integer.valueOf(p4.uid | (nameCase << 24)), p4);
                                    }
                                    profiles.addAll(r);
                                }

                                @Override // com.vkontakte.android.api.Callback
                                public void fail(VKAPIRequest.VKErrorResponse err) {
                                    ArrayList<UserProfile> fromCache2 = Cache.getUsers(ids, true, nameCase);
                                    profiles.addAll(fromCache2);
                                    int[] iArr = retriesLeft;
                                    iArr[0] = iArr[0] - 1;
                                }
                            }).execSync();
                        }
                    }
                    callback.onUsersLoaded(profiles);
                }
            }).start();
        }
    }

    public static ArrayList<UserProfile> getUsersBlocking(List<Integer> uids) {
        return getUsersBlocking(uids, 0);
    }

    public static ArrayList<UserProfile> getUsersBlocking(List<Integer> uids, int nameCase) {
        final ArrayList<UserProfile> result = new ArrayList<>();
        if (uids.size() != 0) {
            final Object lock = new Object();
            final boolean[] done = {false};
            getUsers(uids, new GetUsersCallback() { // from class: com.vkontakte.android.data.Friends.3
                @Override // com.vkontakte.android.data.Friends.GetUsersCallback
                public void onUsersLoaded(ArrayList<UserProfile> users2) {
                    result.addAll(users2);
                    done[0] = true;
                    synchronized (lock) {
                        lock.notify();
                    }
                }
            }, nameCase);
            synchronized (lock) {
                if (!done[0]) {
                    try {
                        lock.wait();
                    } catch (Exception e) {
                    }
                }
            }
        }
        return result;
    }

    public static void getImportedContacts(final int service, final GetImportedContactsCallback callback) {
        new Thread(new Runnable() { // from class: com.vkontakte.android.data.Friends.4
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<UserProfile> users2 = Cache.getImportedContacts(service);
                SparseArray<String> descs = new SparseArray<>();
                ArrayList<Integer> needProfiles = new ArrayList<>();
                Iterator<UserProfile> it = users2.iterator();
                while (it.hasNext()) {
                    UserProfile u = it.next();
                    if (u.uid > 0) {
                        needProfiles.add(Integer.valueOf(u.uid));
                        descs.put(u.uid, u.university);
                    }
                }
                ArrayList<UserProfile> profiles = Cache.getUsers(needProfiles, true);
                Iterator<UserProfile> it2 = profiles.iterator();
                while (it2.hasNext()) {
                    UserProfile profile = it2.next();
                    profile.university = descs.get(profile.uid);
                }
                Iterator<UserProfile> itr = users2.iterator();
                while (itr.hasNext()) {
                    UserProfile p = itr.next();
                    if (p.uid > 0) {
                        itr.remove();
                    }
                }
                callback.onUsersLoaded(profiles, users2);
            }
        }).start();
    }

    public static void saveImportedContacts(int service, List<UserProfile> users2, List<UserProfile> notOnVk) {
        Cache.updatePeers(users2, false);
        Cache.saveImportedContacts(users2, service, true);
        Cache.saveImportedContacts(notOnVk, service, false);
    }

    public static void reset() {
        try {
            semaphore.acquire();
        } catch (Exception e) {
        }
        friends.clear();
        hints.clear();
        lists.clear();
        users.evictAll();
        semaphore.release();
    }

    public static List<UserProfile> search(String q) {
        return index.search(q);
    }

    public static void getLists(List<Folder> out) {
        out.addAll(lists);
    }

    public static Folder getListById(int lid) {
        Iterator<Folder> it = lists.iterator();
        while (it.hasNext()) {
            Folder f = it.next();
            if (f.id == lid) {
                return f;
            }
        }
        return null;
    }

    public static void updateSorting() {
    }

    public static ArrayList<Section> createSections(List<UserProfile> users2) {
        String str;
        String pref = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getString("friendsOrderNew", "firstname");
        int sortPref = 0;
        if ("hints".equals(pref)) {
            sortPref = 0;
        } else if ("firstname".equals(pref)) {
            sortPref = 1;
        } else if ("lastname".equals(pref)) {
            sortPref = 2;
        }
        ArrayList<Section> result = new ArrayList<>();
        if (sortPref != 0) {
            Log.d("vk", Thread.currentThread().getName() + " Create sections thread start, users size=" + users2.size());
            boolean firstName = sortPref == 1;
            Section curSection = null;
            for (UserProfile p : users2) {
                if (firstName) {
                    p.university = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                } else {
                    p.university = p.lastName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.firstName;
                }
            }
            Collections.sort(users2, new Comparator<UserProfile>() { // from class: com.vkontakte.android.data.Friends.5
                @Override // java.util.Comparator
                public int compare(UserProfile lhs, UserProfile rhs) {
                    if (rhs == null || lhs == null) {
                        return 0;
                    }
                    return lhs.university.compareToIgnoreCase(rhs.university);
                }
            });
            for (UserProfile p2 : users2) {
                p2.university = null;
            }
            char fc = 0;
            int offset = 0;
            for (UserProfile user : users2) {
                if (!firstName) {
                    str = user.lastName;
                } else {
                    try {
                        str = user.firstName;
                    } catch (Exception e) {
                        x = e;
                        Log.w("vk", x);
                    }
                }
                if (str.charAt(0) != fc) {
                    fc = (firstName ? user.firstName : user.lastName).charAt(0);
                    offset += curSection != null ? curSection.list.size() + 1 : 0;
                    Section curSection2 = new Section();
                    try {
                        curSection2.title = (fc + "").toUpperCase();
                        curSection2.list = new ArrayList();
                        result.add(curSection2);
                        curSection = curSection2;
                    } catch (Exception e2) {
                        x = e2;
                        curSection = curSection2;
                        Log.w("vk", x);
                    }
                }
                curSection.list.add(user);
            }
            Log.d("vk", Thread.currentThread().getName() + " Create sections done, " + result.size());
        } else {
            Section s = new Section();
            s.list = users2;
            result.add(s);
        }
        return result;
    }

    public static void getSortedFriends(List<Section> out) {
        Iterator<Section> it = sections.iterator();
        while (it.hasNext()) {
            Section section = it.next();
            Section s = new Section();
            s.title = section.title;
            s.list = new ArrayList();
            s.list.addAll(section.list);
            out.add(s);
        }
    }

    /* loaded from: classes2.dex */
    public static class Folder {
        public int id;
        public String name;

        public String toString() {
            return this.name;
        }
    }

    public static void notifyCounterChanged(int counter, Request type) {
        Intent intent = new Intent(ACTION_FRIEND_COUNTER_CHANGED);
        intent.putExtra("value", counter);
        intent.putExtra(ServerKeys.TYPE, type);
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void notifyRequestsChanged(int requests) {
        Intent intent = new Intent(ACTION_FRIEND_REQUESTS_CHANGED);
        intent.putExtra("value", requests);
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void decreaseRequests() {
        Intent intent = new Intent(ACTION_FRIEND_REQUESTS_CHANGED);
        LongPollService.setNumFriendRequests(LongPollService.getNumFriendRequests() - 1);
        intent.putExtra("value", LongPollService.getNumFriendRequests());
        intent.putExtra("decrease", true);
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void notifyFriendStatusChanged(int id, int status) {
        VKApplication.context.sendBroadcast(new Intent(ACTION_FRIEND_STATUS_CHANGED).putExtra("id", id).putExtra("status", status), "com.vkontakte.android.permission.ACCESS_DATA");
    }
}
