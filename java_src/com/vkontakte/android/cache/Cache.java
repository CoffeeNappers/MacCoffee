package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Pair;
import com.facebook.appevents.AppEventsConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.ChatUser;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.Message;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.PersistentAPIRequest;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Semaphore;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Cache {
    private static final boolean DEBUG = false;
    private static Semaphore lockSemaphore = new Semaphore(1, false);

    public static SQLiteDatabase getWritableDatabase() {
        return OpenHelper.getInstance(VKApplication.context).getWritableDatabase();
    }

    public static SQLiteDatabase getReadableDatabase() {
        return OpenHelper.getInstance(VKApplication.context).getReadableDatabase();
    }

    /* loaded from: classes2.dex */
    public static class OpenHelper extends SQLiteOpenHelper {
        private static volatile OpenHelper instance = null;

        public static OpenHelper getInstance(Context ctx) {
            if (instance == null) {
                synchronized (OpenHelper.class) {
                    if (instance == null) {
                        instance = new OpenHelper(ctx.getApplicationContext());
                    }
                }
            }
            return instance;
        }

        public static void clear() {
            synchronized (OpenHelper.class) {
                if (instance != null) {
                    try {
                        instance.close();
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                    instance = null;
                }
                VKApplication.context.deleteDatabase("vk.db");
            }
        }

        private OpenHelper(Context context) {
            super(context, "vk.db", (SQLiteDatabase.CursorFactory) null, 107);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            CacheTables.createCache(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            onCreate(db);
        }
    }

    public static void clear() {
        OpenHelper.clear();
    }

    public static ArrayList<UserProfile> getBirthdays(long date) {
        Cursor cursor;
        SQLiteDatabase db = getReadableDatabase();
        ArrayList<UserProfile> result = new ArrayList<>();
        try {
            Date d = new Date(date);
            Date d2 = new Date(TimeUtils.DAY + date);
            cursor = db.rawQuery(String.format(Locale.US, "SELECT * FROM users WHERE ((bday=%d AND bmonth=%d) OR (bday=%d AND bmonth=%d)) AND is_friend = 1 ORDER BY bmonth,bday", Integer.valueOf(d.getDate()), Integer.valueOf(d.getMonth() + 1), Integer.valueOf(d2.getDate()), Integer.valueOf(d2.getMonth() + 1)), null);
        } catch (Exception x) {
            Log.e("vk", "Error reading friends cache DB!", x);
        }
        if (cursor != null && cursor.getCount() > 0) {
            ContentValues values = new ContentValues();
            cursor.moveToFirst();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                UserProfile profile = new UserProfile();
                profile.uid = values.getAsInteger(ArgKeys.UID).intValue();
                profile.firstName = values.getAsString("firstname");
                profile.domain = values.getAsString("domain");
                profile.lastName = values.getAsString("lastname");
                profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                profile.photo = values.getAsString("photo_small");
                profile.bdate = values.getAsInteger("bday") + "." + values.getAsInteger("bmonth") + (values.getAsInteger("byear") != null ? "." + values.getAsInteger("byear") : "");
                profile.university = values.getAsString("name_r");
                result.add(profile);
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    @Nullable
    public static List<BirthdayEntry> getUpcomingBirthdays() {
        Context context = VKApplication.context;
        Resources resources = context.getResources();
        SQLiteDatabase db = getReadableDatabase();
        String[] months = resources.getStringArray(R.array.months_full);
        Calendar calendar = Calendar.getInstance();
        int startDay = calendar.get(5);
        int startMonth = calendar.get(2);
        calendar.set(2, startMonth + 1);
        int endDay = calendar.get(5);
        int endMonth = calendar.get(2);
        Cursor cursor = db.rawQuery(String.format(Locale.US, "SELECT * FROM users WHERE ((bday>%d AND bmonth=%d) OR (bday<%d AND bmonth=%d)) AND is_friend = 1 ORDER BY bmonth,bday", Integer.valueOf(startDay + 1), Integer.valueOf(startMonth + 1), Integer.valueOf(endDay + 1), Integer.valueOf(endMonth + 1)), null);
        if (cursor != null) {
            List<BirthdayEntry> result = new ArrayList<>(cursor.getCount());
            if (cursor.getCount() > 0) {
                ContentValues values = new ContentValues();
                cursor.moveToFirst();
                while (!cursor.isAfterLast()) {
                    DatabaseUtils.cursorRowToContentValues(cursor, values);
                    BirthdayEntry profile = new BirthdayEntry();
                    profile.uid = values.getAsInteger(ArgKeys.UID).intValue();
                    profile.firstName = values.getAsString("firstname");
                    profile.lastName = values.getAsString("lastname");
                    profile.domain = values.getAsString("domain");
                    profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                    profile.photo = values.getAsString("photo_small");
                    profile.bDay = values.getAsInteger("bday").intValue();
                    profile.bMonth = values.getAsInteger("bmonth").intValue();
                    profile.bYear = values.getAsInteger("byear") != null ? values.getAsInteger("byear").intValue() : -1;
                    profile.bdate = profile.bDay + "." + profile.bMonth + (profile.bYear > 0 ? "." + values.getAsInteger("byear") : "");
                    profile.university = values.getAsString("name_r");
                    profile.date = profile.bDay + ' ' + months[profile.bMonth - 1];
                    profile.subtitle = profile.date;
                    if (profile.bYear > 0) {
                        int years = TimeUtils.getAge(profile.bDay, profile.bMonth, profile.bYear) + 1;
                        CharSequence yearsString = resources.getQuantityString(R.plurals.birthday_age, years, Integer.valueOf(years));
                        profile.upcoming = context.getString(R.string.birthday_subtitle_upcoming, yearsString);
                        profile.subtitle += context.getString(R.string.birthday_subtitle_divider) + profile.upcoming;
                    }
                    result.add(profile);
                    cursor.moveToNext();
                }
            }
            cursor.close();
            Collections.sort(result, Cache$$Lambda$1.lambdaFactory$(startMonth, endMonth));
            return result;
        }
        return null;
    }

    public static /* synthetic */ int lambda$getUpcomingBirthdays$0(int startMonth, int endMonth, BirthdayEntry lhs, BirthdayEntry rhs) {
        if (lhs.bMonth == rhs.bMonth) {
            if (lhs.bDay < rhs.bDay) {
                return -1;
            }
            return lhs.bDay == rhs.bDay ? 0 : 1;
        } else if (lhs.bMonth == startMonth + 1 && rhs.bMonth == endMonth + 1) {
            return -1;
        } else {
            return (!(rhs.bMonth == startMonth + 1 && lhs.bMonth == endMonth + 1) && lhs.bMonth < rhs.bMonth) ? -1 : 1;
        }
    }

    @Nullable
    public static List<BirthdayEntry> getTodayBirthdays() {
        Context context = VKApplication.context;
        Resources resources = context.getResources();
        SQLiteDatabase db = getReadableDatabase();
        Calendar calendar = Calendar.getInstance();
        int startDay = calendar.get(5);
        int startMonth = calendar.get(2);
        Cursor cursor = db.rawQuery(String.format(Locale.US, "SELECT * FROM users WHERE (bday=%d AND bmonth=%d) AND is_friend = 1 ORDER BY bmonth,bday", Integer.valueOf(startDay), Integer.valueOf(startMonth + 1)), null);
        if (cursor != null) {
            List<BirthdayEntry> result = new ArrayList<>(cursor.getCount());
            if (cursor.getCount() > 0) {
                ContentValues values = new ContentValues();
                cursor.moveToFirst();
                while (!cursor.isAfterLast()) {
                    DatabaseUtils.cursorRowToContentValues(cursor, values);
                    BirthdayEntry profile = new BirthdayEntry();
                    profile.uid = values.getAsInteger(ArgKeys.UID).intValue();
                    profile.firstName = values.getAsString("firstname");
                    profile.lastName = values.getAsString("lastname");
                    profile.domain = values.getAsString("domain");
                    profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                    profile.photo = values.getAsString("photo_small");
                    profile.bDay = values.getAsInteger("bday").intValue();
                    profile.bMonth = values.getAsInteger("bmonth").intValue();
                    profile.bYear = values.getAsInteger("byear") != null ? values.getAsInteger("byear").intValue() : -1;
                    profile.bdate = profile.bDay + "." + profile.bMonth + (profile.bYear > 0 ? "." + values.getAsInteger("byear") : "");
                    profile.university = values.getAsString("name_r");
                    profile.isToday = true;
                    if (profile.bYear > 0) {
                        int years = TimeUtils.getAge(profile.bDay, profile.bMonth, profile.bYear);
                        profile.subtitle = resources.getQuantityString(R.plurals.birthday_today, years, Integer.valueOf(years));
                    } else {
                        profile.subtitle = context.getString(R.string.today);
                    }
                    profile.date = profile.subtitle;
                    result.add(profile);
                    cursor.moveToNext();
                }
            }
            cursor.close();
            return result;
        }
        return null;
    }

    @Nullable
    public static List<BirthdayEntry> getTomorrowBirthdays() {
        Context context = VKApplication.context;
        Resources resources = context.getResources();
        SQLiteDatabase db = getReadableDatabase();
        Calendar calendar = Calendar.getInstance();
        calendar.set(5, calendar.get(5) + 1);
        int startDay = calendar.get(5);
        int startMonth = calendar.get(2);
        Cursor cursor = db.rawQuery(String.format(Locale.US, "SELECT * FROM users WHERE (bday=%d AND bmonth=%d) AND is_friend = 1 ORDER BY bmonth,bday", Integer.valueOf(startDay), Integer.valueOf(startMonth + 1)), null);
        if (cursor != null) {
            List<BirthdayEntry> result = new ArrayList<>(cursor.getCount());
            if (cursor.getCount() > 0) {
                ContentValues values = new ContentValues();
                cursor.moveToFirst();
                while (!cursor.isAfterLast()) {
                    DatabaseUtils.cursorRowToContentValues(cursor, values);
                    BirthdayEntry profile = new BirthdayEntry();
                    profile.uid = values.getAsInteger(ArgKeys.UID).intValue();
                    profile.firstName = values.getAsString("firstname");
                    profile.lastName = values.getAsString("lastname");
                    profile.domain = values.getAsString("domain");
                    profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                    profile.photo = values.getAsString("photo_small");
                    profile.bDay = values.getAsInteger("bday").intValue();
                    profile.bMonth = values.getAsInteger("bmonth").intValue();
                    profile.bYear = values.getAsInteger("byear") != null ? values.getAsInteger("byear").intValue() : -1;
                    profile.bdate = profile.bDay + "." + profile.bMonth + (profile.bYear > 0 ? "." + values.getAsInteger("byear") : "");
                    profile.university = values.getAsString("name_r");
                    if (profile.bYear > 0) {
                        int years = TimeUtils.getAge(profile.bDay, profile.bMonth, profile.bYear) + 1;
                        CharSequence yearsString = resources.getQuantityString(R.plurals.birthday_age, years, Integer.valueOf(years));
                        profile.date = context.getString(R.string.tomorrow);
                        profile.upcoming = context.getString(R.string.birthday_subtitle_upcoming, yearsString);
                        profile.subtitle = profile.date + context.getString(R.string.birthday_subtitle_divider) + profile.upcoming;
                    } else {
                        profile.date = context.getString(R.string.tomorrow);
                        profile.subtitle = profile.date;
                    }
                    result.add(profile);
                    cursor.moveToNext();
                }
            }
            cursor.close();
            return result;
        }
        return null;
    }

    public static ArrayList<UserProfile> getFriends() {
        Cursor cursor;
        SQLiteDatabase db = getReadableDatabase();
        ArrayList<UserProfile> result = new ArrayList<>();
        try {
            cursor = db.rawQuery("SELECT users.* FROM users LEFT JOIN friends_hints_order ON users.uid=friends_hints_order.uid WHERE is_friend=1 ORDER BY friends_hints_order.list_order ASC", null);
        } catch (Exception x) {
            Log.e("vk", "Error reading friends cache DB!", x);
        }
        if (cursor != null && cursor.getCount() > 0) {
            int i = 0;
            ContentValues values = new ContentValues();
            cursor.moveToFirst();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                UserProfile profile = new UserProfile();
                profile.uid = values.getAsInteger(ArgKeys.UID).intValue();
                profile.firstName = values.getAsString("firstname");
                profile.lastName = values.getAsString("lastname");
                profile.domain = values.getAsString("domain");
                profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                profile.photo = values.getAsString("photo_small");
                profile.f = values.getAsInteger("f").intValue() == 1;
                profile.isFriend = true;
                result.add(profile);
                i++;
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static ArrayList<UserProfile> getUsers(List<Integer> ids, boolean forceOld) {
        return getUsers(ids, forceOld, 0);
    }

    public static ArrayList<UserProfile> getUsers(List<Integer> ids, boolean forceOld, int nameCase) {
        Cursor cursor;
        SQLiteDatabase db = getReadableDatabase();
        ArrayList<UserProfile> result = new ArrayList<>();
        try {
            if (nameCase == 0) {
                cursor = db.query("users", null, "uid in (" + TextUtils.join(",", ids) + ")", null, null, null, null);
            } else {
                cursor = db.rawQuery("SELECT users.uid, users_name_cases.firstname, users_name_cases.lastname, users.photo_small, users.f, users.domain, users.is_friend, users.last_updated FROM users_name_cases JOIN users ON users_name_cases.uid=users.uid WHERE users_name_cases.uid IN (" + TextUtils.join(",", ids) + ") and name_case=" + nameCase, null);
            }
        } catch (Exception x) {
            Log.e("vk", "Error reading friends cache DB!", x);
        }
        if (cursor != null && cursor.getCount() > 0) {
            int i = 0;
            ContentValues values = new ContentValues();
            cursor.moveToFirst();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                UserProfile profile = new UserProfile();
                profile.uid = values.getAsInteger(ArgKeys.UID).intValue();
                profile.firstName = values.getAsString("firstname");
                profile.lastName = values.getAsString("lastname");
                profile.domain = values.getAsString("domain");
                profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                profile.photo = values.getAsString("photo_small");
                profile.f = values.getAsInteger("f").intValue() == 1;
                profile.isFriend = values.getAsInteger("is_friend").intValue() == 1;
                if (forceOld || values.getAsInteger("last_updated").intValue() > (System.currentTimeMillis() / 1000) - 86400) {
                    result.add(profile);
                }
                i++;
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static ArrayList<UserProfile> getImportedContacts(int service) {
        Cursor cursor;
        SQLiteDatabase db = getReadableDatabase();
        ArrayList<UserProfile> result = new ArrayList<>();
        try {
            cursor = db.query("imported_contacts", null, "service=" + service, null, null, null, null);
        } catch (Exception x) {
            Log.e("vk", "Error reading friends cache DB!", x);
        }
        if (cursor != null && cursor.getCount() > 0) {
            int i = 0;
            ContentValues values = new ContentValues();
            cursor.moveToFirst();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                UserProfile profile = new UserProfile();
                profile.uid = values.getAsInteger("vk_id").intValue();
                profile.extra = new Bundle();
                profile.extra.putString("external_id", values.getAsString("external_id"));
                profile.fullName = values.getAsString("external_name");
                profile.photo = values.getAsString("external_photo");
                profile.university = values.getAsString("description");
                profile.isFriend = values.getAsBoolean("req_sent").booleanValue();
                result.add(profile);
                i++;
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static void saveImportedContacts(List<UserProfile> users, int service, boolean deleteOld) {
        OpenHelper helper = new OpenHelper(VKApplication.context);
        SQLiteDatabase db = helper.getWritableDatabase();
        try {
            lockSemaphore.acquire();
            db.beginTransaction();
            if (deleteOld) {
                db.delete("imported_contacts", "service=" + service, null);
            }
            ContentValues values = new ContentValues();
            for (UserProfile u : users) {
                values.clear();
                values.put("vk_id", Integer.valueOf(u.uid));
                values.put("external_id", u.extra.getString("external_id"));
                if (u.uid == 0) {
                    values.put("external_name", u.fullName);
                    values.put("external_photo", u.photo);
                }
                values.put("service", Integer.valueOf(service));
                values.put("description", u.university);
                values.put("req_sent", Boolean.valueOf(u.isFriend));
                db.insertWithOnConflict("imported_contacts", null, values, 5);
            }
            db.setTransactionSuccessful();
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        } finally {
            db.endTransaction();
        }
        lockSemaphore.release();
    }

    public static void updateFriendLists(List<Friends.Folder> lists, boolean replace) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            lockSemaphore.acquire();
            db.beginTransaction();
            if (replace) {
                db.delete("friendlists", null, null);
            }
            ContentValues values = new ContentValues();
            for (int i = 0; i < lists.size(); i++) {
                Friends.Folder list = lists.get(i);
                values.clear();
                values.put("lid", Integer.valueOf(list.id));
                values.put("name", list.name);
                db.insertWithOnConflict("friendlists", null, values, 5);
            }
            db.setTransactionSuccessful();
        } catch (Exception x) {
            Log.e("vk", "Error writing friends cache DB!", x);
        } finally {
            db.endTransaction();
        }
        lockSemaphore.release();
    }

    public static ArrayList<Friends.Folder> getFriendLists() {
        Cursor cursor;
        SQLiteDatabase db = getReadableDatabase();
        ArrayList<Friends.Folder> result = new ArrayList<>();
        try {
            cursor = db.query("friendlists", null, null, null, null, null, null);
        } catch (Exception x) {
            Log.e("vk", "Error reading friends cache DB!", x);
        }
        if (cursor != null && cursor.getCount() > 0) {
            ContentValues values = new ContentValues();
            cursor.moveToFirst();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                Friends.Folder list = new Friends.Folder();
                list.id = values.getAsInteger("lid").intValue();
                list.name = values.getAsString("name");
                result.add(list);
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static void updateFriends(List<UserProfile> users, boolean replace) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            lockSemaphore.acquire();
            ContentValues values = new ContentValues();
            db.beginTransaction();
            if (replace) {
                values.put("is_friend", (Boolean) false);
                db.update("users", values, null, null);
                db.delete("friends_hints_order", null, null);
            }
            int i = 0;
            for (UserProfile user : users) {
                values.clear();
                values.put(ArgKeys.UID, Integer.valueOf(user.uid));
                values.put("firstname", user.firstName);
                values.put("lastname", user.lastName);
                values.put("photo_small", user.photo);
                values.put("domain", user.domain);
                values.put("is_friend", (Boolean) true);
                values.put("f", Boolean.valueOf(user.f));
                values.put("last_updated", Integer.valueOf(((int) System.currentTimeMillis()) / 1000));
                values.put("lists", Integer.valueOf(user.country));
                if (user.bdate != null && user.bdate.length() > 0) {
                    values.put(ArgKeys.UID, Integer.valueOf(user.uid));
                    values.put("name_r", user.university);
                    String[] bd = user.bdate.split("\\.");
                    if (bd.length > 1) {
                        values.put("bday", Integer.valueOf(Integer.parseInt(bd[0])));
                        values.put("bmonth", Integer.valueOf(Integer.parseInt(bd[1])));
                        if (bd.length > 2) {
                            values.put("byear", Integer.valueOf(Integer.parseInt(bd[2])));
                        } else {
                            values.put("byear", (Integer) 0);
                        }
                    }
                }
                db.insertWithOnConflict("users", null, values, 5);
                values.clear();
                values.put(ArgKeys.UID, Integer.valueOf(user.uid));
                values.put("list_order", Integer.valueOf(replace ? i : 99999999));
                db.insert("friends_hints_order", null, values);
                i++;
            }
            db.setTransactionSuccessful();
        } catch (Exception x) {
            Log.e("vk", "Error writing friends cache DB!", x);
        } finally {
            db.endTransaction();
        }
        lockSemaphore.release();
    }

    public static void removeFriend(int uid) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            ContentValues values = new ContentValues();
            values.put("is_friend", (Boolean) false);
            db.update("users", values, "uid=" + uid, null);
        } catch (Exception x) {
            Log.e("vk", "Error writing friends cache DB!", x);
        }
    }

    public static int getNumUnreadMessages(int peer) {
        int result = -1;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor crsr = db.query("messages_unread_counters", new String[]{"unread_count"}, "peer=" + peer, null, null, null, null);
            if (crsr.moveToFirst()) {
                result = crsr.getInt(0);
            }
            crsr.close();
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
        return result;
    }

    public static void addMessages(List<Message> msgs) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < msgs.size(); i++) {
                if (msgs.get(i).id >= 0) {
                    if (builder.length() > 0) {
                        builder.append(',').append(msgs.get(i).randomId);
                    } else {
                        builder.append(msgs.get(i).randomId);
                    }
                }
            }
            clearSendingMessage(builder.toString());
            db.beginTransaction();
            for (int i2 = 0; i2 < msgs.size(); i2++) {
                new AddMessageAction(msgs.get(i2)).apply(db);
            }
            db.setTransactionSuccessful();
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        } finally {
            db.endTransaction();
        }
    }

    public static void updateMessagesUnreadCount(List<Pair<Integer, Integer>> counts) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            ContentValues values = new ContentValues();
            for (Pair<Integer, Integer> dlg : counts) {
                Log.i("vk", "update unread for " + dlg);
                values.put("peer", (Integer) dlg.first);
                values.put("unread_count", (Integer) dlg.second);
                db.insertWithOnConflict("messages_unread_counters", null, values, 5);
            }
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
    }

    public static ArrayList<DialogEntry> getDialogs(int offset, int count) {
        Cursor cursor;
        ContentValues values;
        ArrayList<DialogEntry> result = new ArrayList<>();
        SQLiteDatabase db = getReadableDatabase();
        try {
            cursor = db.query("dialogs", null, null, null, null, null, "msg_time desc", offset + "," + count);
            values = new ContentValues();
            Log.i("vk", "count=" + cursor.getCount());
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
        }
        if (cursor.getCount() > 0) {
            cursor.moveToFirst();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                Message msg = new Message(values);
                UserProfile user = new UserProfile();
                user.uid = msg.peer;
                if (msg.peer < 2000000000) {
                    user.firstName = values.getAsString("firstname");
                    user.lastName = values.getAsString("lastname");
                    user.fullName = user.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + user.lastName;
                    user.photo = values.getAsString("photo_small");
                    user.online = Friends.getOnlineStatus(user.uid);
                } else {
                    user.fullName = values.getAsString("title");
                    if (values.get("admin") != null) {
                        user.online = values.getAsInteger("admin").intValue();
                    }
                    user.photo = values.getAsString("photo");
                }
                DialogEntry e = new DialogEntry();
                e.lastMessage = msg;
                e.profile = user;
                if (values.get("unread_count") != null) {
                    e.unreadCount = values.getAsInteger("unread_count").intValue();
                }
                result.add(e);
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static int getDialogsCount() {
        int result = 0;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.rawQuery("SELECT count(*) FROM dialogs", null);
            cursor.moveToFirst();
            result = cursor.getInt(0);
            cursor.close();
            return result;
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
            return result;
        }
    }

    public static void setMessageReadState(int mid, boolean state) {
        int i = 1;
        SQLiteDatabase db = getWritableDatabase();
        try {
            if (!state) {
                i = 0;
            }
            new ModifyMessageFlagsAction(mid, 1, i).apply(db);
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
    }

    public static void setMessageReadStateUpto(int mid, int peer, boolean state, boolean in) {
        int i = 1;
        SQLiteDatabase db = getWritableDatabase();
        try {
            if (!state) {
                i = 0;
            }
            new ModifyMessageFlagsAction(mid, 1, i, in, peer).apply(db);
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
    }

    public static void clearSendingMessage(String randomIds) {
        Cursor cursor = getReadableDatabase().query("messages", new String[]{"mid"}, "mid<0 AND random_id IN  (?)", new String[]{String.valueOf(randomIds)}, null, null, null);
        if (cursor.moveToFirst()) {
            do {
                VKApplication.context.sendBroadcast(new Intent(LongPollService.ACTION_MESSAGE_DELETED).putExtra(LongPollService.EXTRA_MSG_ID, cursor.getInt(0)), "com.vkontakte.android.permission.ACCESS_DATA");
            } while (cursor.moveToNext());
            getWritableDatabase().delete("messages", "mid<0 AND random_id IN (?)", new String[]{String.valueOf(randomIds)});
        }
        cursor.close();
    }

    public static void setMessageID(int mid, int peerID, int newID) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            ContentValues values = new ContentValues();
            values.put("mid", Integer.valueOf(newID));
            db.update("messages", values, "mid=" + mid, null);
            values.clear();
            values.put(LongPollService.EXTRA_MSG_ID, Integer.valueOf(newID));
            db.update("messages_top_ids", values, "peer=" + peerID, null);
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
    }

    public static boolean containsMessage(int mid) {
        boolean result = false;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.query("messages", new String[]{"mid"}, "mid=" + mid, null, null, null, null);
            result = cursor.getCount() > 0;
            cursor.close();
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
        return result;
    }

    public static void deleteDialog(int peer) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            db.delete("messages", "peer=" + peer, null);
            db.delete("messages_top_ids", "peer=" + peer, null);
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
    }

    public static void updatePeers(List<UserProfile> users, boolean replace) {
        updatePeers(users, replace, 0);
    }

    public static void updatePeers(List<UserProfile> users, boolean replace, int nameCase) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            lockSemaphore.acquire();
            ContentValues values = new ContentValues();
            db.beginTransaction();
            for (UserProfile user : users) {
                values.clear();
                if (user.uid < 0 && user.uid > -2000000000) {
                    values.put(ArgKeys.UID, Integer.valueOf(user.uid));
                    values.put("firstname", user.fullName);
                    values.put("lastname", "");
                    values.put("photo_small", user.photo);
                    values.put("is_friend", Boolean.valueOf(user.isFriend));
                    values.put("f", Boolean.valueOf(user.f));
                    values.put("last_updated", Integer.valueOf((int) (System.currentTimeMillis() / 1000)));
                    if (!TextUtils.isEmpty(user.domain)) {
                        values.put("domain", user.domain);
                    }
                    db.insertWithOnConflict("users", null, values, replace ? 5 : 4);
                } else if (user.uid < 2000000000) {
                    values.put(ArgKeys.UID, Integer.valueOf(user.uid));
                    values.put("firstname", user.firstName);
                    values.put("lastname", user.lastName);
                    if (nameCase == 0) {
                        values.put("photo_small", user.photo);
                        values.put("is_friend", Boolean.valueOf(user.isFriend));
                        values.put("f", Boolean.valueOf(user.f));
                        values.put("last_updated", Integer.valueOf((int) (System.currentTimeMillis() / 1000)));
                        if (!TextUtils.isEmpty(user.domain)) {
                            values.put("domain", user.domain);
                        }
                        db.insertWithOnConflict("users", null, values, replace ? 5 : 4);
                    } else {
                        if (replace) {
                            db.delete("users_name_cases", "uid=" + user.uid + " AND name_case=" + nameCase, null);
                        }
                        values.put("name_case", Integer.valueOf(nameCase));
                        db.insert("users_name_cases", null, values);
                    }
                } else {
                    values.put("cid", Integer.valueOf(user.uid - 2000000000));
                    values.put("title", user.fullName);
                    values.put("admin", Integer.valueOf(user.online));
                    values.put("photo", user.photo);
                    values.put("need_update_users", (Integer) 0);
                    db.insertWithOnConflict("chats", null, values, 5);
                    if (user.extra != null) {
                        Bundle x = user.extra;
                        SharedPreferences nprefs = VKApplication.context.getSharedPreferences("notify", 0);
                        nprefs.edit().putBoolean("mute" + user.uid, x.getBoolean("mute")).putInt("dnd" + user.uid, x.getInt("dnd")).apply();
                    }
                }
            }
            db.setTransactionSuccessful();
        } catch (Exception x2) {
            Log.e("vk", "Error writing users cache DB!", x2);
        } finally {
            db.endTransaction();
        }
        lockSemaphore.release();
    }

    public static ArrayList<Message> getUnread(int limit) {
        ArrayList<Message> result = new ArrayList<>();
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.query("messages", Message.SELECTION, "(flags & 1) = 1 AND sender<>" + VKAccountManager.getCurrent().getUid(), null, null, null, "time desc", limit + "");
            if (cursor.moveToFirst()) {
                do {
                    result.add(new Message(cursor));
                } while (cursor.moveToLast());
            }
        } catch (Exception x) {
            Log.e("vk", "Error writing users cache DB!", x);
        }
        return result;
    }

    public static Message getMessageByID(int mid) {
        Message result = null;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.query("messages", Message.SELECTION, "mid=" + mid, null, null, null, null);
            if (cursor.moveToFirst()) {
                result = new Message(cursor);
            }
            cursor.close();
            if (result != null && result.peer > 2000000000) {
                Cursor cursor2 = db.query("chats", new String[]{"title"}, "cid=" + (result.peer - 2000000000), null, null, null, null);
                if (cursor2.getCount() > 0) {
                    cursor2.moveToFirst();
                    result.title = cursor2.getString(0);
                }
                cursor2.close();
            }
        } catch (Exception x) {
            Log.e("vk", "Error writing users cache DB!", x);
        }
        return result;
    }

    public static int getMaxMsgId() {
        int result = 0;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.rawQuery("SELECT max(mid) FROM messages", null);
            cursor.moveToFirst();
            result = cursor.getInt(0);
            cursor.close();
            return result;
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
            return result;
        }
    }

    public static int applyMessagesActions(ArrayList<MessagesAction> acts) {
        SQLiteDatabase db = getWritableDatabase();
        System.currentTimeMillis();
        try {
            lockSemaphore.acquire();
            db.beginTransaction();
            Iterator<MessagesAction> it = acts.iterator();
            while (it.hasNext()) {
                MessagesAction act = it.next();
                System.currentTimeMillis();
                act.apply(db);
            }
            db.setTransactionSuccessful();
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        } finally {
            db.endTransaction();
        }
        lockSemaphore.release();
        return 0;
    }

    public static int getMessagesHistoryCount(int peer) {
        int result = 0;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.rawQuery("SELECT count(*) FROM messages WHERE peer=" + peer, null);
            cursor.moveToFirst();
            result = cursor.getInt(0);
            cursor.close();
            return result;
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
            return result;
        }
    }

    public static String[] getChatInfo(int id) {
        String[] result = {"?", null};
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.rawQuery("SELECT title, photo FROM chats WHERE cid=" + id, null);
            cursor.moveToFirst();
            result[0] = cursor.getString(0);
            result[1] = cursor.getString(1);
            cursor.close();
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
        }
        return result;
    }

    public static int getChatAdmin(int id) {
        int result = 0;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.rawQuery("SELECT admin FROM chats WHERE cid=" + id, null);
            cursor.moveToFirst();
            result = cursor.getInt(0);
            cursor.close();
            return result;
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
            return result;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00c9 A[LOOP:1: B:45:0x00c3->B:47:0x00c9, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00ec A[LOOP:2: B:51:0x00e6->B:53:0x00ec, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.ArrayList<com.vkontakte.android.ChatUser> getChatUsers(int r19) {
        /*
            Method dump skipped, instructions count: 276
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.cache.Cache.getChatUsers(int):java.util.ArrayList");
    }

    public static boolean needUpdateChat(int id) {
        boolean result = true;
        SQLiteDatabase db = getReadableDatabase();
        try {
            Cursor cursor = db.rawQuery("SELECT need_update_users FROM chats WHERE cid=" + id, null);
            if (cursor.moveToFirst()) {
                result = cursor.getInt(0) == 1;
            }
            cursor.close();
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
        }
        return result;
    }

    public static void setNeedUpdateChat(int id) {
        Log.i("vk", "SET NEED UPDATE CHAT " + id);
        SQLiteDatabase db = getWritableDatabase();
        try {
            ContentValues values = new ContentValues();
            values.put("need_update_users", (Integer) 1);
            db.update("chats", values, "cid=" + id, null);
        } catch (Exception x) {
            Log.e("vk", "Error writing messages cache DB!", x);
        }
    }

    public static void deleteMessages(List<Integer> ids) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            db.delete("messages", "mid in (" + TextUtils.join(",", ids) + ")", null);
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
        }
    }

    public static void deleteAllMessages() {
        SQLiteDatabase db = getWritableDatabase();
        try {
            db.delete("messages", null, null);
            db.delete("chats", null, null);
            db.delete("chats_users", null, null);
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00b0 A[Catch: Exception -> 0x00c3, LOOP:1: B:28:0x00b0->B:29:0x00bd, LOOP_START, TryCatch #0 {Exception -> 0x00c3, blocks: (B:22:0x0009, B:24:0x0051, B:26:0x0060, B:28:0x00b0, B:30:0x00bf), top: B:34:0x0009 }] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00bf A[Catch: Exception -> 0x00c3, TRY_LEAVE, TryCatch #0 {Exception -> 0x00c3, blocks: (B:22:0x0009, B:24:0x0051, B:26:0x0060, B:28:0x00b0, B:30:0x00bf), top: B:34:0x0009 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.ArrayList<com.vkontakte.android.Message> getMessagesHistory(int r13, int r14, int r15) {
        /*
            java.util.ArrayList r10 = new java.util.ArrayList
            r10.<init>()
            android.database.sqlite.SQLiteDatabase r0 = getReadableDatabase()
            java.lang.String r1 = "messages"
            java.lang.String[] r2 = com.vkontakte.android.Message.SELECTION     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lc3
            r3.<init>()     // Catch: java.lang.Exception -> Lc3
            java.lang.String r4 = "peer="
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r3 = r3.append(r13)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r4 = " AND mid<0"
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Exception -> Lc3
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "time desc"
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lc3
            r8.<init>()     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r8 = r8.append(r14)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r12 = ","
            java.lang.StringBuilder r8 = r8.append(r12)     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r8 = r8.append(r15)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Exception -> Lc3
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Exception -> Lc3
            boolean r1 = r9.moveToFirst()     // Catch: java.lang.Exception -> Lc3
            if (r1 == 0) goto L60
        L51:
            r1 = 0
            com.vkontakte.android.Message r2 = new com.vkontakte.android.Message     // Catch: java.lang.Exception -> Lc3
            r2.<init>(r9)     // Catch: java.lang.Exception -> Lc3
            r10.add(r1, r2)     // Catch: java.lang.Exception -> Lc3
            boolean r1 = r9.moveToNext()     // Catch: java.lang.Exception -> Lc3
            if (r1 != 0) goto L51
        L60:
            r9.close()     // Catch: java.lang.Exception -> Lc3
            int r1 = r10.size()     // Catch: java.lang.Exception -> Lc3
            int r15 = r15 - r1
            java.lang.String r1 = "messages"
            java.lang.String[] r2 = com.vkontakte.android.Message.SELECTION     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lc3
            r3.<init>()     // Catch: java.lang.Exception -> Lc3
            java.lang.String r4 = "peer="
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r3 = r3.append(r13)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r4 = " AND mid>0"
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Exception -> Lc3
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "mid desc"
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lc3
            r8.<init>()     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r8 = r8.append(r14)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r12 = ","
            java.lang.StringBuilder r8 = r8.append(r12)     // Catch: java.lang.Exception -> Lc3
            java.lang.StringBuilder r8 = r8.append(r15)     // Catch: java.lang.Exception -> Lc3
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Exception -> Lc3
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Exception -> Lc3
            boolean r1 = r9.moveToFirst()     // Catch: java.lang.Exception -> Lc3
            if (r1 == 0) goto Lbf
        Lb0:
            r1 = 0
            com.vkontakte.android.Message r2 = new com.vkontakte.android.Message     // Catch: java.lang.Exception -> Lc3
            r2.<init>(r9)     // Catch: java.lang.Exception -> Lc3
            r10.add(r1, r2)     // Catch: java.lang.Exception -> Lc3
            boolean r1 = r9.moveToNext()     // Catch: java.lang.Exception -> Lc3
            if (r1 != 0) goto Lb0
        Lbf:
            r9.close()     // Catch: java.lang.Exception -> Lc3
        Lc2:
            return r10
        Lc3:
            r11 = move-exception
            java.lang.String r1 = "vk"
            java.lang.String r2 = "Error reading messages cache DB!"
            com.vkontakte.android.Log.e(r1, r2, r11)
            goto Lc2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.cache.Cache.getMessagesHistory(int, int, int):java.util.ArrayList");
    }

    public static ArrayList<Message> getResendableMessages() {
        Cursor cursor;
        ArrayList<Message> result = new ArrayList<>();
        SQLiteDatabase db = getReadableDatabase();
        try {
            cursor = db.query("messages", Message.SELECTION, "mid<0 AND time>" + (TimeUtils.getCurrentTime() - 300), null, null, null, "time desc");
        } catch (Exception x) {
            Log.e("vk", "Error reading messages cache DB!", x);
        }
        if (cursor.moveToFirst()) {
            do {
                result.add(0, new Message(cursor));
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static void updateChat(int id, String title, ArrayList<ChatUser> users, String photo) {
        SQLiteDatabase db = getWritableDatabase();
        ArrayList<UserProfile> profiles = new ArrayList<>();
        try {
            ContentValues values = new ContentValues();
            if (title != null) {
                values.put("title", title);
                values.put("need_update_users", (Integer) 0);
                db.update("chats", values, "cid=" + id, null);
            }
            if (photo != null) {
                values.put("photo", photo);
                db.update("chats", values, "cid=" + id, null);
            }
            if (users != null) {
                values.put("need_update_users", (Integer) 0);
                db.update("chats", values, "cid=" + id, null);
                db.delete("chats_users", "cid=" + id, null);
                Iterator<ChatUser> it = users.iterator();
                while (it.hasNext()) {
                    ChatUser user = it.next();
                    values.clear();
                    values.put("cid", Integer.valueOf(id));
                    values.put(ArgKeys.UID, Integer.valueOf(user.user.uid));
                    values.put("inviter", Integer.valueOf(user.inviter.uid));
                    values.put("invited", (Integer) 0);
                    db.insert("chats_users", null, values);
                    if (!profiles.contains(user.user)) {
                        profiles.add(user.user);
                    }
                    if (!profiles.contains(user.inviter)) {
                        profiles.add(user.inviter);
                    }
                }
            }
        } catch (Exception x) {
            Log.e("vk", "Error writing messages DB!", x);
        }
        updatePeers(profiles, true);
    }

    public static void putApiRequest(String method, JSONObject params, Method callback, JSONObject userdata) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            ContentValues values = new ContentValues();
            values.put("method", method);
            values.put("args", params.toString());
            if (callback != null) {
                Class<?> cls = callback.getDeclaringClass();
                String name = callback.getName();
                values.put("success_callback", cls.getName() + CameraUtilsEffects.FILE_DELIM + name);
            }
            if (userdata != null) {
                values.put("user_data", userdata.toString());
            }
            db.insert("api_queue", null, values);
            Log.d("vk", "Insert api request " + method + " (" + params + ") ok");
        } catch (Exception x) {
            Log.e("vk", "Error writing api queue DB!", x);
        }
    }

    public static void deleteApiRequest(int id) {
        SQLiteDatabase db = getWritableDatabase();
        try {
            db.delete("api_queue", "id=" + id, null);
        } catch (Exception x) {
            Log.e("vk", "Error writing api queue DB!", x);
        }
    }

    public static PersistentAPIRequest getApiRequest() {
        PersistentAPIRequest res = null;
        SQLiteDatabase db = getReadableDatabase();
        try {
            ContentValues values = new ContentValues();
            Cursor cursor = db.query("api_queue", null, null, null, null, null, null, AppEventsConstants.EVENT_PARAM_VALUE_YES);
            if (cursor.getCount() > 0) {
                cursor.moveToFirst();
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                PersistentAPIRequest res2 = new PersistentAPIRequest();
                try {
                    res2.id = values.getAsInteger("id").intValue();
                    res2.args = values.get("args") != null ? new JSONObject(values.getAsString("args")) : null;
                    res2.userdata = values.get("user_data") != null ? new JSONObject(values.getAsString("user_data")) : null;
                    if (values.get("success_callback") != null) {
                        try {
                            String[] m = values.getAsString("success_callback").split(CameraUtilsEffects.FILE_DELIM);
                            Class<?> cl = Class.forName(m[0]);
                            res2.callback = cl.getMethod(m[1], JSONObject.class, JSONObject.class);
                        } catch (Exception x) {
                            Log.w("vk", x);
                        }
                    }
                    res2.method = values.getAsString("method");
                    res = res2;
                } catch (Exception e) {
                    x = e;
                    res = res2;
                    Log.e("vk", "Error reading api queue DB!", x);
                    return res;
                }
            }
            cursor.close();
        } catch (Exception e2) {
            x = e2;
        }
        return res;
    }

    /* loaded from: classes2.dex */
    public static class BirthdayEntry extends UserProfile {
        public static final Serializer.Creator<BirthdayEntry> CREATOR = new Serializer.CreatorAdapter<BirthdayEntry>() { // from class: com.vkontakte.android.cache.Cache.BirthdayEntry.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public BirthdayEntry mo1087createFromSerializer(Serializer in) {
                return new BirthdayEntry(in);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public BirthdayEntry[] mo1088newArray(int size) {
                return new BirthdayEntry[size];
            }
        };
        public int bDay;
        public int bMonth;
        public int bYear;
        public String date;
        public boolean isToday;
        public String subtitle;
        public String upcoming;

        @Override // com.vkontakte.android.UserProfile, com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer p) {
            super.serializeTo(p);
            p.writeInt(this.bDay);
            p.writeInt(this.bMonth);
            p.writeInt(this.bYear);
            p.writeString(this.subtitle);
            p.writeString(this.date);
            p.writeString(this.upcoming);
        }

        public BirthdayEntry() {
        }

        protected BirthdayEntry(Serializer in) {
            super(in);
            this.bDay = in.readInt();
            this.bMonth = in.readInt();
            this.bDay = in.readInt();
            this.subtitle = in.readString();
            this.date = in.readString();
            this.upcoming = in.readString();
        }
    }
}
