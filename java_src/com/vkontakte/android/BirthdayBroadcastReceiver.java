package com.vkontakte.android;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.support.v4.app.NotificationCompat;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.gifts.BirthdaysFragment;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.widget.MenuListView;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
/* loaded from: classes2.dex */
public class BirthdayBroadcastReceiver extends BroadcastReceiver implements Friends.GetUsersCallback {
    private static final int ID_BIRTHDAY_NOTIFICATION = 500;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        int lastDate = context.getSharedPreferences(null, 0).getInt("last_birthday_notify", 0);
        if (!intent.getBooleanExtra("force", false)) {
            if (lastDate != getCurrentDate(System.currentTimeMillis())) {
                context.getSharedPreferences(null, 0).edit().putInt("last_birthday_notify", getCurrentDate(System.currentTimeMillis())).commit();
            } else {
                return;
            }
        }
        String uids = intent.getStringExtra("uids");
        if (TextUtils.isEmpty(uids)) {
            showBirthday(context, intent.getLongExtra(ServerKeys.DATE, System.currentTimeMillis()));
        } else {
            showBirthday(this, uids);
        }
        if (MenuListView.lastInstance != null) {
            MenuListView.lastInstance.updateBirthdays();
        }
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    public void onUsersLoaded(ArrayList<UserProfile> users) {
        List<String> names = new ArrayList<>();
        Iterator<UserProfile> it = users.iterator();
        while (it.hasNext()) {
            UserProfile p = it.next();
            if (!Utils.isBlank(p.fullName)) {
                names.add(p.fullName);
            }
        }
        if (!names.isEmpty()) {
            notifyUser(VKApplication.context, names);
        }
    }

    private static void showBirthday(Friends.GetUsersCallback callback, String uids) {
        String[] split;
        List<Integer> idList = new ArrayList<>();
        for (String id : uids.split(",")) {
            try {
                idList.add(Integer.valueOf(id));
            } catch (NumberFormatException e) {
                Log.e("vk", "Parse uid error", e);
            }
        }
        Friends.getUsers(idList, callback, 1);
    }

    private static void showBirthday(Context context, long time) {
        List<UserProfile> bdays = Cache.getBirthdays(time);
        if (bdays.size() > 0) {
            List<String> names = new ArrayList<>();
            Date date = new Date(time);
            String today = date.getDate() + "." + (date.getMonth() + 1) + ".";
            Date date2 = new Date(TimeUtils.DAY + time);
            String yesterday = date2.getDate() + "." + (date2.getMonth() + 1) + ".";
            boolean hasToday = false;
            for (UserProfile p : bdays) {
                if (p.bdate.startsWith(today)) {
                    hasToday = true;
                }
                if (p.bdate.startsWith(today)) {
                    names.add(p.university);
                }
                String[] ss = p.bdate.split("\\.");
                int year = Integer.parseInt(ss[2]);
                if (p.bdate.startsWith(today)) {
                    p.firstName = context.getResources().getString(R.string.today);
                } else if (p.bdate.startsWith(yesterday)) {
                    p.firstName = context.getResources().getString(R.string.tomorrow);
                } else {
                    p.firstName = ss[0] + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + context.getResources().getStringArray(R.array.months_full)[Integer.parseInt(ss[1]) - 1];
                }
                if (year > 0) {
                    int age = (date.getYear() + 1900) - year;
                    p.firstName += ", " + context.getResources().getQuantityString(R.plurals.birthday_age, age, Integer.valueOf(age));
                }
            }
            if (hasToday) {
                notifyUser(context, names);
            }
        }
    }

    private static void notifyUser(Context context, List<String> names) {
        String notifyText = context.getResources().getString(R.string.birthday_today_short, TextUtils.join(", ", names));
        Intent nIntent = new Navigator(BirthdaysFragment.class).intent(context);
        nIntent.setAction("birthday" + new Random().nextInt());
        PendingIntent cIntent = PendingIntent.getActivity(context, 0, nIntent, 268435456);
        Notification n = new NotificationCompat.BigTextStyle(new NotificationCompat.Builder(context).setPriority(-2).setContentTitle(context.getString(R.string.reminder)).setContentText(notifyText).setSmallIcon(R.drawable.ic_stat_notify_birthday).setContentIntent(cIntent)).setBigContentTitle(context.getString(R.string.reminder)).bigText(notifyText).build();
        n.flags |= 16;
        if (Build.VERSION.SDK_INT >= 21) {
            n.color = context.getResources().getColor(R.color.brand_primary);
        }
        NotificationManager srv = (NotificationManager) context.getSystemService("notification");
        srv.notify(ID_BIRTHDAY_NOTIFICATION, n);
    }

    private static int getCurrentDate(long t) {
        Date d = new Date(t);
        return d.getDate() + (d.getMonth() * 100) + (d.getYear() * 10000);
    }
}
