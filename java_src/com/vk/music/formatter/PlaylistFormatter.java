package com.vk.music.formatter;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vk.core.util.Resourcer;
import com.vk.music.dto.Artist;
import com.vk.music.dto.Genre;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public final class PlaylistFormatter {
    private PlaylistFormatter() {
    }

    @NonNull
    public static CharSequence formatGenreYear(@NonNull Resourcer resourcer, @Nullable List<Genre> genres, int year) {
        if (genres == null || genres.size() == 0) {
            return "";
        }
        String formattedGenres = formatGenres(genres);
        boolean hasGenre = !TextUtils.isEmpty(formattedGenres);
        boolean hasYear = year != 0;
        if (hasGenre && hasYear) {
            return resourcer.str(R.string.music_dot_delimiter, formattedGenres, Integer.valueOf(year));
        }
        if (!hasGenre) {
            if (hasYear) {
                return String.valueOf(year);
            }
            return "";
        }
        return formattedGenres;
    }

    private static String formatGenres(@NonNull List<Genre> genres) {
        List<String> filtered = new LinkedList<>();
        for (Genre genre : genres) {
            if (genre != null && !TextUtils.isEmpty(genre.name)) {
                filtered.add(genre.name);
            }
        }
        return TextUtils.join(", ", filtered);
    }

    @NonNull
    public static CharSequence formatArtists(@NonNull Resourcer resourcer, @Nullable List<Artist> artists) {
        if (artists == null || artists.size() == 0) {
            return "";
        }
        if (artists.size() > 1) {
            return resourcer.str(R.string.music_playlist_different_artists);
        }
        return artists.get(0).name;
    }

    @NonNull
    public static CharSequence formatListenings(@NonNull Resourcer resourcer, int listenings) {
        int i = 1000;
        if (listenings == 0) {
            return "";
        }
        if (listenings < 1000) {
            i = listenings;
        }
        return resourcer.pluralArg(R.plurals.music_snippet_listenings, i, Global.formatNumber(listenings));
    }

    @NonNull
    public static CharSequence formatUpdateTime(@NonNull Resourcer resourcer, long updateTime) {
        if (updateTime == 0) {
            return "";
        }
        long diff = (System.currentTimeMillis() / 1000) - updateTime;
        if (Duration.MINUTE.isGreaterThan(diff)) {
            return resourcer.str(R.string.music_snippet_uptime_now);
        }
        if (Duration.HOUR.isGreaterThan(diff)) {
            return resourcer.pluralArg(R.plurals.music_snippet_uptime_minute, (int) TimeUnit.SECONDS.toMinutes(diff));
        }
        if (Duration.DAY.isGreaterThan(diff)) {
            return resourcer.pluralArg(R.plurals.music_snippet_uptime_hour, (int) TimeUnit.SECONDS.toHours(diff));
        }
        if (Duration.WEEK.isGreaterThan(diff)) {
            return resourcer.pluralArg(R.plurals.music_snippet_uptime_day, (int) TimeUnit.SECONDS.toDays(diff));
        }
        if (Duration.MONTH.isGreaterThan(diff)) {
            return resourcer.pluralArg(R.plurals.music_snippet_uptime_week, ((int) TimeUnit.SECONDS.toDays(diff)) / 7);
        }
        if (Duration.YEAR.isGreaterThan(diff)) {
            return resourcer.pluralArg(R.plurals.music_snippet_uptime_month, ((int) TimeUnit.SECONDS.toDays(diff)) / 30);
        }
        return resourcer.pluralArg(R.plurals.music_snippet_uptime_year, ((int) TimeUnit.SECONDS.toDays(diff)) / 365);
    }

    @NonNull
    public static CharSequence formatListeningsUpdateTime(@NonNull Resourcer resourcer, int listenings, long updateTime) {
        CharSequence listeningsFormatted = formatListenings(resourcer, listenings);
        CharSequence updateTimeFormatted = formatUpdateTime(resourcer, updateTime);
        if (listeningsFormatted.length() == 0) {
            return updateTimeFormatted;
        }
        return updateTimeFormatted.length() == 0 ? listeningsFormatted : resourcer.str(R.string.music_dot_delimiter, listeningsFormatted, updateTimeFormatted);
    }

    @NonNull
    public static CharSequence formatTotalSongsDuration(@NonNull Resourcer resourcer, int songs, long seconds) {
        CharSequence durationFormatted = DurationFormatter.formatDuration(resourcer, seconds);
        return durationFormatted.length() == 0 ? resourcer.pluralArg(R.plurals.music_songs, songs) : resourcer.str(R.string.music_dot_delimiter, resourcer.pluralArg(R.plurals.music_songs, songs), durationFormatted);
    }
}
