package com.vkontakte.android.api.models;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.gifts.GiftsGet;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftItem extends Model implements Parcelable {
    public static final Parcelable.Creator<GiftItem> CREATOR = new Parcelable.Creator<GiftItem>() { // from class: com.vkontakte.android.api.models.GiftItem.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GiftItem mo734createFromParcel(Parcel source) {
            return new GiftItem(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GiftItem[] mo735newArray(int size) {
            return new GiftItem[size];
        }
    };
    public long date;
    public String dateStr;
    @Nullable
    public GiftsGet.UserProfile from;
    public int from_id;
    @Nullable
    public Gift gift;
    public String giftHash;
    public int id;
    @Nullable
    public String message;
    private int privacy;

    public GiftItem(JSONObject source) {
        this.id = source.optInt("id");
        this.from_id = source.optInt(ServerKeys.FROM_ID);
        this.message = source.optString("message");
        this.date = source.optLong(ServerKeys.DATE);
        JSONObject gift = source.optJSONObject("gift");
        if (gift != null) {
            this.gift = new Gift(gift);
        }
        this.privacy = source.optInt(ShareConstants.WEB_DIALOG_PARAM_PRIVACY);
        this.giftHash = source.optString("gift_hash");
        this.dateStr = TimeUtils.langDateRelative((int) this.date, VKApplication.context.getResources());
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.id);
        dest.writeInt(this.from_id);
        dest.writeParcelable(this.from, 0);
        dest.writeString(this.message);
        dest.writeLong(this.date);
        dest.writeParcelable(this.gift, 0);
        dest.writeInt(this.privacy);
        dest.writeString(this.giftHash);
        dest.writeString(this.dateStr);
    }

    public boolean isPrivate() {
        return this.privacy != 0;
    }

    private GiftItem(Parcel in) {
        this.id = in.readInt();
        this.from_id = in.readInt();
        this.from = (GiftsGet.UserProfile) in.readParcelable(GiftsGet.UserProfile.class.getClassLoader());
        this.message = in.readString();
        this.date = in.readLong();
        this.gift = (Gift) in.readParcelable(Gift.class.getClassLoader());
        this.privacy = in.readInt();
        this.giftHash = in.readString();
        this.dateStr = in.readString();
    }
}
