package com.vkontakte.android;

import android.graphics.Rect;
import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.util.Screen;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Photo extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Photo> CREATOR = new Serializer.CreatorAdapter<Photo>() { // from class: com.vkontakte.android.Photo.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Photo mo1087createFromSerializer(Serializer s) {
            return new Photo(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Photo[] mo1088newArray(int size) {
            return new Photo[size];
        }
    };
    public String accessKey;
    public int albumID;
    public boolean canComment;
    public boolean canRepost;
    public ArrayList<NewsComment> comments;
    public int date;
    public String descr;
    public String fullURL;
    public String geoAddress;
    public boolean hidden;
    public int id;
    public boolean infoLoaded;
    public boolean isLiked;
    public double lat;
    public transient boolean loadingAddress;
    public double lon;
    public int nComments;
    public int nLikes;
    public int nReposts;
    public int nTags;
    public int ownerID;
    public int postID;
    public int realOffset;
    public ArrayList<Image> sizes;
    public ArrayList<PhotoTag> tags;
    public String thumbURL;
    public UserProfile user;
    public int userID;
    public Rect viewBounds;
    public int viewClipTop;

    public Photo() {
        this.infoLoaded = false;
        this.canComment = true;
        this.canRepost = true;
        this.tags = new ArrayList<>();
        this.sizes = new ArrayList<>();
        this.comments = new ArrayList<>();
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        this.loadingAddress = false;
        this.realOffset = -1;
    }

    public Photo(Serializer p) {
        boolean z = true;
        this.infoLoaded = false;
        this.canComment = true;
        this.canRepost = true;
        this.tags = new ArrayList<>();
        this.sizes = new ArrayList<>();
        this.comments = new ArrayList<>();
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        this.loadingAddress = false;
        this.realOffset = -1;
        this.id = p.readInt();
        this.albumID = p.readInt();
        this.ownerID = p.readInt();
        this.userID = p.readInt();
        this.date = p.readInt();
        this.nLikes = p.readInt();
        this.nReposts = p.readInt();
        this.nComments = p.readInt();
        this.nTags = p.readInt();
        this.infoLoaded = p.readInt() == 1;
        this.isLiked = p.readInt() == 1;
        this.canComment = p.readInt() == 1;
        this.canRepost = p.readByte() == 1;
        this.thumbURL = p.readString();
        this.fullURL = p.readString();
        this.geoAddress = p.readString();
        this.descr = p.readString();
        this.lat = p.readDouble();
        this.lon = p.readDouble();
        this.accessKey = p.readString();
        if (p.readByte() != 0) {
            this.viewBounds = new Rect(p.readInt(), p.readInt(), p.readInt(), p.readInt());
        } else {
            this.viewBounds = null;
        }
        this.viewClipTop = p.readInt();
        this.postID = p.readInt();
        this.hidden = p.readByte() != 1 ? false : z;
        deserializeImages(p.readString());
        this.realOffset = p.readInt();
    }

    public Photo(PhotoAttachment att) {
        this.infoLoaded = false;
        this.canComment = true;
        this.canRepost = true;
        this.tags = new ArrayList<>();
        this.sizes = new ArrayList<>();
        this.comments = new ArrayList<>();
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        this.loadingAddress = false;
        this.realOffset = -1;
        this.fullURL = att.srcBig;
        this.thumbURL = att.getThumbURL();
        this.albumID = att.aid;
        this.id = att.pid;
        this.ownerID = att.oid;
        this.userID = att.uid;
        this.date = att.date;
        this.descr = att.descr;
        this.accessKey = att.accessKey;
        this.sizes = new ArrayList<>();
        HashMap<String, PhotoAttachment.Image> sizes = att.images;
        Set<String> keys = sizes.keySet();
        for (String k : keys) {
            PhotoAttachment.Image im = sizes.get(k);
            Image p = new Image();
            p.height = im.height;
            p.width = im.width;
            p.type = im.type;
            p.url = im.url;
            this.sizes.add(p);
        }
        this.postID = att.postID;
        this.lat = att.lat;
        this.lon = att.lon;
    }

    public Photo(JSONObject obj) {
        boolean z = true;
        this.infoLoaded = false;
        this.canComment = true;
        this.canRepost = true;
        this.tags = new ArrayList<>();
        this.sizes = new ArrayList<>();
        this.comments = new ArrayList<>();
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        this.loadingAddress = false;
        this.realOffset = -1;
        try {
            this.id = obj.optInt("id", obj.optInt("pid"));
            this.ownerID = obj.getInt("owner_id");
            this.albumID = obj.optInt("album_id");
            this.userID = obj.optInt("user_id", this.ownerID);
            if (this.userID == 100) {
                this.userID = this.ownerID;
            }
            this.descr = obj.optString("text", "");
            this.accessKey = obj.optString("access_key");
            this.date = obj.optInt(ServerKeys.DATE, obj.optInt(ServerKeys.CREATED));
            if (obj.has("comments") && obj.has("tags")) {
                this.infoLoaded = true;
                this.nComments = obj.getJSONObject("comments").getInt(ServerKeys.COUNT);
                this.nTags = obj.getJSONObject("tags").getInt(ServerKeys.COUNT);
            }
            if (obj.has(ServerKeys.LIKES)) {
                this.nLikes = obj.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.COUNT);
                this.isLiked = obj.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.USER_LIKES) == 1;
            }
            if (obj.has("reposts")) {
                this.nReposts = obj.getJSONObject("reposts").getInt(ServerKeys.COUNT);
            }
            this.canComment = obj.optInt(ServerKeys.CAN_COMMENT, 1) == 1;
            this.canRepost = obj.optInt(ServerKeys.CAN_REPOST, 1) == 1;
            if (obj.has("sizes")) {
                JSONArray sizes = obj.getJSONArray("sizes");
                for (int i = 0; i < sizes.length(); i++) {
                    JSONObject size = sizes.getJSONObject(i);
                    Image img = new Image();
                    img.height = size.getInt("height");
                    img.width = size.getInt("width");
                    img.type = size.getString(ServerKeys.TYPE).charAt(0);
                    img.url = size.getString("src");
                    this.sizes.add(img);
                }
            }
            if (obj.has("lat") && obj.has("long")) {
                this.lat = obj.getDouble("lat");
                this.lon = obj.getDouble("long");
            }
            this.accessKey = obj.optString("access_key");
            this.postID = obj.optInt(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID);
            this.hidden = obj.optInt("hidden", 0) != 1 ? false : z;
            this.realOffset = obj.optInt("real_offset", -1);
        } catch (Exception x) {
            Log.w("vk", "Error parsing photo!", x);
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        int i = 1;
        p.writeInt(this.id);
        p.writeInt(this.albumID);
        p.writeInt(this.ownerID);
        p.writeInt(this.userID);
        p.writeInt(this.date);
        p.writeInt(this.nLikes);
        p.writeInt(this.nReposts);
        p.writeInt(this.nComments);
        p.writeInt(this.nTags);
        p.writeInt(this.infoLoaded ? 1 : 0);
        p.writeInt(this.isLiked ? 1 : 0);
        p.writeInt(this.canComment ? 1 : 0);
        p.writeByte((byte) (this.canRepost ? 1 : 0));
        p.writeString(this.thumbURL);
        p.writeString(this.fullURL);
        p.writeString(this.geoAddress);
        p.writeString(this.descr);
        p.writeDouble(this.lat);
        p.writeDouble(this.lon);
        p.writeString(this.accessKey);
        if (this.viewBounds == null) {
            p.writeByte((byte) 0);
        } else {
            p.writeByte((byte) 1);
            p.writeInt(this.viewBounds.left);
            p.writeInt(this.viewBounds.top);
            p.writeInt(this.viewBounds.right);
            p.writeInt(this.viewBounds.bottom);
        }
        p.writeInt(this.viewClipTop);
        p.writeInt(this.postID);
        if (!this.hidden) {
            i = 0;
        }
        p.writeByte((byte) i);
        p.writeString(serializeImages());
        p.writeInt(this.realOffset);
    }

    /* loaded from: classes2.dex */
    public static class Image {
        public int height;
        public char type;
        public String url;
        public int width;

        public String toString() {
            return "{" + this.type + ", " + this.width + "x" + this.height + ", " + this.url + "}";
        }
    }

    public Image getImageByWidth(int width) {
        int dif = Integer.MAX_VALUE;
        Image bestImage = null;
        Iterator<Image> it = this.sizes.iterator();
        while (it.hasNext()) {
            Image image = it.next();
            int newDif = Math.abs(image.width - width);
            if (newDif < dif && !TextUtils.isEmpty(image.url)) {
                bestImage = image;
                dif = newDif;
            }
        }
        if (bestImage == null) {
            Image bestImage2 = getImage('m');
            return bestImage2;
        }
        return bestImage;
    }

    public Image getImageByHeight(int height) {
        int dif = Integer.MAX_VALUE;
        Image bestImage = null;
        Iterator<Image> it = this.sizes.iterator();
        while (it.hasNext()) {
            Image image = it.next();
            int newDif = Math.abs(image.height - height);
            if (newDif < dif && image.height >= height) {
                bestImage = image;
                dif = newDif;
            }
        }
        if (bestImage == null) {
            Image bestImage2 = getImage('m');
            return bestImage2;
        }
        return bestImage;
    }

    public Image getImage(char s) {
        Iterator<Image> it = this.sizes.iterator();
        while (it.hasNext()) {
            Image im = it.next();
            if (im.type == s) {
                return im;
            }
        }
        if (s == 's' || s == 'm' || s == 'x') {
            Image im2 = new Image();
            im2.type = s;
            im2.height = 1;
            im2.width = 1;
            im2.url = "";
            return im2;
        }
        return null;
    }

    public Image getImage(char[] sizes) {
        for (char c : sizes) {
            Image im = getImage(c);
            if (im != null) {
                return im;
            }
        }
        return null;
    }

    public Image getImage(char s, char fallback) {
        Image im = getImage(s);
        return im != null ? im : getImage(fallback);
    }

    public String serializeImages() {
        ArrayList<String> ss = new ArrayList<>();
        Iterator<Image> it = this.sizes.iterator();
        while (it.hasNext()) {
            Image im = it.next();
            ss.add(im.type + "^" + im.url + "^" + im.width + "^" + im.height);
        }
        return TextUtils.join("$", ss);
    }

    public void deserializeImages(String s) {
        try {
            String[] ss = s.split("\\$");
            String srcX = null;
            String srcY = null;
            for (String p : ss) {
                String[] pp = p.split("\\^");
                Image im = new Image();
                im.type = pp[0].charAt(0);
                im.url = pp[1];
                im.width = Integer.parseInt(pp[2]);
                im.height = Integer.parseInt(pp[3]);
                this.sizes.add(im);
                if (im.type == 'm') {
                    this.thumbURL = im.url;
                }
                if (im.type == 'x') {
                    srcX = im.url;
                }
                if (im.type == 'y') {
                    srcY = im.url;
                }
            }
            if (Global.displayDensity > 1.0f || Screen.isTablet()) {
                if (srcY == null) {
                    srcY = srcX;
                }
                this.fullURL = srcY;
                return;
            }
            this.fullURL = srcX;
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }
}
