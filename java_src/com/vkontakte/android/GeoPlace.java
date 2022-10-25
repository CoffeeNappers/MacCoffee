package com.vkontakte.android;

import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.api.models.Model;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GeoPlace extends Model implements Parcelable {
    public static final Parcelable.Creator<GeoPlace> CREATOR = new Parcelable.Creator<GeoPlace>() { // from class: com.vkontakte.android.GeoPlace.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GeoPlace mo544createFromParcel(Parcel source) {
            return new GeoPlace(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GeoPlace[] mo545newArray(int size) {
            return new GeoPlace[size];
        }
    };
    public String address;
    public int checkins;
    public String city;
    public String country;
    public int distance;
    public int groupID;
    public int id;
    public double lat;
    public double lon;
    public String photo;
    public String title;

    public GeoPlace() {
        this.id = 0;
        this.title = "";
        this.photo = "";
        this.address = "";
    }

    public GeoPlace(JSONObject o) {
        this.id = 0;
        this.title = "";
        this.photo = "";
        this.address = "";
        try {
            this.id = o.getInt("id");
            this.title = o.getString("title");
            this.lat = o.getDouble("latitude");
            this.lon = o.getDouble("longitude");
            this.checkins = o.optInt("checkins");
            this.photo = o.optString("group_photo");
            this.groupID = o.optInt("group_id");
            this.distance = o.optInt("distance");
            this.address = o.optString("address", "");
            this.city = o.optString("city");
            this.country = o.optString("country");
        } catch (Exception x) {
            Log.w("vk", "Error parsing GeoPlace " + o, x);
        }
    }

    public String toString() {
        if (this.title != null && this.title.length() > 0) {
            return this.title;
        }
        if (this.address != null && this.address.length() > 0) {
            return this.address;
        }
        return this.lat + "," + this.lon;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.id);
        dest.writeString(this.title);
        dest.writeDouble(this.lat);
        dest.writeDouble(this.lon);
        dest.writeInt(this.checkins);
        dest.writeString(this.photo);
        dest.writeInt(this.groupID);
        dest.writeInt(this.distance);
        dest.writeString(this.address);
        dest.writeString(this.city);
        dest.writeString(this.country);
    }

    protected GeoPlace(Parcel in) {
        this.id = 0;
        this.title = "";
        this.photo = "";
        this.address = "";
        this.id = in.readInt();
        this.title = in.readString();
        this.lat = in.readDouble();
        this.lon = in.readDouble();
        this.checkins = in.readInt();
        this.photo = in.readString();
        this.groupID = in.readInt();
        this.distance = in.readInt();
        this.address = in.readString();
        this.city = in.readString();
        this.country = in.readString();
    }
}
