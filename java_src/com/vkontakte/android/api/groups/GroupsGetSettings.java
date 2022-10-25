package com.vkontakte.android.api.groups;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.GeoPlace;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.groupadmin.InfoFragment;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GroupsGetSettings extends VKAPIRequest<Result> {
    public GroupsGetSettings(int gid) {
        super("groups.getSettings");
        param("group_id", gid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            Result res = new Result();
            res.title = o2.getString("title");
            res.description = o2.getString("description");
            res.address = o2.getString("address");
            res.website = o2.getString("website");
            res.wall = o2.getInt(ReportAppInputData.REPORT_TYPE_WALL);
            res.photos = o2.getInt("photos");
            res.video = o2.getInt("video");
            res.audio = o2.getInt(MimeTypes.BASE_TYPE_AUDIO);
            res.docs = o2.getInt("docs");
            res.topics = o2.getInt("topics");
            res.wiki = o2.optInt("wiki");
            res.events = o2.optInt("events");
            res.places = o2.optInt("places");
            res.contacts = o2.optInt("contacts");
            res.links = o2.optInt("links");
            res.access = o2.optInt("access");
            if (o2.has("subject")) {
                res.subject = o2.optInt("subject");
            } else {
                res.subject = o2.optInt("public_category");
                res.subcategory = o2.optInt("public_subcategory");
            }
            res.startTime = o2.optInt(FirebaseAnalytics.Param.START_DATE);
            res.endTime = o2.optInt("finish_date");
            res.categories = new ArrayList();
            boolean hasNone = false;
            if (o2.has("subject_list")) {
                JSONArray a = o2.getJSONArray("subject_list");
                for (int i = 0; i < a.length(); i++) {
                    JSONObject c = a.getJSONObject(i);
                    InfoFragment.Category cat = new InfoFragment.Category();
                    cat.title = c.getString("name");
                    cat.id = c.getInt("id");
                    if (cat.id == 0) {
                        hasNone = true;
                    }
                    res.categories.add(cat);
                }
            } else if (o2.has("public_category_list")) {
                JSONArray a2 = o2.getJSONArray("public_category_list");
                for (int i2 = 0; i2 < a2.length(); i2++) {
                    JSONObject c2 = a2.getJSONObject(i2);
                    InfoFragment.Category cat2 = new InfoFragment.Category();
                    cat2.title = c2.getString("name");
                    cat2.id = c2.getInt("id");
                    if (cat2.id == 0) {
                        hasNone = true;
                    }
                    if (c2.has("subtypes_list")) {
                        cat2.subcategories = new ArrayList();
                        JSONArray sa = c2.getJSONArray("subtypes_list");
                        for (int j = 0; j < sa.length(); j++) {
                            JSONObject sc = sa.getJSONObject(j);
                            InfoFragment.Category subcat = new InfoFragment.Category();
                            subcat.id = sc.getInt("id");
                            subcat.title = sc.getString("name");
                            cat2.subcategories.add(subcat);
                        }
                    }
                    res.categories.add(cat2);
                }
            }
            if (!hasNone) {
                InfoFragment.Category none = new InfoFragment.Category();
                none.id = 0;
                none.title = VKApplication.context.getString(R.string.none_selected);
                res.categories.add(0, none);
            }
            if (!o2.has("place")) {
                return res;
            }
            res.place = new GeoPlace(o2.getJSONObject("place"));
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public static class Result implements Parcelable {
        public static final Parcelable.Creator<Result> CREATOR = new Parcelable.Creator<Result>() { // from class: com.vkontakte.android.api.groups.GroupsGetSettings.Result.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public Result mo692createFromParcel(Parcel source) {
                return new Result(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public Result[] mo693newArray(int size) {
                return new Result[size];
            }
        };
        public int access;
        public String address;
        public int audio;
        public List<InfoFragment.Category> categories;
        public int contacts;
        public String description;
        public int docs;
        public int endTime;
        public int events;
        public int links;
        public int photos;
        public GeoPlace place;
        public int places;
        public int startTime;
        public int subcategory;
        public int subject;
        public String title;
        public int topics;
        public int video;
        public int wall;
        public String website;
        public int wiki;

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.title);
            dest.writeString(this.description);
            dest.writeString(this.address);
            dest.writeString(this.website);
            dest.writeInt(this.wall);
            dest.writeInt(this.photos);
            dest.writeInt(this.video);
            dest.writeInt(this.audio);
            dest.writeInt(this.docs);
            dest.writeInt(this.topics);
            dest.writeInt(this.wiki);
            dest.writeInt(this.events);
            dest.writeInt(this.places);
            dest.writeInt(this.contacts);
            dest.writeInt(this.links);
            dest.writeInt(this.access);
            dest.writeInt(this.subject);
            dest.writeInt(this.subcategory);
            dest.writeTypedList(this.categories);
            dest.writeParcelable(this.place, 0);
            dest.writeInt(this.startTime);
            dest.writeInt(this.endTime);
        }

        public Result() {
        }

        protected Result(Parcel in) {
            this.title = in.readString();
            this.description = in.readString();
            this.address = in.readString();
            this.website = in.readString();
            this.wall = in.readInt();
            this.photos = in.readInt();
            this.video = in.readInt();
            this.audio = in.readInt();
            this.docs = in.readInt();
            this.topics = in.readInt();
            this.wiki = in.readInt();
            this.events = in.readInt();
            this.places = in.readInt();
            this.contacts = in.readInt();
            this.links = in.readInt();
            this.access = in.readInt();
            this.subject = in.readInt();
            this.subcategory = in.readInt();
            this.categories = in.createTypedArrayList(InfoFragment.Category.CREATOR);
            this.place = (GeoPlace) in.readParcelable(GeoPlace.class.getClassLoader());
            this.startTime = in.readInt();
            this.endTime = in.readInt();
        }
    }
}
