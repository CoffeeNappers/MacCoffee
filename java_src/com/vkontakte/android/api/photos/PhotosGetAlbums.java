package com.vkontakte.android.api.photos;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.MultiThumbPhotoAlbum;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosGetAlbums extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public ArrayList<PhotoAlbum> albums;
        public ArrayList<PhotoAlbum> system;
    }

    public PhotosGetAlbums(int oid, boolean needSystem) {
        super("photos.getAlbums");
        param("owner_id", oid);
        param("need_covers", 1);
        if (needSystem) {
            param("need_system", 1);
        }
        param(ServerKeys.PHOTO_SIZES, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            String needSize = TtmlNode.TAG_P;
            if (Global.displayDensity >= 1.5f) {
                needSize = "q";
            }
            if (Global.displayDensity >= 2.0f) {
                needSize = "r";
            }
            ArrayList<PhotoAlbum> result = new ArrayList<>();
            int numSystem = 0;
            JSONArray al = APIUtils.unwrapArray(o, ServerKeys.RESPONSE).array;
            if (al != null) {
                for (int i = 0; i < al.length(); i++) {
                    JSONObject ja = al.getJSONObject(i);
                    if (!ja.has("size") || ja.optInt("size", -1) == -1) {
                        Log.w("vk", "No size for album " + ja);
                    } else {
                        PhotoAlbum a = new PhotoAlbum(ja);
                        if (a.title.length() == 0) {
                            a.title = VKApplication.context.getResources().getString(R.string.album_unnamed);
                        }
                        JSONArray sizes = ja.optJSONArray("sizes");
                        if (sizes != null) {
                            HashMap<String, String> thumbs = new HashMap<>();
                            for (int j = 0; j < sizes.length(); j++) {
                                JSONObject size = sizes.getJSONObject(j);
                                thumbs.put(size.getString(ServerKeys.TYPE), size.getString("src"));
                            }
                            if (thumbs.containsKey(needSize)) {
                                a.thumbURL = thumbs.get(needSize);
                            } else {
                                a.thumbURL = thumbs.get((Global.displayDensity < 2.0f || !NetworkStateReceiver.isHighSpeed() || !thumbs.containsKey("x")) ? "m" : "x");
                            }
                        }
                        if (ja.has("can_upload")) {
                            a.canUpload = ja.getInt("can_upload") == 1;
                        }
                        if (a.id < 0) {
                            result.add(numSystem, a);
                            numSystem++;
                        } else {
                            result.add(a);
                        }
                    }
                }
            }
            ArrayList<PhotoAlbum> system = new ArrayList<>();
            if (o.getJSONObject(ServerKeys.RESPONSE).has("all_photos")) {
                JSONObject ja2 = o.getJSONObject(ServerKeys.RESPONSE).getJSONObject("all_photos");
                MultiThumbPhotoAlbum userPhotos = new MultiThumbPhotoAlbum(ja2);
                userPhotos.title = VKApplication.context.getResources().getString(R.string.all_photos);
                JSONArray sizes2 = ja2.optJSONArray("sizes");
                String r = "";
                if (sizes2 != null) {
                    int j2 = 0;
                    while (true) {
                        if (j2 >= sizes2.length()) {
                            break;
                        }
                        JSONObject size2 = sizes2.getJSONObject(j2);
                        if (needSize.equals(size2.getString(ServerKeys.TYPE))) {
                            userPhotos.thumbURL = size2.getString("src");
                            break;
                        }
                        if (("m".equals(size2.getString(ServerKeys.TYPE)) && Global.displayDensity < 2.0f) || ("x".equals(size2.getString(ServerKeys.TYPE)) && Global.displayDensity <= 2.0f)) {
                            r = size2.getString("src");
                        }
                        j2++;
                    }
                }
                if (userPhotos.thumbURL == null || userPhotos.thumbURL.length() == 0) {
                    userPhotos.thumbURL = r;
                }
                system.add(userPhotos);
            }
            if (o.getJSONObject(ServerKeys.RESPONSE).has("user_photos")) {
                JSONObject ja3 = o.getJSONObject(ServerKeys.RESPONSE).getJSONObject("user_photos");
                MultiThumbPhotoAlbum userPhotos2 = new MultiThumbPhotoAlbum(ja3);
                userPhotos2.title = VKApplication.context.getResources().getString(R.string.user_photos_title, userPhotos2.title);
                JSONArray sizes3 = ja3.optJSONArray("sizes");
                String r2 = "";
                if (sizes3 != null) {
                    int j3 = 0;
                    while (true) {
                        if (j3 >= sizes3.length()) {
                            break;
                        }
                        JSONObject size3 = sizes3.getJSONObject(j3);
                        if (needSize.equals(size3.getString(ServerKeys.TYPE))) {
                            userPhotos2.thumbURL = size3.getString("src");
                            break;
                        }
                        if (("m".equals(size3.getString(ServerKeys.TYPE)) && Global.displayDensity < 2.0f) || ("x".equals(size3.getString(ServerKeys.TYPE)) && Global.displayDensity <= 2.0f)) {
                            r2 = size3.getString("src");
                        }
                        j3++;
                    }
                }
                if (userPhotos2.thumbURL == null || userPhotos2.thumbURL.length() == 0) {
                    userPhotos2.thumbURL = r2;
                }
                system.add(userPhotos2);
            }
            Result r3 = new Result();
            r3.albums = result;
            r3.system = system;
            return r3;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
