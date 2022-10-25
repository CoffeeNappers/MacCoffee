package com.vkontakte.android;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.Spannable;
import android.text.TextUtils;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.utils.TypefaceSpanAssets;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Link implements Parcelable {
    public static final Parcelable.Creator<Link> CREATOR = new Parcelable.Creator<Link>() { // from class: com.vkontakte.android.Link.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Link mo548createFromParcel(Parcel in) {
            return new Link(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Link[] mo549newArray(int size) {
            return new Link[size];
        }
    };
    public final String description;
    private CharSequence displayText;
    public final String image_src;
    public final String thumb;
    public final String title;
    public final String url;

    public CharSequence getDisplayText() {
        if (this.displayText == null && this.title != null) {
            Spannable spannable = Spannable.Factory.getInstance().newSpannable(this.title + (TextUtils.isEmpty(this.title) ? "" : "\n") + (this.description == null ? "" : this.description));
            spannable.setSpan(new TypefaceSpanAssets(Font.Medium.typeface), 0, this.title.length(), 0);
            this.displayText = spannable;
        }
        return this.displayText;
    }

    public Link(JSONObject object) {
        String thumb;
        this.url = object.optString("url");
        this.title = object.optString("title");
        this.description = object.optString("description");
        this.image_src = object.optString("image_src");
        try {
            thumb = String.valueOf(Uri.parse(this.url).getHost().charAt(0)).toUpperCase();
        } catch (Exception e) {
            thumb = "";
        }
        this.thumb = thumb;
    }

    public Link(Parcel parcel) {
        this.url = parcel.readString();
        this.title = parcel.readString();
        this.description = parcel.readString();
        this.image_src = parcel.readString();
        this.thumb = parcel.readString();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeString(this.url);
        parcel.writeString(this.title);
        parcel.writeString(this.description);
        parcel.writeString(this.image_src);
        parcel.writeString(this.thumb);
    }
}
