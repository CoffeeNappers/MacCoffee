package com.vkontakte.android;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.SimpleTimeZone;
import java.util.TimeZone;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class TimeUtils {
    public static final long DAY = 86400000;
    public static final long HOUR = 3600000;
    public static final long MIN = 60000;
    public static final long MONTH = 2592000000L;
    public static final long[] PERIODS;
    public static final long SEC = 1000;
    public static final long WEEK = 604800000;
    public static final long YEAR = 31536000000L;
    private static TimeZone customTimeZone;
    private static int diff;

    static {
        float tz = VKApplication.context.getSharedPreferences(null, 0).getFloat("custom_timezone", 0.0f);
        int diff2 = VKApplication.context.getSharedPreferences(null, 0).getInt("time_diff", 0);
        setCustomTimeZone(tz, diff2);
        PERIODS = new long[]{1000, 60000, HOUR, DAY, WEEK, MONTH, YEAR};
    }

    public static void setCustomTimeZone(float offset, int diff2) {
        if (offset == 0.0f) {
            customTimeZone = null;
        } else {
            customTimeZone = new SimpleTimeZone((int) (3600.0f * offset * 1000.0f), String.format("Custom %d:%02d", Integer.valueOf((int) offset), Integer.valueOf((int) ((offset * 60.0f) % 60.0f))));
        }
        diff = diff2;
        VKApplication.context.getSharedPreferences(null, 0).edit().putFloat("custom_timezone", offset).putInt("time_diff", diff2).commit();
    }

    public static Calendar getCalendar() {
        if (customTimeZone != null) {
            Calendar cal = Calendar.getInstance(customTimeZone);
            cal.setTimeInMillis(getCurrentTime() * 1000);
            return cal;
        }
        return Calendar.getInstance();
    }

    public static String shortDate(long _dt, Context context) {
        String[] s = context.getResources().getStringArray(R.array.short_time);
        long _dt2 = System.currentTimeMillis() - (1000 * _dt);
        for (int i = PERIODS.length - 1; i >= 0; i--) {
            if (_dt2 > PERIODS[i]) {
                long time = _dt2 / PERIODS[i];
                if (i == PERIODS.length - 1 && time >= 5) {
                    return String.valueOf((_dt2 / PERIODS[i]) + 1970);
                }
                return (_dt2 / PERIODS[i]) + s[i];
            }
        }
        return 0 + s[0];
    }

    public static String langDate(int _dt, boolean forceShortMonth) {
        String r;
        Resources res = VKApplication.context.getResources();
        long dt = _dt * 1000;
        Calendar now = getCalendar();
        Calendar ds = getCalendar();
        ds.set(12, 0);
        ds.set(11, 0);
        ds.set(13, 0);
        ds.set(14, 0);
        long daystart = ds.getTimeInMillis();
        Calendar c = getCalendar();
        c.setTimeInMillis(dt);
        if (daystart < dt && DAY + daystart >= dt) {
            Object[] objArr = new Object[4];
            objArr[0] = res.getString(R.string.today);
            objArr[1] = res.getString(c.get(11) == 1 ? R.string.date_at_1am : R.string.date_at);
            objArr[2] = Integer.valueOf(c.get(11));
            objArr[3] = Integer.valueOf(c.get(12));
            String r2 = String.format("%s %s %d:%02d", objArr);
            return r2;
        } else if (DAY + daystart < dt && 172800000 + daystart > dt) {
            Object[] objArr2 = new Object[4];
            objArr2[0] = res.getString(R.string.tomorrow);
            objArr2[1] = res.getString(c.get(11) == 1 ? R.string.date_at_1am : R.string.date_at);
            objArr2[2] = Integer.valueOf(c.get(11));
            objArr2[3] = Integer.valueOf(c.get(12));
            String r3 = String.format("%s %s %d:%02d", objArr2);
            return r3;
        } else if (daystart - DAY < dt && daystart >= dt) {
            Object[] objArr3 = new Object[4];
            objArr3[0] = res.getString(R.string.yesterday);
            objArr3[1] = res.getString(c.get(11) == 1 ? R.string.date_at_1am : R.string.date_at);
            objArr3[2] = Integer.valueOf(c.get(11));
            objArr3[3] = Integer.valueOf(c.get(12));
            String r4 = String.format("%s %s %d:%02d", objArr3);
            return r4;
        } else {
            if (c.get(1) != now.get(1)) {
                r = "" + res.getString(R.string.date_format_day_month_year, Integer.valueOf(c.get(5)), res.getStringArray(R.array.months_short)[Math.min(c.get(2), 11)], Integer.valueOf(c.get(1)));
            } else {
                StringBuilder append = new StringBuilder().append("");
                Object[] objArr4 = new Object[2];
                objArr4[0] = Integer.valueOf(c.get(5));
                objArr4[1] = res.getStringArray(forceShortMonth ? R.array.months_short : R.array.months_full)[Math.min(c.get(2), 11)];
                r = append.append(res.getString(R.string.date_format_day_month, objArr4)).toString();
            }
            StringBuilder append2 = new StringBuilder().append(r);
            Object[] objArr5 = new Object[3];
            objArr5[0] = res.getString(c.get(11) == 1 ? R.string.date_at_1am : R.string.date_at);
            objArr5[1] = Integer.valueOf(c.get(11));
            objArr5[2] = Integer.valueOf(c.get(12));
            String r5 = append2.append(String.format(" %s %d:%02d", objArr5)).toString();
            return r5;
        }
    }

    public static String langDate(int _dt) {
        return langDate(_dt, false);
    }

    public static String langDateShort(int _dt) {
        Resources res = VKApplication.context.getResources();
        long dt = _dt * 1000;
        Calendar now = getCalendar();
        Calendar ds = getCalendar();
        ds.set(12, 0);
        ds.set(11, 0);
        ds.set(13, 0);
        ds.set(14, 0);
        long daystart = ds.getTimeInMillis();
        Calendar c = getCalendar();
        c.setTimeInMillis(dt);
        if (daystart < dt) {
            String r = String.format("%d:%02d", Integer.valueOf(c.get(11)), Integer.valueOf(c.get(12)));
            return r;
        } else if (daystart - DAY < dt && daystart >= dt) {
            String r2 = res.getString(R.string.yesterday);
            return r2;
        } else if (c.get(1) != now.get(1)) {
            String r3 = res.getString(R.string.date_format_day_month_year, Integer.valueOf(c.get(5)), res.getStringArray(R.array.months_short)[Math.min(c.get(2), 11)], Integer.valueOf(c.get(1)));
            return r3;
        } else {
            String r4 = res.getString(R.string.date_format_day_month, Integer.valueOf(c.get(5)), res.getStringArray(R.array.months_short)[Math.min(c.get(2), 11)]);
            return r4;
        }
    }

    public static String langDateDay(int _dt) {
        Resources res = VKApplication.context.getResources();
        long dt = _dt * 1000;
        Calendar now = getCalendar();
        Calendar ds = getCalendar();
        ds.set(12, 0);
        ds.set(11, 0);
        ds.set(13, 0);
        ds.set(14, 0);
        long daystart = ds.getTimeInMillis();
        Calendar c = getCalendar();
        c.setTimeInMillis(dt);
        if (daystart < dt && DAY + daystart >= dt) {
            String r = res.getString(R.string.today);
            return r;
        } else if (DAY + daystart < dt && 172800000 + daystart > dt) {
            String r2 = res.getString(R.string.tomorrow);
            return r2;
        } else if (daystart - DAY < dt && daystart >= dt) {
            String r3 = res.getString(R.string.yesterday);
            return r3;
        } else if (c.get(1) != now.get(1)) {
            String r4 = res.getString(R.string.date_format_day_month_year, Integer.valueOf(c.get(5)), res.getStringArray(R.array.months_short)[Math.min(c.get(2), 11)], Integer.valueOf(c.get(1)));
            return r4;
        } else {
            String r5 = res.getString(R.string.date_format_day_month, Integer.valueOf(c.get(5)), res.getStringArray(R.array.months_full)[Math.min(c.get(2), 11)]);
            return r5;
        }
    }

    public static String langDateRelative(int dt, Resources r) {
        int now = getCurrentTime();
        int diff2 = now - dt;
        if (diff2 >= 14400 || diff2 < 0) {
            return langDate(dt);
        }
        if (diff2 >= 10800) {
            return r.getStringArray(R.array.date_ago_hrs)[2];
        }
        if (diff2 >= 7200) {
            return r.getStringArray(R.array.date_ago_hrs)[1];
        }
        if (diff2 >= 3600) {
            return r.getStringArray(R.array.date_ago_hrs)[0];
        }
        if (diff2 >= 60) {
            return r.getQuantityString(R.plurals.date_ago_mins, diff2 / 60, Integer.valueOf(diff2 / 60));
        }
        if (diff2 <= 10) {
            return r.getString(R.string.date_ago_now);
        }
        return r.getQuantityString(R.plurals.date_ago_secs, diff2, Integer.valueOf(diff2));
    }

    public static String langDateRelativeNoDiff(int dt, Resources r) {
        int now = getCurrentTime();
        int diff2 = now - dt;
        if (diff2 >= 14400 || diff2 < 0) {
            return langDate(dt);
        }
        if (diff2 >= 10800) {
            return r.getStringArray(R.array.date_ago_hrs)[2];
        }
        if (diff2 >= 7200) {
            return r.getStringArray(R.array.date_ago_hrs)[1];
        }
        if (diff2 >= 3600) {
            return r.getStringArray(R.array.date_ago_hrs)[0];
        }
        if (diff2 >= 60) {
            return r.getQuantityString(R.plurals.date_ago_mins, diff2 / 60, Integer.valueOf(diff2 / 60));
        }
        if (diff2 <= 10) {
            return r.getString(R.string.date_ago_now);
        }
        return r.getQuantityString(R.plurals.date_ago_secs, diff2, Integer.valueOf(diff2));
    }

    public static String time(int t) {
        Calendar c = getCalendar();
        c.setTimeInMillis(t * 1000);
        return String.format("%d:%02d", Integer.valueOf(c.get(11)), Integer.valueOf(c.get(12)));
    }

    public static int getCurrentTime() {
        int rawUnixTime = (int) (System.currentTimeMillis() / 1000);
        return customTimeZone == null ? rawUnixTime : rawUnixTime - diff;
    }

    public static int getOffset() {
        return -diff;
    }

    public static void setServerTime(int serverTime) {
        int localTime = (int) (System.currentTimeMillis() / 1000);
        if (Math.abs(serverTime - localTime) > 1800) {
            float diffHours = Math.round((localTime - serverTime) / 3600.0f);
            float localTimeZone = (TimeZone.getDefault().getOffset(System.currentTimeMillis()) / 1000.0f) / 3600.0f;
            float offset = localTimeZone + diffHours;
            setCustomTimeZone(offset, Math.round(diffHours * 3600.0f));
            Log.i("vk", "Using custom timezone with offset " + offset);
            return;
        }
        setCustomTimeZone(0.0f, 0);
    }

    public static void resyncOffset() {
        new VKAPIRequest("getServerTime").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.TimeUtils.1
            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject resp) {
                try {
                    int time = resp.getInt(ServerKeys.RESPONSE);
                    TimeUtils.setServerTime(time);
                } catch (JSONException e) {
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
            }
        }).exec();
    }

    public static int getAge(int bDay, int bMonth, int bYear) {
        Calendar c = Calendar.getInstance();
        int now = c.get(1);
        Calendar c2 = Calendar.getInstance();
        c2.set(5, bDay);
        c2.set(2, bMonth - 1);
        int years = now - bYear;
        if (c2.after(c)) {
            return years - 1;
        }
        return years;
    }

    public static long getVideoTimestampMs(String timestamp) {
        if (TextUtils.isEmpty(timestamp)) {
            return 0L;
        }
        if (timestamp.indexOf("m") < 0) {
            timestamp = "00h00s" + timestamp;
        } else if (timestamp.indexOf("h") < 0) {
            timestamp = "00h" + timestamp;
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH'h'mm'm'ss's'");
            sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            Date date = sdf.parse(timestamp);
            return date.getTime();
        } catch (Exception e) {
            return 0L;
        }
    }
}
