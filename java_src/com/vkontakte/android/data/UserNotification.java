package com.vkontakte.android.data;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.SparseArray;
import com.facebook.internal.NativeProtocol;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.sharing.SharingService;
import com.vkontakte.android.Image;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.apps.HideNotificationRequest;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.utils.JSONSerializable;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.LinkUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UserNotification implements Parcelable, JSONSerializable {
    public static final String ACTION_ENABLE_TOP_NEWSFEED = "com.vkontakte.android.USER_NOTIFICATIONS_ENABLE_TOP_NEWSFEED";
    public static final String ACTION_HIDE_USER_NOTIFICATION = "com.vkontakte.android.USER_NOTIFICATIONS_HIDE_USER_NOTIFICATION";
    public static final String BUTTON_ACTION_OPEN_URL = "open_url";
    public static final String BUTTON_ENABLE_TOP_NEWSFEED = "enable_top_newsfeed";
    public static final String BUTTON_STYLE_CELL = "cell";
    public static final String BUTTON_STYLE_NEW_POST = "btn_new_post";
    public static final String BUTTON_STYLE_PRIMARY = "primary";
    public static final String BUTTON_STYLE_SECONDARY = "secondary";
    public static final Parcelable.Creator<UserNotification> CREATOR = new Parcelable.Creator<UserNotification>() { // from class: com.vkontakte.android.data.UserNotification.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public UserNotification mo982createFromParcel(Parcel in) {
            return new UserNotification(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public UserNotification[] mo983newArray(int size) {
            return new UserNotification[size];
        }
    };
    public static final String LAST_GET_NOTIFY_APP = "last_get_notify_app";
    public static final String LAYOUT_NEWSFEED_APP = "app";
    public static final String LAYOUT_NEWSFEED_BANNER = "banner";
    public static final String LAYOUT_NEWSFEED_INFO = "info";
    public static final String LAYOUT_NEWSFEED_NEW_POST = "new_post";
    public static final String TYPE_ALERT = "alert";
    public static final String TYPE_BUBBLE = "bubble";
    public static final String TYPE_NEWSFEED = "newsfeed";
    public final String buttonAction;
    public String buttonStyle;
    public final String buttonText;
    public final String buttonUrl;
    public final String buttonUrlTarget;
    public final int id;
    public final Image[] images;
    private boolean isHided;
    public String layout;
    public final String message;
    @Nullable
    public final String profileDescription;
    @Nullable
    public final ArrayList<UserProfile> profiles;
    public final String title;
    public final String type;

    public UserNotification(JSONObject jo, String type, int id, SparseArray<UserProfile> profiles) {
        this.isHided = false;
        this.id = id;
        this.title = jo.optString("title");
        this.message = jo.optString("message");
        this.type = type;
        this.layout = jo.optString(TtmlNode.TAG_LAYOUT);
        JSONObject button = jo.optJSONObject(ServerKeys.BUTTON);
        if (button == null) {
            this.buttonUrlTarget = null;
            this.buttonUrl = null;
            this.buttonAction = null;
            this.buttonStyle = null;
            this.buttonText = null;
        } else {
            this.buttonText = button.optString("title");
            if (LAYOUT_NEWSFEED_NEW_POST.equalsIgnoreCase(this.layout)) {
                this.buttonStyle = BUTTON_STYLE_NEW_POST;
            } else {
                this.buttonStyle = button.optString("style", BUTTON_STYLE_CELL);
            }
            JSONObject action = button.optJSONObject(NativeProtocol.WEB_DIALOG_ACTION);
            this.buttonAction = action == null ? null : action.optString(ServerKeys.TYPE);
            this.buttonUrl = action == null ? null : action.optString("url");
            this.buttonUrlTarget = action == null ? null : action.optString(SharingService.EXTRA_TARGET);
        }
        JSONArray images = jo.optJSONArray("images");
        if (images != null) {
            this.images = new Image[images.length()];
            for (int i = 0; i < this.images.length; i++) {
                this.images[i] = new Image(images.optJSONObject(i));
            }
        } else {
            this.images = null;
        }
        JSONArray jUsers = jo.optJSONArray(ServerKeys.USER_IDS);
        JSONArray jGroups = jo.optJSONArray("group_ids");
        if (jUsers != null) {
            this.profileDescription = jo.optString(ServerKeys.USER_DESCRIPTION, null);
            this.profiles = new ArrayList<>();
            for (int i2 = 0; i2 < jUsers.length(); i2++) {
                UserProfile p = profiles.get(jUsers.optInt(i2));
                if (p != null) {
                    this.profiles.add(p);
                }
            }
        } else if (jGroups != null) {
            this.profileDescription = jo.optString("groups_description", null);
            this.profiles = new ArrayList<>();
            for (int i3 = 0; i3 < jGroups.length(); i3++) {
                UserProfile p2 = profiles.get(-jGroups.optInt(i3));
                if (p2 != null) {
                    this.profiles.add(p2);
                }
            }
        } else {
            this.profileDescription = null;
            this.profiles = null;
        }
    }

    public UserNotification(JSONObject object, int version) {
        this.isHided = false;
        this.id = object.optInt("id", 0);
        this.isHided = object.optBoolean("isHided", false);
        this.title = object.optString("title", null);
        this.message = object.optString("message", null);
        this.type = object.optString(ServerKeys.TYPE, null);
        this.layout = object.optString(TtmlNode.TAG_LAYOUT, null);
        this.buttonText = object.optString("buttonText", null);
        this.buttonAction = object.optString("buttonAction", null);
        this.buttonStyle = object.optString("buttonStyle", null);
        this.buttonUrl = object.optString("buttonUrl", null);
        this.buttonUrlTarget = object.optString("buttonUrlTarget", null);
        JSONArray images = object.optJSONArray("images");
        if (images != null) {
            this.images = new Image[images.length()];
            for (int i = 0; i < this.images.length; i++) {
                this.images[i] = new Image(images.optJSONObject(i));
            }
        } else {
            this.images = null;
        }
        this.profileDescription = object.optString("profileDescription", null);
        JSONArray profilesArray = object.optJSONArray("profiles");
        if (profilesArray == null) {
            this.profiles = null;
            return;
        }
        this.profiles = new ArrayList<>(profilesArray.length());
        for (int i2 = 0; i2 < profilesArray.length(); i2++) {
            JSONObject jo = profilesArray.optJSONObject(i2);
            if (jo != null) {
                UserProfile profile = new UserProfile();
                profile.uid = jo.optInt("id");
                profile.photo = jo.optString("photo");
                this.profiles.add(profile);
            }
        }
    }

    @Nullable
    public Image findImage(int w) {
        return findImage(w, -1);
    }

    @Nullable
    public Image findImage(int w, int h) {
        Image image = null;
        for (int i = 0; this.images != null && i < this.images.length; i++) {
            if (image == null) {
                image = this.images[i];
            } else if (h > 0) {
                if (Math.abs(image.w - w) + Math.abs(image.h - h) > Math.abs(this.images[i].w - w) + Math.abs(this.images[i].h - h)) {
                    image = this.images[i];
                }
            } else if (Math.abs(image.w - w) > Math.abs(this.images[i].w - w)) {
                image = this.images[i];
            }
        }
        return image;
    }

    @Nullable
    public String findImageUrl(int w, int h) {
        Image image = findImage(w, h);
        if (image == null) {
            return null;
        }
        return image.url;
    }

    @Override // com.vkontakte.android.utils.JSONSerializable
    public int getJSONSerializableVersion() {
        return 0;
    }

    @Override // com.vkontakte.android.utils.JSONSerializable
    public int getJSONSerializableClassType() {
        return 1;
    }

    @Override // com.vkontakte.android.utils.JSONSerializable
    public void serializableToJson(@NonNull JSONObject jsonObject) throws JSONException {
        jsonObject.put("id", this.id);
        jsonObject.put("isHided", this.isHided);
        jsonObject.put("title", this.title);
        jsonObject.put("message", this.message);
        jsonObject.put(ServerKeys.TYPE, this.type);
        jsonObject.put(TtmlNode.TAG_LAYOUT, this.layout);
        jsonObject.put("buttonText", this.buttonText);
        jsonObject.put("buttonAction", this.buttonAction);
        jsonObject.put("buttonStyle", this.buttonStyle);
        jsonObject.put("buttonUrl", this.buttonUrl);
        jsonObject.put("buttonUrlTarget", this.buttonUrlTarget);
        if (this.images != null) {
            JSONArray jsonArray = new JSONArray();
            for (int i = 0; i < this.images.length; i++) {
                jsonArray.put(i, this.images[i].toJSONObject(null));
            }
            jsonObject.put("images", jsonArray);
        }
        jsonObject.put("profileDescription", this.profileDescription);
        JSONArray jsonArray2 = new JSONArray();
        if (this.profiles != null) {
            Iterator<UserProfile> it = this.profiles.iterator();
            while (it.hasNext()) {
                UserProfile userProfile = it.next();
                JSONObject o = new JSONObject();
                o.put("id", userProfile.uid);
                o.put("photo", userProfile.photo);
                jsonArray2.put(o);
            }
            jsonObject.put("profiles", jsonArray2);
        }
    }

    @Nullable
    public static List<UserNotification> parse(@Nullable JSONObject jo) throws JSONException {
        ArrayList<UserNotification> notifications = null;
        SparseArray<UserProfile> profiles = new SparseArray<>();
        if (jo != null && jo.has("profiles") && !jo.isNull("profiles")) {
            JSONArray jProfiles = jo.getJSONArray("profiles");
            for (int i = 0; i < jProfiles.length(); i++) {
                UserProfile p = new UserProfile(jProfiles.getJSONObject(i));
                profiles.put(p.uid, p);
            }
        }
        if (jo != null && jo.has("groups") && !jo.isNull("groups")) {
            JSONArray jProfiles2 = jo.getJSONArray("groups");
            for (int i2 = 0; i2 < jProfiles2.length(); i2++) {
                UserProfile p2 = new UserProfile(jProfiles2.getJSONObject(i2));
                p2.uid = -p2.uid;
                profiles.put(p2.uid, p2);
            }
        }
        JSONArray jsonArray = jo == null ? null : jo.optJSONArray(ServerKeys.ITEMS);
        if (jsonArray != null && jsonArray.length() > 0) {
            notifications = new ArrayList<>();
            for (int i3 = 0; i3 < jsonArray.length(); i3++) {
                JSONObject object = jsonArray.optJSONObject(i3);
                if (object != null) {
                    String type = String.valueOf(object.optString(ServerKeys.TYPE));
                    int id = object.optInt("id");
                    char c = 65535;
                    switch (type.hashCode()) {
                        case -1378241396:
                            if (type.equals(TYPE_BUBBLE)) {
                                c = 1;
                                break;
                            }
                            break;
                        case 92899676:
                            if (type.equals(TYPE_ALERT)) {
                                c = 0;
                                break;
                            }
                            break;
                        case 1395379953:
                            if (type.equals(TYPE_NEWSFEED)) {
                                c = 2;
                                break;
                            }
                            break;
                    }
                    switch (c) {
                        case 0:
                        case 1:
                        case 2:
                            UserNotification notification = new UserNotification(object.getJSONObject(type), type, id, profiles);
                            if (isValidNewsfeedLayout(notification)) {
                                notifications.add(notification);
                                break;
                            } else {
                                continue;
                            }
                    }
                }
            }
        }
        return notifications;
    }

    private static boolean isValidNewsfeedLayout(UserNotification notification) {
        String valueOf = String.valueOf(notification.layout);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1396342996:
                if (valueOf.equals(LAYOUT_NEWSFEED_BANNER)) {
                    c = 1;
                    break;
                }
                break;
            case 96801:
                if (valueOf.equals("app")) {
                    c = 0;
                    break;
                }
                break;
            case 3237038:
                if (valueOf.equals(LAYOUT_NEWSFEED_INFO)) {
                    c = 2;
                    break;
                }
                break;
            case 1377217503:
                if (valueOf.equals(LAYOUT_NEWSFEED_NEW_POST)) {
                    c = 3;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
            case 2:
            case 3:
                return true;
            default:
                return false;
        }
    }

    public UserNotification(Parcel parcel) {
        boolean z = false;
        this.isHided = false;
        this.id = parcel.readInt();
        this.isHided = parcel.readByte() != 0 ? true : z;
        this.title = parcel.readString();
        this.message = parcel.readString();
        this.type = parcel.readString();
        this.layout = parcel.readString();
        this.buttonText = parcel.readString();
        this.buttonAction = parcel.readString();
        this.buttonStyle = parcel.readString();
        this.buttonUrl = parcel.readString();
        this.buttonUrlTarget = parcel.readString();
        int imageSize = parcel.readInt();
        if (imageSize >= 0) {
            this.images = new Image[imageSize];
            parcel.readTypedArray(this.images, Image.CREATOR);
        } else {
            this.images = null;
        }
        this.profileDescription = parcel.readString();
        this.profiles = parcel.createTypedArrayList(UserProfile.CREATOR);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeInt(this.id);
        parcel.writeByte(this.isHided ? (byte) 1 : (byte) 0);
        parcel.writeString(this.title);
        parcel.writeString(this.message);
        parcel.writeString(this.type);
        parcel.writeString(this.layout);
        parcel.writeString(this.buttonText);
        parcel.writeString(this.buttonAction);
        parcel.writeString(this.buttonStyle);
        parcel.writeString(this.buttonUrl);
        parcel.writeString(this.buttonUrlTarget);
        parcel.writeInt(this.images == null ? -1 : this.images.length);
        if (this.images != null) {
            parcel.writeTypedArray(this.images, flags);
        }
        parcel.writeString(this.profileDescription);
        parcel.writeTypedList(this.profiles);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public void forceAction(@NonNull Context ctx) {
        String valueOf = String.valueOf(this.buttonAction);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -504306182:
                if (valueOf.equals(BUTTON_ACTION_OPEN_URL)) {
                    c = 0;
                    break;
                }
                break;
            case 1361543127:
                if (valueOf.equals(BUTTON_ENABLE_TOP_NEWSFEED)) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                hideNotification(ctx, true);
                try {
                    if (TextUtils.isEmpty(this.buttonUrlTarget)) {
                        ctx.startActivity(new Intent(ctx, LinkRedirActivity.class).setData(Uri.parse(this.buttonUrl)));
                    } else {
                        LinkUtils.processLink(ctx, this.buttonUrl, this.buttonUrlTarget);
                    }
                    return;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    return;
                }
            case 1:
                hideNotification(ctx, true);
                ctx.sendBroadcast(new Intent(ACTION_ENABLE_TOP_NEWSFEED), "com.vkontakte.android.permission.ACCESS_DATA");
                return;
            default:
                hideNotification(ctx, true);
                return;
        }
    }

    public void forceClose(@NonNull Context ctx) {
        hideNotification(ctx, false);
    }

    public void hideNotification(@NonNull Context ctx, boolean isAccept) {
        NewsfeedCache.remove(NewsEntry.OWNER_ID_NOTIFICATION, this.id);
        Posts.deleteFromStaticCache(NewsEntry.OWNER_ID_NOTIFICATION, this.id);
        ctx.sendBroadcast(new Intent(ACTION_HIDE_USER_NOTIFICATION).putExtra("id", this.id).putExtra("isAccepted", isAccept), "com.vkontakte.android.permission.ACCESS_DATA");
        if (!this.isHided) {
            new HideNotificationRequest(isAccept, this.id).setCallback(new Callback<Boolean>() { // from class: com.vkontakte.android.data.UserNotification.2
                @Override // com.vkontakte.android.api.Callback
                public void success(Boolean result) {
                    UserNotification.this.isHided = true;
                    L.e("ok", result);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    UserNotification.this.isHided = false;
                    L.e("error", error);
                }
            }).exec();
        }
    }
}
