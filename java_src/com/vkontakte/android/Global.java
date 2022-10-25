package com.vkontakte.android;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v4.media.session.PlaybackStateCompat;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.emoji.Emoji;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class Global {
    public static final float FONT_SIZE_MULTIPLIER = 2.0f;
    private static DecimalFormat dfnd;
    public static float displayDensity;
    private static final DecimalFormat decimalFormat = new DecimalFormat("#.#");
    public static LongPollService longPoll = null;
    public static boolean inited = false;
    private static Pattern entitiesPtn = null;
    private static final String[] SUPPORTED_LANGS = {"ru", "ua", "en", "pt", "kz"};
    private static Pattern emojiSkinModifierChars = Pattern.compile("(🏻|🏼|🏽|🏾|🏿)");

    public static void init(Context ctx) {
        try {
            DisplayMetrics metrics = ctx.getResources().getDisplayMetrics();
            displayDensity = metrics.density;
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    private static String formatFloat(float f) {
        StringBuilder sb = new StringBuilder();
        if (f == Math.round(f)) {
            f = (int) f;
        }
        return sb.append(f).append("").toString();
    }

    public static String langFileSize(long sz, Resources r) {
        if (sz > 1073741824) {
            return formatFloat(Math.round((((float) sz) / 1.0737418E9f) * 100.0f) / 100.0f) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + r.getString(R.string.fsize_gb);
        }
        if (sz > 1048576) {
            return formatFloat(Math.round((((float) sz) / 1048576.0f) * 10.0f) / 10.0f) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + r.getString(R.string.fsize_mb);
        }
        if (sz > PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID) {
            return Math.round(((float) sz) / 1024.0f) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + r.getString(R.string.fsize_kb);
        }
        return sz + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + r.getString(R.string.fsize_b);
    }

    public static String replaceHTML(String s) {
        String replacement;
        if (s == null) {
            return "";
        }
        String s2 = s.replace("<br>", "\\n");
        StringBuffer buf = new StringBuffer();
        if (entitiesPtn == null) {
            entitiesPtn = Pattern.compile("&([a-zA-Z0-9#]+);");
        }
        Matcher matcher = entitiesPtn.matcher(s2);
        while (matcher.find()) {
            String entity = matcher.group(1);
            if (entity.startsWith("#")) {
                char ch = (char) Integer.parseInt(entity.substring(1));
                if (ch == '\\') {
                    replacement = "\\\\\\\\";
                } else if (ch == '\"') {
                    replacement = "\\\\\"";
                } else if (Character.isISOControl(ch)) {
                    replacement = "";
                } else {
                    replacement = Character.toString(ch);
                }
            } else if ("gt".equalsIgnoreCase(entity)) {
                replacement = ">";
            } else if ("lt".equalsIgnoreCase(entity)) {
                replacement = "<";
            } else if ("amp".equalsIgnoreCase(entity)) {
                replacement = "&";
            } else if ("quot".equalsIgnoreCase(entity)) {
                replacement = "\\\\\"";
            } else if ("ndash".equalsIgnoreCase(entity)) {
                replacement = "-";
            } else {
                replacement = "?";
            }
            matcher.appendReplacement(buf, replacement);
        }
        matcher.appendTail(buf);
        return buf.toString();
    }

    public static String unwrapMentions(String s) {
        if (s == null) {
            return "";
        }
        return s.replaceAll("\\[id(\\d+)\\|([^\\]]+)\\]", "$2").replaceAll("\\[club(\\d+)\\|([^\\]]+)\\]", "$2");
    }

    public static ArrayList<String> extractLinks(String s) {
        ArrayList<String> ss = new ArrayList<>();
        Pattern ptn = Pattern.compile("((?:(?:http|https)://)?[a-zA-Zа-яА-Я0-9\\.-]+\\.[a-zA-ZрфРФ]{2,4}[0-9a-zA-Z~/?\\.=#!%&_-]*(?<!\\.)(?<!!))");
        Matcher m = ptn.matcher(s);
        while (m.find()) {
            ss.add(m.group());
        }
        return ss;
    }

    public static Bitmap getResBitmap(Resources res, int id) {
        Drawable d = res.getDrawable(id);
        if (d == null || !(d instanceof BitmapDrawable)) {
            return null;
        }
        return ((BitmapDrawable) d).getBitmap();
    }

    public static String getDeviceLang() {
        String[] strArr;
        try {
            String l = Locale.getDefault().getLanguage();
            if ("uk".equals(l)) {
                l = "ua";
            }
            if ("kk".equals(l)) {
                l = "kz";
            }
            if (l.length() < 2) {
                l = "en";
            }
            for (String lang : SUPPORTED_LANGS) {
                if (l.startsWith(lang)) {
                    return lang;
                }
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        return "en";
    }

    public static int scale(float dip) {
        return Math.round(displayDensity * dip);
    }

    public static boolean isAppInstalled(Context context, String pkg) {
        try {
            context.getPackageManager().getPackageInfo(pkg, 1);
            return true;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return false;
        }
    }

    public static String getStaticMapURL(double lat, double lon) {
        int i = 1;
        Locale locale = Locale.US;
        Object[] objArr = new Object[4];
        objArr[0] = lat + "";
        objArr[1] = lon + "";
        if (displayDensity > 1.0f) {
            i = 2;
        }
        objArr[2] = Integer.valueOf(i);
        objArr[3] = System.getProperty("user.language");
        return String.format(locale, "http://maps.googleapis.com/maps/api/staticmap?center=%1$s,%2$s&zoom=16&size=300x130&sensor=false&scale=%3$d&language=%4$s", objArr);
    }

    public static String getStaticMapURL(double lat, double lon, int w, int h) {
        int i = 1;
        Locale locale = Locale.US;
        Object[] objArr = new Object[6];
        objArr[0] = lat + "";
        objArr[1] = lon + "";
        if (displayDensity > 1.0f) {
            i = 2;
        }
        objArr[2] = Integer.valueOf(i);
        objArr[3] = System.getProperty("user.language");
        objArr[4] = Integer.valueOf(w);
        objArr[5] = Integer.valueOf(h);
        return String.format(locale, "http://maps.googleapis.com/maps/api/staticmap?center=%1$s,%2$s&zoom=16&size=%5$dx%6$d&sensor=false&scale=%3$d&language=%4$s", objArr);
    }

    public static String getStaticMapURL(double lat, double lon, int w, int h, int zoom) {
        int i = 1;
        Locale locale = Locale.US;
        Object[] objArr = new Object[7];
        objArr[0] = lat + "";
        objArr[1] = lon + "";
        if (displayDensity > 1.0f) {
            i = 2;
        }
        objArr[2] = Integer.valueOf(i);
        objArr[3] = System.getProperty("user.language");
        objArr[4] = Integer.valueOf(w);
        objArr[5] = Integer.valueOf(h);
        objArr[6] = Integer.valueOf(zoom);
        return String.format(locale, "http://maps.googleapis.com/maps/api/staticmap?center=%1$s,%2$s&zoom=%7$d&size=%5$dx%6$d&sensor=false&scale=%3$d&language=%4$s", objArr);
    }

    public static int getUserOnlineStatus(JSONObject user) {
        if (user.optInt("online", 0) == 1) {
            if (user.optInt("online_mobile") != 1) {
                return 1;
            }
            if (user.optInt("online_app") > 0) {
                return 3;
            }
            return 2;
        }
        return 0;
    }

    private static boolean inArray(char c, char[] a) {
        for (char cc : a) {
            if (cc == c) {
                return true;
            }
        }
        return false;
    }

    @Nullable
    public static String replaceEmojiModifiers(@Nullable String s) {
        if (!TextUtils.isEmpty(s)) {
            Matcher m = emojiSkinModifierChars.matcher(s);
            StringBuffer buf = new StringBuffer();
            while (m.find()) {
                m.appendReplacement(buf, "");
            }
            m.appendTail(buf);
            return buf.toString();
        }
        return s;
    }

    public static CharSequence replaceEmoji(CharSequence cs) {
        return Emoji.instance(VKApplication.context).replaceEmoji(cs);
    }

    public static boolean isTouchwiz() {
        return new File("/system/app/SecLauncher2.apk").exists();
    }

    public static boolean isBuggyMeizu() {
        if (Build.VERSION.SDK_INT < 22) {
            return false;
        }
        try {
            Class.forName("com.android.internal.widget.MzActionBarView");
            return true;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    public static String formatBigNumber(int num) {
        if (num > 10000000) {
            return String.format("%.02f M", Float.valueOf(num / 1000000.0f));
        }
        if (num > 10000) {
            return (num / 1000) + " K";
        }
        return num + "";
    }

    public static String formatNumber(int num) {
        if (num >= 1000000) {
            return decimalFormat.format(num / 1000000.0f) + "M";
        }
        if (num >= 1000) {
            return decimalFormat.format(num / 1000.0f) + "K";
        }
        return num + "";
    }

    public static String formatNumberWithThousandSeparator(int num) {
        if (dfnd == null) {
            dfnd = new DecimalFormat();
            DecimalFormatSymbols symbols = dfnd.getDecimalFormatSymbols();
            symbols.setGroupingSeparator(' ');
            dfnd.setDecimalFormatSymbols(symbols);
        }
        return dfnd.format(num);
    }
}
