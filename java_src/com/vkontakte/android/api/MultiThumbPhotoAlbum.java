package com.vkontakte.android.api;

import android.os.Parcel;
import android.util.Log;
import com.vkontakte.android.Global;
import com.vkontakte.android.Photo;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MultiThumbPhotoAlbum extends PhotoAlbum {
    public ArrayList<String> thumbs;

    public MultiThumbPhotoAlbum() {
        this.thumbs = new ArrayList<>();
    }

    public MultiThumbPhotoAlbum(JSONObject ja) {
        super(ja);
        this.thumbs = new ArrayList<>();
        char size = 'm';
        if (Global.displayDensity > 2.0f) {
            size = 'q';
        } else if (Global.displayDensity > 1.5f) {
            size = 'p';
        } else if (Global.displayDensity >= 1.0f) {
            size = 'o';
        }
        try {
            JSONArray xthumbs = ja.getJSONArray("last_photos");
            for (int i = 0; i < xthumbs.length(); i++) {
                Photo photo = new Photo(xthumbs.getJSONObject(i));
                this.thumbs.add(photo.getImage(size, 'm').url);
            }
        } catch (Exception x) {
            Log.w("vk", "Error parsing ext thumbs", x);
        }
    }

    public MultiThumbPhotoAlbum(Parcel p) {
        super(p);
        this.thumbs = new ArrayList<>();
    }
}
