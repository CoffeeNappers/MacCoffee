package com.vkontakte.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Document implements Parcelable, BaseDocument {
    public static final Parcelable.Creator<Document> CREATOR = new Parcelable.Creator<Document>() { // from class: com.vkontakte.android.api.Document.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Document mo574createFromParcel(Parcel in) {
            return new Document(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Document[] mo575newArray(int size) {
            return new Document[size];
        }
    };
    public String access_key;
    public int date;
    public int did;
    public int duration;
    public String ext;
    public int height;
    public String linkMp3;
    public String linkOgg;
    public int oid;
    public int size;
    public String thumb;
    public String title;
    public String url;
    @Nullable
    public String video;
    public byte[] waveform;
    public int width;

    public Document() {
    }

    public Document(Parcel s) {
        this.did = s.readInt();
        this.oid = s.readInt();
        this.size = s.readInt();
        this.url = s.readString();
        this.title = s.readString();
        this.ext = s.readString();
        this.thumb = s.readString();
        this.date = s.readInt();
        this.video = s.readString();
        this.width = s.readInt();
        this.height = s.readInt();
        this.access_key = s.readString();
    }

    public Document(JSONObject j) {
        String requiredSize;
        JSONArray sizes;
        try {
            this.did = j.optInt("id", j.optInt("did"));
            this.oid = j.getInt("owner_id");
            this.title = j.getString("title");
            this.size = j.getInt("size");
            this.ext = j.getString("ext");
            this.url = j.getString("url");
            this.access_key = j.optString("access_key");
            JSONObject preview = j.optJSONObject("preview");
            if (preview != null) {
                JSONObject video = preview.optJSONObject("video");
                if (video != null) {
                    this.video = video.optString("src");
                    this.width = video.optInt("width");
                    this.height = video.optInt("height");
                    requiredSize = "o";
                } else {
                    requiredSize = "m";
                }
                JSONObject graffiti = preview.optJSONObject("graffiti");
                if (graffiti != null) {
                    this.width = graffiti.optInt("width");
                    this.height = graffiti.optInt("height");
                    requiredSize = "o";
                }
                JSONObject photo = preview.optJSONObject("photo");
                if (photo != null && (sizes = photo.optJSONArray("sizes")) != null) {
                    int i = 0;
                    while (true) {
                        if (i >= sizes.length()) {
                            break;
                        }
                        JSONObject size = sizes.getJSONObject(i);
                        if (!requiredSize.equals(size.getString(ServerKeys.TYPE))) {
                            i++;
                        } else {
                            this.thumb = size.getString("src");
                            if (this.width == 0) {
                                this.width = size.optInt("width");
                            }
                            if (this.height == 0) {
                                this.height = size.optInt("height");
                            }
                        }
                    }
                }
                JSONObject audio = preview.optJSONObject("audio_msg");
                if (audio != null) {
                    this.linkOgg = audio.optString("link_ogg");
                    this.linkMp3 = audio.optString("link_mp3");
                    this.duration = audio.optInt("duration");
                    JSONArray wave = audio.getJSONArray("waveform");
                    if (wave != null) {
                        this.waveform = new byte[wave.length()];
                        for (int i2 = 0; i2 < wave.length(); i2++) {
                            this.waveform[i2] = (byte) wave.optInt(i2);
                        }
                    }
                }
            }
            if (j.has("gift")) {
                this.thumb = this.url;
                this.url = null;
                this.title = VKApplication.context.getResources().getString(R.string.gift);
            }
            this.date = j.getInt(ServerKeys.DATE);
        } catch (Exception x) {
            L.e("Error parsing doc", x);
        }
    }

    @Override // com.vkontakte.android.api.BaseDocument
    public String getTitle() {
        return this.title;
    }

    @Override // com.vkontakte.android.api.BaseDocument
    public String getExt() {
        return this.ext;
    }

    @Override // com.vkontakte.android.api.BaseDocument
    public int getSize() {
        return this.size;
    }

    @Override // com.vkontakte.android.api.BaseDocument
    public int getDate() {
        return this.date;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.did);
        dest.writeInt(this.oid);
        dest.writeInt(this.size);
        dest.writeString(this.url);
        dest.writeString(this.title);
        dest.writeString(this.ext);
        dest.writeString(this.thumb);
        dest.writeInt(this.date);
        dest.writeString(this.video);
        dest.writeInt(this.width);
        dest.writeInt(this.height);
        dest.writeString(this.access_key);
    }
}
