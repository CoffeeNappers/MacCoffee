package com.vkontakte.android.statistics;

import android.text.TextUtils;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes3.dex */
public class StatisticPrettyCard extends StatisticBase {
    public static final Serializer.Creator<StatisticPrettyCard> CREATOR = new Serializer.CreatorAdapter<StatisticPrettyCard>() { // from class: com.vkontakte.android.statistics.StatisticPrettyCard.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public StatisticPrettyCard mo1087createFromSerializer(Serializer is) {
            StatisticPrettyCard statistic = new StatisticPrettyCard(is.readString(), is.readString(), is.readString());
            statistic.sent = is.readInt() != 0;
            return statistic;
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public StatisticPrettyCard[] mo1088newArray(int size) {
            return new StatisticPrettyCard[size];
        }
    };
    public String adData;
    public String cardData;

    public StatisticPrettyCard(String adData, String cardData, int adsId1, int adsId2, String cardId) {
        this(generateKey(adsId1, adsId2, cardId), adData, cardData);
    }

    private StatisticPrettyCard(String key, String adData, String cardData) {
        super(Statistic.TYPE_IMPRESSION_PRETTY_CARD, key);
        this.adData = adData;
        this.cardData = cardData;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.key);
        s.writeString(this.adData);
        s.writeString(this.cardData);
        s.writeInt(this.sent ? 1 : 0);
    }

    public boolean isValid() {
        return !TextUtils.isEmpty(this.adData) && !TextUtils.isEmpty(this.cardData);
    }

    private static String generateKey(int adsId1, int adsId2, String cardId) {
        return "ads/impression_pretty_card_" + adsId1 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + adsId2 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + cardId;
    }

    public String toString() {
        return "StatisticPrettyCard{type=" + this.type + ",key=" + this.key + ",adData=" + this.adData + ", cardData=" + this.cardData + "}";
    }
}
