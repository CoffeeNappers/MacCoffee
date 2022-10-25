package com.vkontakte.android.data;

import android.support.annotation.Nullable;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.Photo;
import com.vkontakte.android.utils.Serializer;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Good extends Serializer.SerializableAdapter implements ServerKeys {
    public static final Serializer.Creator<Good> CREATOR = new Serializer.CreatorAdapter<Good>() { // from class: com.vkontakte.android.data.Good.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Good mo1087createFromSerializer(Serializer s) {
            return new Good(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Good[] mo1088newArray(int size) {
            return new Good[size];
        }
    };
    public final int availability;
    public final boolean can_comment;
    public final boolean can_repost;
    public final int category_id;
    public final String category_name;
    public final int category_section_id;
    public final String category_section_name;
    public final int date;
    public final String description;
    public final CharSequence descriptionPreview;
    public final CharSequence descriptionView;
    public final int id;
    public List<LikeInfo> likes;
    public int likes_count;
    public final int owner_id;
    @Nullable
    public final Photo[] photos;
    public final int price_amount;
    public final int price_currency_id;
    public final String price_currency_name;
    public final String price_text;
    public final String thumb_photo;
    public final String title;
    public int user_likes;
    public final int views_count;

    public Good(JSONObject o) {
        boolean z = true;
        this.likes = null;
        this.id = o.optInt("id");
        this.owner_id = o.optInt("owner_id");
        this.title = o.optString("title");
        this.description = o.optString("description");
        this.descriptionPreview = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.description)));
        this.descriptionView = Global.replaceEmoji(LinkParser.parseLinks(this.description));
        JSONObject price = o.optJSONObject("price");
        if (price != null) {
            this.price_amount = price.optInt(ServerKeys.AMOUNT);
            this.price_text = price.optString("text");
            JSONObject currency = price.optJSONObject("currency");
            if (currency != null) {
                this.price_currency_id = currency.optInt("id");
                this.price_currency_name = currency.optString("name");
            } else {
                this.price_currency_id = 0;
                this.price_currency_name = null;
            }
        } else {
            this.price_currency_id = 0;
            this.price_amount = 0;
            this.price_currency_name = null;
            this.price_text = null;
        }
        JSONObject category = o.optJSONObject(ServerKeys.CATEGORY);
        if (category != null) {
            this.category_id = category.optInt("id");
            this.category_name = category.optString("name");
            JSONObject section = category.optJSONObject(ServerKeys.SECTION);
            if (section != null) {
                this.category_section_id = section.optInt("id");
                this.category_section_name = section.optString("name");
            } else {
                this.category_section_id = 0;
                this.category_section_name = null;
            }
        } else {
            this.category_section_id = 0;
            this.category_id = 0;
            this.category_section_name = null;
            this.category_name = null;
        }
        this.thumb_photo = o.optString(ServerKeys.THUMB_PHOTO);
        this.date = o.optInt(ServerKeys.DATE);
        this.availability = o.optInt(ServerKeys.AVAILABLE);
        this.views_count = o.optInt(ServerKeys.VIEWS_COUNT);
        JSONArray photos = o.optJSONArray("photos");
        if (photos != null) {
            this.photos = new Photo[photos.length()];
            for (int i = 0; i < photos.length(); i++) {
                JSONObject photo = photos.optJSONObject(i);
                if (photo != null) {
                    this.photos[i] = new Photo(photo);
                } else {
                    this.photos[i] = null;
                }
            }
        } else {
            this.photos = null;
        }
        this.can_comment = o.optInt(ServerKeys.CAN_COMMENT) != 0;
        this.can_repost = o.optInt(ServerKeys.CAN_REPOST) == 0 ? false : z;
        JSONObject likes = o.optJSONObject(ServerKeys.LIKES);
        if (likes != null) {
            this.user_likes = likes.optInt(ServerKeys.USER_LIKES);
            this.likes_count = likes.optInt(ServerKeys.COUNT);
            return;
        }
        this.likes_count = 0;
        this.user_likes = 0;
    }

    public Good(Serializer s) {
        boolean z = true;
        this.likes = null;
        this.id = s.readInt();
        this.owner_id = s.readInt();
        this.title = s.readString();
        this.description = s.readString();
        this.descriptionPreview = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.description)));
        this.descriptionView = Global.replaceEmoji(LinkParser.parseLinks(this.description));
        this.price_amount = s.readInt();
        this.price_currency_id = s.readInt();
        this.price_currency_name = s.readString();
        this.price_text = s.readString();
        this.category_id = s.readInt();
        this.category_name = s.readString();
        this.category_section_id = s.readInt();
        this.category_section_name = s.readString();
        this.thumb_photo = s.readString();
        this.date = s.readInt();
        this.availability = s.readInt();
        this.photos = (Photo[]) s.createTypedArray(Photo.CREATOR);
        this.can_comment = s.readByte() != 0;
        this.can_repost = s.readByte() == 0 ? false : z;
        this.user_likes = s.readInt();
        this.likes_count = s.readInt();
        this.views_count = s.readInt();
        this.likes = s.createTypedArrayList(LikeInfo.CREATOR);
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        byte b = 1;
        s.writeInt(this.id);
        s.writeInt(this.owner_id);
        s.writeString(this.title);
        s.writeString(this.description);
        s.writeInt(this.price_amount);
        s.writeInt(this.price_currency_id);
        s.writeString(this.price_currency_name);
        s.writeString(this.price_text);
        s.writeInt(this.category_id);
        s.writeString(this.category_name);
        s.writeInt(this.category_section_id);
        s.writeString(this.category_section_name);
        s.writeString(this.thumb_photo);
        s.writeInt(this.date);
        s.writeInt(this.availability);
        s.writeTypedArray(this.photos);
        s.writeByte(this.can_comment ? (byte) 1 : (byte) 0);
        if (!this.can_repost) {
            b = 0;
        }
        s.writeByte(b);
        s.writeInt(this.user_likes);
        s.writeInt(this.likes_count);
        s.writeInt(this.views_count);
        s.writeTypedList(this.likes);
    }
}
