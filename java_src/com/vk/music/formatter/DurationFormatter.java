package com.vk.music.formatter;

import android.support.annotation.NonNull;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.Resourcer;
import com.vkontakte.android.R;
import java.util.Locale;
/* loaded from: classes2.dex */
public final class DurationFormatter {
    private DurationFormatter() {
    }

    @NonNull
    public static CharSequence formatDuration(@NonNull Resourcer resourcer, long seconds) {
        String durationFormatted = null;
        int hours = (int) (seconds / Duration.HOUR.seconds());
        if (hours > 0) {
            int minutes = (int) ((seconds - (hours * Duration.HOUR.seconds())) / Duration.MINUTE.seconds());
            durationFormatted = resourcer.pluralArg(R.plurals.music_hours, hours);
            if (minutes > 0) {
                durationFormatted = durationFormatted + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + resourcer.pluralArg(R.plurals.music_minutes, minutes);
            }
        } else {
            int minutes2 = (int) (seconds / Duration.MINUTE.seconds());
            if (minutes2 > 0) {
                durationFormatted = resourcer.pluralArg(R.plurals.music_minutes, minutes2);
            }
        }
        if (durationFormatted == null) {
            return "";
        }
        return durationFormatted;
    }

    @NonNull
    public static CharSequence formatDurationShort(long seconds) {
        String durationFormatted = null;
        int hours = (int) (seconds / Duration.HOUR.seconds());
        if (hours > 0) {
            int minutes = (int) ((seconds - (hours * Duration.HOUR.seconds())) / Duration.MINUTE.seconds());
            int secs = (int) ((seconds - (hours * Duration.HOUR.seconds())) - (minutes * Duration.MINUTE.seconds()));
            durationFormatted = String.format(Locale.getDefault(), "%02d:%02d:%02d", Integer.valueOf(hours), Integer.valueOf(minutes), Integer.valueOf(secs));
        } else {
            int minutes2 = (int) (seconds / Duration.MINUTE.seconds());
            int secs2 = (int) (seconds - (minutes2 * Duration.MINUTE.seconds()));
            if (minutes2 > 0) {
                durationFormatted = String.format(Locale.getDefault(), "%02d:%02d", Integer.valueOf(minutes2), Integer.valueOf(secs2));
            }
        }
        if (durationFormatted == null) {
            return "";
        }
        return durationFormatted;
    }
}
