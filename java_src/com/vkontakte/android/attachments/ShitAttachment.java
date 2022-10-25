package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class ShitAttachment extends Attachment implements Statistic {
    public static final Serializer.Creator<ShitAttachment> CREATOR = new Serializer.CreatorAdapter<ShitAttachment>() { // from class: com.vkontakte.android.attachments.ShitAttachment.1
        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public ShitAttachment mo1087createFromSerializer(Serializer is) {
            ShitAttachment ad = new ShitAttachment(is.readString(), is.readString(), is.readString(), is.readString(), is.readFloat(), is.readString(), is.readString(), (StatisticUrl) is.readSerializable(StatisticUrl.class.getClassLoader()), is.readString(), is.readString(), is.readInt(), is.readString(), is.readString(), is.readInt(), is.readString(), is.readString(), is.readString());
            ad.photo = (PhotoAttachment) is.readSerializable(PhotoAttachment.class.getClassLoader());
            int c = is.readInt();
            for (int i = 0; i < c; i++) {
                ad.cards.add(is.readSerializable(Card.class.getClassLoader()));
            }
            ad.statistics.readFromSerializer(is);
            ad.video = (VideoAttachment) is.readSerializable(VideoAttachment.class.getClassLoader());
            return ad;
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public ShitAttachment[] mo1088newArray(int size) {
            return new ShitAttachment[size];
        }
    };
    public static final int TARGET_EXTERNAL = 0;
    public static final int TARGET_INTERNAL = 1;
    public static final int TARGET_INTERNAL_VISIBLE = 2;
    public String ageRestriction;
    public String appPackage;
    public String buttonText;
    public String buttonTextInstalled;
    public String data;
    public StatisticUrl dataImpression;
    public String deepLink;
    public String followers;
    public String genre;
    public String guid;
    public transient boolean installed;
    public String link;
    public int linkTarget;
    public PhotoAttachment photo;
    public float rating;
    public String text;
    public int timeToLive;
    public String userName;
    public String userPhoto;
    public VideoAttachment video;
    public final Statistic.StatisticHelper statistics = new Statistic.StatisticHelper();
    public ArrayList<Card> cards = new ArrayList<>();

    public ShitAttachment() {
    }

    public ShitAttachment(String _guid, String _followers, String _btnText, String _link, float _rating, String _buttonTextInstalled, String _data, StatisticUrl _dataImpression, String _appPackage, String _deepLink, int _linkTarget, String _text, String _genre, int _timeToLive, String _userName, String _userPhoto, String _ageRestriction) {
        this.guid = _guid;
        this.followers = _followers;
        this.buttonText = _btnText;
        this.link = _link;
        this.rating = _rating;
        this.buttonTextInstalled = _buttonTextInstalled;
        this.data = _data;
        this.dataImpression = _dataImpression;
        this.appPackage = _appPackage;
        this.deepLink = _deepLink;
        this.linkTarget = _linkTarget;
        this.text = _text;
        this.genre = _genre;
        this.timeToLive = _timeToLive;
        this.userName = _userName;
        this.userPhoto = _userPhoto;
        this.ageRestriction = _ageRestriction;
        updateInstallationState();
    }

    @Override // com.vkontakte.android.statistics.Statistic
    public void addStatisticUrl(StatisticUrl url) {
        this.statistics.addStatisticUrl(url);
    }

    @Override // com.vkontakte.android.statistics.Statistic
    public int getStatisticSizeByType(String type) {
        return this.statistics.getStatisticSizeByType(type);
    }

    @Override // com.vkontakte.android.statistics.Statistic
    public int getStatisticHash() {
        return 0;
    }

    @Override // com.vkontakte.android.statistics.Statistic
    public List<StatisticUrl> getStatisticByType(String type) {
        return this.statistics.getStatisticByType(type);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return null;
    }

    public void updateInstallationState() {
        this.installed = isAppInstalled(this.appPackage);
        Iterator<Card> it = this.cards.iterator();
        while (it.hasNext()) {
            Card card = it.next();
            card.updateInstallationState();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isAppInstalled(String appPackage) {
        if (appPackage == null || appPackage.length() == 0) {
            return false;
        }
        try {
            VKApplication.context.getPackageManager().getPackageInfo(appPackage, 0);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer os) {
        os.writeString(this.guid);
        os.writeString(this.followers);
        os.writeString(this.buttonText);
        os.writeString(this.link);
        os.writeFloat(this.rating);
        os.writeString(this.buttonTextInstalled);
        os.writeString(this.data);
        os.writeSerializable(this.dataImpression);
        os.writeString(this.appPackage);
        os.writeString(this.deepLink);
        os.writeInt(this.linkTarget);
        os.writeString(this.text);
        os.writeString(this.genre);
        os.writeInt(this.timeToLive);
        os.writeString(this.userName);
        os.writeString(this.userPhoto);
        os.writeString(this.ageRestriction);
        os.writeSerializable(this.photo);
        os.writeInt(this.cards.size());
        Iterator<Card> it = this.cards.iterator();
        while (it.hasNext()) {
            Card card = it.next();
            os.writeSerializable(card);
        }
        this.statistics.serializeTo(os);
        os.writeSerializable(this.video);
    }

    /* loaded from: classes2.dex */
    public static class Card extends Serializer.SerializableAdapter implements Statistic {
        public static final Serializer.Creator<Card> CREATOR = new Serializer.CreatorAdapter<Card>() { // from class: com.vkontakte.android.attachments.ShitAttachment.Card.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Card mo1087createFromSerializer(Serializer is) {
                Card card = new Card();
                card.link = is.readString();
                card.title = is.readString();
                card.deepLink = is.readString();
                card.appPackage = is.readString();
                card.description = is.readString();
                card.followers = is.readString();
                card.buttonText = is.readString();
                card.buttonTextInstalled = is.readString();
                card.rating = is.readFloat();
                card.linkTarget = is.readInt();
                card.photo = (PhotoAttachment) is.readSerializable(PhotoAttachment.class.getClassLoader());
                card.statistics.readFromSerializer(is);
                card.updateInstallationState();
                return card;
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Card[] mo1088newArray(int size) {
                return new Card[size];
            }
        };
        public String appPackage;
        public String buttonText;
        public String buttonTextInstalled;
        public String deepLink;
        public String description;
        public String followers;
        public transient boolean installed;
        public String link;
        public int linkTarget;
        public PhotoAttachment photo;
        public float rating;
        public final Statistic.StatisticHelper statistics = new Statistic.StatisticHelper();
        public String title;

        @Override // com.vkontakte.android.statistics.Statistic
        public void addStatisticUrl(StatisticUrl url) {
            this.statistics.addStatisticUrl(url);
        }

        @Override // com.vkontakte.android.statistics.Statistic
        public int getStatisticSizeByType(String type) {
            return this.statistics.getStatisticSizeByType(type);
        }

        @Override // com.vkontakte.android.statistics.Statistic
        public int getStatisticHash() {
            if (this.photo == null || this.photo.srcThumb == null) {
                return 0;
            }
            return this.photo.srcThumb.hashCode();
        }

        @Override // com.vkontakte.android.statistics.Statistic
        public List<StatisticUrl> getStatisticByType(String type) {
            return this.statistics.getStatisticByType(type);
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer os) {
            os.writeString(this.link);
            os.writeString(this.title);
            os.writeString(this.deepLink);
            os.writeString(this.appPackage);
            os.writeString(this.description);
            os.writeString(this.followers);
            os.writeString(this.buttonText);
            os.writeString(this.buttonTextInstalled);
            os.writeFloat(this.rating);
            os.writeInt(this.linkTarget);
            os.writeSerializable(this.photo);
            this.statistics.serializeTo(os);
        }

        public void updateInstallationState() {
            this.installed = ShitAttachment.isAppInstalled(this.appPackage);
        }
    }
}
