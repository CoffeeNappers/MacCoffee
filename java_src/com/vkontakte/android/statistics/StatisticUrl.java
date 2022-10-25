package com.vkontakte.android.statistics;

import android.support.annotation.Nullable;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes3.dex */
public class StatisticUrl extends StatisticBase {
    public static final Serializer.Creator<StatisticUrl> CREATOR = new Serializer.CreatorAdapter<StatisticUrl>() { // from class: com.vkontakte.android.statistics.StatisticUrl.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public StatisticUrl mo1087createFromSerializer(Serializer is) {
            StatisticUrl statisticUrl = new StatisticUrl(is.readString(), is.readString(), is.readString());
            statisticUrl.sent = is.readInt() != 0;
            return statisticUrl;
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public StatisticUrl[] mo1088newArray(int size) {
            return new StatisticUrl[size];
        }
    };
    public String value;

    private StatisticUrl(String value, @Nullable String type, @Nullable String key) {
        super(type, key);
        this.value = value;
    }

    public StatisticUrl(String value, @Nullable String type, int adsId1, int adsId2, int index, Statistic statistic) {
        this(value, type, generateKey(type, adsId1, adsId2, index, statistic));
    }

    public StatisticUrl(String value) {
        this(value, null, null);
    }

    private static String generateKey(String type, int adsId1, int adsId2, int index, Statistic statistic) {
        if ((adsId1 == 0 && adsId2 == 0) || type == null) {
            return null;
        }
        if (statistic != null) {
            return type + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + adsId1 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + adsId2 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + index + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + statistic.getStatisticHash();
        }
        return type + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + adsId1 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + adsId2 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + index + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.value);
        s.writeString(this.type);
        s.writeString(this.key);
        s.writeInt(this.sent ? 1 : 0);
    }

    public String toString() {
        return "StatisticUrl{sent=" + this.sent + ",type=" + this.type + ",key=" + this.key + ",value=" + this.value + "}";
    }
}
