package com.vkontakte.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.Html;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.URLSpan;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import android.view.WindowManager;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.util.Screen;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.JSONArrayWithCount;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.FriendsRecommAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.LinkAttachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.RepostAttachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.attachments.SignatureLinkAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.attachments.WidgetAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.utils.JSONSerializable;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.sentry.marshaller.json.JsonMarshaller;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import java.util.Vector;
import me.grishka.appkit.utils.V;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class NewsEntry extends Serializer.SerializableAdapter {
    private static final String CAPTION_ACTION_TEXT = "captionActionText";
    private static final String CAPTION_ACTION_URL = "captionActionUrl";
    private static final String CAPTION_TEXT = "captionText";
    private static final String CAPTION_TYPE = "captionType";
    public static final Serializer.Creator<NewsEntry> CREATOR = new Serializer.CreatorAdapter<NewsEntry>() { // from class: com.vkontakte.android.NewsEntry.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public NewsEntry mo1087createFromSerializer(Serializer in) {
            return new NewsEntry(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public NewsEntry[] mo1088newArray(int size) {
            return new NewsEntry[size];
        }
    };
    public static final String EXTRAS_KEY_ADS_ID_1 = "extras_key_ads_1";
    public static final String EXTRAS_KEY_ADS_ID_2 = "extras_key_ads_2";
    public static final String EXTRAS_KEY_LIST_REFER = "extras_key_list_refer";
    public static final String EXTRAS_KEY_MARKED_AS_ADS = "extras_key_marked_as_ads";
    public static final String EXTRAS_KEY_TRACK_CODE = "extras_key_track_code";
    public static final String EXTRAS_KEY_USER_NOTIFICATION = "extras_key_user_notification";
    public static final int FLAG_CAN_COMMENT = 2;
    public static final int FLAG_CAN_DELETE = 64;
    public static final int FLAG_CAN_EDIT = 128;
    public static final int FLAG_CAN_FIX = 65536;
    public static final int FLAG_CAN_GROUP_COMMENT = 131072;
    public static final int FLAG_CAN_RETWEET = 1;
    public static final int FLAG_DELETED_PROFILE = 32768;
    public static final int FLAG_EXPORT_FACEBOOK = 16384;
    public static final int FLAG_EXPORT_TWITTER = 8192;
    public static final int FLAG_FIXED = 1024;
    public static final int FLAG_FRIENDS_ONLY = 512;
    public static final int FLAG_GRAY_TEXT = 16;
    public static final int FLAG_IS_PROFILE_UPDATE = 256;
    public static final int FLAG_IS_RETWEET = 32;
    public static final int FLAG_LIKED = 8;
    public static final int FLAG_POSTPONED = 2048;
    public static final int FLAG_RETWEETED = 4;
    public static final int FLAG_SUGGESTED = 4096;
    public static final int OWNER_ID_FRIENDS_RECOMMENDATION = 2000000000;
    public static final int OWNER_ID_NOTIFICATION = 2000000001;
    public static final int OWNER_ID_WIDGET = 2000000002;
    public static final int PLATFORM_ANDROID = 2;
    public static final int PLATFORM_INSTAGRAM = 8;
    public static final int PLATFORM_IPAD = 4;
    public static final int PLATFORM_IPHONE = 3;
    public static final int PLATFORM_MOBILE_SITE = 1;
    public static final int PLATFORM_OTHER_APP = 7;
    public static final int PLATFORM_PRISMA = 10;
    public static final int PLATFORM_SITE = 0;
    public static final int PLATFORM_SNAPSTER = 9;
    public static final int PLATFORM_WINDOWS = 6;
    public static final int PLATFORM_WINPHONE = 5;
    private static final String SUGGEST_SUBSCRIBE = "suggest_subscribe";
    public static final int TYPE_ADDED_PHOTO = 6;
    public static final int TYPE_AD_PROMO_POST = 12;
    public static final int TYPE_AUDIO = 10;
    public static final int TYPE_BIRTHDAY = 8;
    public static final int TYPE_BOARD_COMMENT = 14;
    public static final int TYPE_COMMENT = 5;
    public static final int TYPE_DOCUMENT = 16;
    public static final int TYPE_FRIENDS_RECOMM = 13;
    public static final int TYPE_GOOD = 18;
    public static final int TYPE_MARKET_COMMENT = 17;
    public static final int TYPE_NOTE = 3;
    public static final int TYPE_PHOTO = 1;
    public static final int TYPE_POST = 0;
    public static final int TYPE_SHIT = 11;
    public static final int TYPE_TAGGED_PHOTO = 7;
    public static final int TYPE_TOPIC = 4;
    public static final int TYPE_USER_NOTIFICATION = 15;
    public static final int TYPE_VIDEO = 2;
    public static final int TYPE_WALL_PHOTO = 9;
    public static final int TYPE_WIDGET = 19;
    public Activity activity;
    public String attachTitle;
    public int attachType;
    public ArrayList<Attachment> attachments;
    public CharSequence captionActionText;
    public CharSequence captionActionUrl;
    public CharSequence captionText;
    public String captionType;
    public int createdBy;
    public CharSequence displayablePreviewText;
    public CharSequence displayableRetweetText;
    public Bundle extra;
    public boolean f;
    public int flags;
    public String lastComment;
    public int lastCommentTime;
    public int lastCommentUserID;
    public String lastCommentUserName;
    public String lastCommentUserPhoto;
    public int numComments;
    public int numLikes;
    public int numRetweets;
    public int numViews;
    public int order_position;
    public int ownerID;
    public int platform;
    public int postID;
    public PostInteract postInteract;
    public ArrayList<Attachment> repostAttachments;
    public int retweetOrigId;
    public int retweetOrigTime;
    public String retweetText;
    public int retweetType;
    public int retweetUID;
    public String retweetUserName;
    public String retweetUserPhoto;
    public Boolean suggestSubscribe;
    public String text;
    public int time;
    public int type;
    public int userID;
    public String userName;
    public String userPhotoURL;

    public static boolean isTypeAd(int type) {
        return type == 11 || type == 12;
    }

    public NewsEntry() {
        this.userName = "UNKNOWN";
        this.type = 0;
        this.text = "";
        this.retweetText = "";
        this.attachType = 0;
        this.attachments = new ArrayList<>();
        this.repostAttachments = new ArrayList<>();
        this.flags = 0;
        this.numRetweets = 0;
        this.numViews = 0;
        this.extra = new Bundle();
        this.lastComment = null;
        this.order_position = 0;
    }

    public NewsEntry(Photo curPhoto) {
        this.userName = "UNKNOWN";
        this.type = 0;
        this.text = "";
        this.retweetText = "";
        this.attachType = 0;
        this.attachments = new ArrayList<>();
        this.repostAttachments = new ArrayList<>();
        this.flags = 0;
        this.numRetweets = 0;
        this.numViews = 0;
        this.extra = new Bundle();
        this.lastComment = null;
        this.order_position = 0;
        this.type = 1;
        this.postID = curPhoto.id;
        this.ownerID = curPhoto.ownerID;
        this.userID = curPhoto.userID;
        this.attachments.add(new PhotoAttachment(curPhoto));
        this.time = curPhoto.date;
        this.numLikes = curPhoto.nLikes;
        this.numRetweets = curPhoto.nReposts;
        this.numComments = curPhoto.nComments;
        if (curPhoto.user != null) {
            this.userName = curPhoto.user.fullName;
            this.userPhotoURL = curPhoto.user.photo;
        }
        if (curPhoto.lat != -9000.0d && curPhoto.lon != -9000.0d) {
            GeoAttachment geo = new GeoAttachment(curPhoto.lat, curPhoto.lon, "", curPhoto.geoAddress, -9000, null, 0);
            this.attachments.add(geo);
        }
        flag(8, curPhoto.isLiked);
        flag(2, curPhoto.canComment);
    }

    private void setSuggestSubscribe(boolean suggestSubscribe) {
        this.extra.putBoolean(SUGGEST_SUBSCRIBE, suggestSubscribe);
        this.suggestSubscribe = Boolean.valueOf(suggestSubscribe);
    }

    private void setCaption(String captionType, String captionText, String actionText, String actionUrl) {
        LinkSpan[] linkSpans;
        Bundle bundle = this.extra;
        this.captionType = captionType;
        bundle.putString(CAPTION_TYPE, captionType);
        this.extra.putString(CAPTION_TEXT, captionText);
        this.extra.putString(CAPTION_ACTION_TEXT, actionText);
        this.extra.putString(CAPTION_ACTION_URL, actionUrl);
        this.captionActionText = actionText;
        this.captionActionUrl = actionUrl;
        this.captionText = LinkParser.parseLinks(TextStyleParser.parse(captionText));
        if ((this.captionText instanceof Spannable) && (linkSpans = (LinkSpan[]) ((Spannable) this.captionText).getSpans(0, this.captionText.length(), LinkSpan.class)) != null) {
            for (LinkSpan linkSpan : linkSpans) {
                linkSpan.setColor(Color.parseColor("#7C828A"));
            }
        }
    }

    private void loadExtras() {
        if (this.extra != null) {
            setCaption(this.extra.getString(CAPTION_TYPE), this.extra.getString(CAPTION_TEXT), this.extra.getString(CAPTION_ACTION_TEXT), this.extra.getString(CAPTION_ACTION_URL));
            if (this.extra.containsKey(SUGGEST_SUBSCRIBE)) {
                setSuggestSubscribe(this.extra.getBoolean(SUGGEST_SUBSCRIBE));
            }
        }
    }

    public NewsEntry(UserNotification userNotification) {
        this.userName = "UNKNOWN";
        this.type = 0;
        this.text = "";
        this.retweetText = "";
        this.attachType = 0;
        this.attachments = new ArrayList<>();
        this.repostAttachments = new ArrayList<>();
        this.flags = 0;
        this.numRetweets = 0;
        this.numViews = 0;
        this.extra = new Bundle();
        this.lastComment = null;
        this.order_position = 0;
        this.type = 15;
        this.extra.putParcelable(EXTRAS_KEY_USER_NOTIFICATION, userNotification);
        this.userID = OWNER_ID_NOTIFICATION;
        this.ownerID = OWNER_ID_NOTIFICATION;
        this.postID = userNotification.id;
    }

    public NewsEntry(NewsEntry e) {
        this.userName = "UNKNOWN";
        this.type = 0;
        this.text = "";
        this.retweetText = "";
        this.attachType = 0;
        this.attachments = new ArrayList<>();
        this.repostAttachments = new ArrayList<>();
        this.flags = 0;
        this.numRetweets = 0;
        this.numViews = 0;
        this.extra = new Bundle();
        this.lastComment = null;
        this.order_position = 0;
        this.userName = e.userName;
        this.userID = e.userID;
        this.ownerID = e.ownerID;
        this.postID = e.postID;
        this.type = e.type;
        this.text = e.text;
        this.displayablePreviewText = e.displayablePreviewText;
        this.time = e.time;
        this.numComments = e.numComments;
        this.retweetUID = e.retweetUID;
        this.retweetUserName = e.retweetUserName;
        this.retweetUserPhoto = e.retweetUserPhoto;
        this.retweetOrigTime = e.retweetOrigTime;
        this.retweetOrigId = e.retweetOrigId;
        this.retweetType = e.retweetType;
        this.numLikes = e.numLikes;
        this.numViews = e.numViews;
        this.userPhotoURL = e.userPhotoURL;
        this.attachments.addAll(e.attachments);
        this.flags = e.flags;
        this.type = e.type;
        this.retweetText = e.retweetText;
        this.displayableRetweetText = e.displayableRetweetText;
        this.platform = e.platform;
        this.order_position = e.order_position;
        this.activity = e.activity;
        setCaption(e.captionType, e.extra.getString(CAPTION_TEXT), e.extra.getString(CAPTION_ACTION_TEXT), e.extra.getString(CAPTION_ACTION_URL));
        if (e.extra.containsKey(SUGGEST_SUBSCRIBE)) {
            setSuggestSubscribe(e.extra.getBoolean(SUGGEST_SUBSCRIBE));
        }
    }

    public NewsEntry(JSONObject item, String listRefer, SparseArray<String> names, SparseArray<String> photos) throws JSONException {
        this(item, listRefer, names, photos, null);
    }

    public NewsEntry(JSONObject item, String listRefer, SparseArray<String> names, SparseArray<String> photos, SparseBooleanArray sex) throws JSONException {
        this(item, listRefer, names, photos, sex, null);
    }

    public NewsEntry(JSONObject item, String listRefer, SparseArray<String> names, SparseArray<String> photos, SparseBooleanArray sex, ShitAttachment shitAttachment) throws JSONException {
        JSONArray atts;
        this.userName = "UNKNOWN";
        this.type = 0;
        this.text = "";
        this.retweetText = "";
        this.attachType = 0;
        this.attachments = new ArrayList<>();
        this.repostAttachments = new ArrayList<>();
        this.flags = 0;
        this.numRetweets = 0;
        this.numViews = 0;
        this.extra = new Bundle();
        this.lastComment = null;
        this.order_position = 0;
        this.extra.putString(EXTRAS_KEY_LIST_REFER, listRefer);
        this.extra.putBoolean(EXTRAS_KEY_MARKED_AS_ADS, item.optInt("marked_as_ads", 0) != 0);
        if (item.has("track_code")) {
            this.extra.putString(EXTRAS_KEY_TRACK_CODE, item.optString("track_code", ""));
        }
        JSONObject caption = item.optJSONObject(ShareConstants.FEED_CAPTION_PARAM);
        if (caption != null) {
            setCaption(caption.optString(ServerKeys.TYPE), caption.optString("text"), caption.optString("action_title"), caption.optString("action_url"));
        }
        if (item.has(SUGGEST_SUBSCRIBE)) {
            setSuggestSubscribe(item.getBoolean(SUGGEST_SUBSCRIBE));
        }
        try {
            if (item.has(ServerKeys.TYPE)) {
                String string = item.getString(ServerKeys.TYPE);
                char c = 65535;
                switch (string.hashCode()) {
                    case -2002177155:
                        if (string.equals("wall_photo")) {
                            c = 4;
                            break;
                        }
                        break;
                    case -1081306052:
                        if (string.equals(ReportAppInputData.REPORT_TYPE_MARKET)) {
                            c = 6;
                            break;
                        }
                        break;
                    case -847657971:
                        if (string.equals("photo_tag")) {
                            c = 5;
                            break;
                        }
                        break;
                    case 3387378:
                        if (string.equals("note")) {
                            c = 2;
                            break;
                        }
                        break;
                    case 106642994:
                        if (string.equals("photo")) {
                            c = 3;
                            break;
                        }
                        break;
                    case 110546223:
                        if (string.equals("topic")) {
                            c = 0;
                            break;
                        }
                        break;
                    case 112202875:
                        if (string.equals("video")) {
                            c = 1;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        this.type = 4;
                        break;
                    case 1:
                        this.type = 2;
                        break;
                    case 2:
                        this.type = 3;
                        break;
                    case 3:
                        this.type = item.has("photos") ? 6 : 1;
                        break;
                    case 4:
                        if (item.has("photos")) {
                            this.type = 9;
                            break;
                        }
                        break;
                    case 5:
                        this.type = 7;
                        break;
                    case 6:
                        this.type = 18;
                        break;
                }
            }
            this.flags |= this.type << 24;
            int posterID = item.optInt(item.has(ServerKeys.FROM_ID) ? ServerKeys.FROM_ID : "owner_id", item.optInt("source_id"));
            this.userName = names.get(posterID);
            this.userPhotoURL = photos.get(posterID);
            this.userID = posterID;
            this.ownerID = item.optInt("owner_id", item.optInt("to_id", item.optInt("source_id", this.userID)));
            if (item.has("text")) {
                if (this.type != 4) {
                    this.text = item.getString("text");
                } else {
                    this.text = item.getString("text");
                }
                if (item.has("copy_comment_id")) {
                    this.text = VKApplication.context.getResources().getString(R.string.wall_comment_repost, Integer.valueOf(item.getInt("copy_owner_id")), Integer.valueOf(item.getInt("copy_post_id"))) + "\n\n" + this.text;
                }
            }
            if (this.type == 18) {
                parseMarket(item, this);
            }
            this.postID = item.optInt("id", item.optInt(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, -1));
            if (shitAttachment != null) {
                this.postInteract = new PostInteract(listRefer, this, shitAttachment);
            } else {
                this.postInteract = new PostInteract(listRefer, this);
            }
            if (item.has("attachments") && (atts = item.optJSONArray("attachments")) != null && atts.length() > 0) {
                boolean hasSnippet = false;
                for (int i = 0; i < Math.min(atts.length(), 10); i++) {
                    Attachment att = Attachment.parse(atts.getJSONObject(i), listRefer, names, photos);
                    if (att != null) {
                        this.attachments.add(att);
                    }
                    if (att instanceof SnippetAttachment) {
                        hasSnippet = true;
                    }
                }
                if (hasSnippet) {
                    Iterator<Attachment> it = this.attachments.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (it.next() instanceof ThumbAttachment) {
                                Iterator<Attachment> it2 = this.attachments.iterator();
                                while (true) {
                                    if (it2.hasNext()) {
                                        Attachment att1 = it2.next();
                                        if (att1 instanceof SnippetAttachment) {
                                            SnippetAttachment sa = (SnippetAttachment) att1;
                                            this.attachments.set(this.attachments.indexOf(att1), new LinkAttachment(sa.link, sa.title, sa.previewPage));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Attachment.sort(this.attachments);
            }
            if (item.has("comments") && !item.getJSONObject("comments").isNull(ServerKeys.COUNT)) {
                this.numComments = item.getJSONObject("comments").getInt(ServerKeys.COUNT);
            }
            if (item.has("comments") && item.getJSONObject("comments").optInt("can_post", 1) == 1) {
                this.flags |= 2;
            }
            if (item.has("comments") && item.getJSONObject("comments").optBoolean("groups_can_post", false)) {
                this.flags |= 131072;
            }
            if (item.has("reposts") && item.getJSONObject("reposts").optInt("user_reposted") == 1 && this.ownerID != VKAccountManager.getCurrent().getUid() && this.ownerID == this.userID) {
                this.flags |= 4;
            }
            if (item.has("reposts")) {
                this.numRetweets = item.getJSONObject("reposts").optInt(ServerKeys.COUNT);
            }
            JSONObject views = item.optJSONObject(ServerKeys.VIEWS);
            if (views != null) {
                this.numViews = views.optInt(ServerKeys.COUNT);
            } else if (item.has(ServerKeys.VIEWS)) {
                this.numViews = item.getInt(ServerKeys.VIEWS);
            }
            if ((item.has(ServerKeys.LIKES) && item.getJSONObject(ServerKeys.LIKES).optInt("can_publish") == 1) || (item.has("reposts") && item.getJSONObject("reposts").optInt("user_reposted") == 1)) {
                this.flags |= 1;
            }
            if (item.has(ServerKeys.LIKES) && !item.getJSONObject(ServerKeys.LIKES).isNull(ServerKeys.COUNT)) {
                this.numLikes = item.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.COUNT);
            }
            if (item.has(ServerKeys.LIKES) && item.getJSONObject(ServerKeys.LIKES).optInt(ServerKeys.USER_LIKES) == 1) {
                this.flags |= 8;
            }
            if (item.optInt("can_edit", 0) == 1) {
                this.flags |= 128;
            }
            if (item.optInt("can_delete", 0) == 1) {
                this.flags |= 64;
            }
            if (item.optInt("friends_only") == 1) {
                this.flags |= 512;
            }
            if (item.optInt("can_pin") == 1) {
                this.flags |= 65536;
            }
            if (item.optInt("is_pinned") == 1 || item.optInt("fixed") == 1) {
                this.flags |= 1024;
            }
            if (item.has("post_type")) {
                String ptype = item.getString("post_type");
                if ("reply".equals(ptype)) {
                    this.type = 5;
                    if (item.has(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID)) {
                        this.extra.putInt("parent_post", item.getInt(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID));
                    }
                }
            }
            if (this.type == 1) {
                this.attachments.add(new PhotoAttachment(new Photo(item)));
            }
            if (this.type == 2) {
                JSONObject jsonVideo = item.optJSONObject("video");
                JSONArray jsonArrayItems = jsonVideo == null ? null : jsonVideo.optJSONArray(ServerKeys.ITEMS);
                if (jsonArrayItems != null && jsonArrayItems.length() > 0) {
                    int len = Math.min(10, jsonArrayItems.length());
                    for (int i2 = 0; i2 < len; i2++) {
                        JSONObject video = jsonArrayItems.getJSONObject(i2);
                        if (video != null) {
                            VideoFile vf = new VideoFile(video);
                            this.attachments.add(new VideoAttachment(vf));
                            this.numComments = vf.comments;
                            this.numLikes = vf.likes;
                            this.numRetweets = vf.reposts;
                            this.ownerID = vf.oid;
                            this.postID = vf.vid;
                            if (vf.canRepost) {
                                this.flags |= 1;
                            }
                            vf.ownerName = names.get(vf.oid);
                            vf.ownerPhoto = photos.get(vf.oid);
                        }
                    }
                } else {
                    VideoFile vf2 = new VideoFile(item);
                    this.attachments.add(new VideoAttachment(vf2));
                    this.numComments = vf2.comments;
                    this.numLikes = vf2.likes;
                    this.ownerID = vf2.oid;
                    this.postID = vf2.vid;
                    vf2.ownerName = names.get(vf2.oid);
                    vf2.ownerPhoto = photos.get(vf2.oid);
                }
            }
            if (item.has("geo")) {
                JSONObject geo = item.getJSONObject("geo");
                this.attachments.add(Attachment.parseGeo(geo));
            }
            boolean ff = sex != null && sex.get(this.ownerID, false);
            if (item.has("post_source")) {
                JSONObject source = item.getJSONObject("post_source");
                setInfoFromPostSource(source, ff);
            }
            if (item.has("photos") || item.has("photo_tags")) {
                this.f = ff;
                JSONArrayWithCount jc = APIUtils.unwrapArray(item, (this.type == 6 || this.type == 9) ? "photos" : "photo_tags");
                JSONArray ph = jc.array;
                this.postID = jc.count;
                for (int i3 = 0; i3 < ph.length(); i3++) {
                    this.attachments.add(new PhotoAttachment(new Photo(ph.getJSONObject(i3))));
                }
                this.flags |= 16;
            }
            if (item.has("copy_history") && item.optJSONArray("copy_history") != null && item.getJSONArray("copy_history").length() > 0) {
                JSONObject origPost = item.getJSONArray("copy_history").getJSONObject(0);
                this.retweetText = item.getString("text");
                this.displayableRetweetText = LinkParser.truncatePost(LinkParser.parseLinks(this.retweetText, 7, this.postInteract));
                if (this.displayableRetweetText != null && this.displayableRetweetText.length() > 0) {
                    this.displayableRetweetText = Global.replaceEmoji(this.displayableRetweetText);
                }
                this.text = origPost.getString("text");
                this.repostAttachments = this.attachments;
                this.attachments = new ArrayList<>();
                JSONArray jatts = origPost.optJSONArray("attachments");
                if (jatts != null) {
                    boolean hasSnippet2 = false;
                    for (int i4 = 0; i4 < Math.min(jatts.length(), 10); i4++) {
                        Attachment att2 = Attachment.parse(jatts.getJSONObject(i4), listRefer, names, photos);
                        if (att2 != null) {
                            this.attachments.add(att2);
                        }
                        if (att2 instanceof SnippetAttachment) {
                            hasSnippet2 = true;
                        }
                    }
                    if (hasSnippet2) {
                        Iterator<Attachment> it3 = this.attachments.iterator();
                        while (true) {
                            if (it3.hasNext()) {
                                if (it3.next() instanceof ThumbAttachment) {
                                    Iterator<Attachment> it4 = this.attachments.iterator();
                                    while (true) {
                                        if (it4.hasNext()) {
                                            Attachment att12 = it4.next();
                                            if (att12 instanceof SnippetAttachment) {
                                                SnippetAttachment sa2 = (SnippetAttachment) att12;
                                                this.attachments.set(this.attachments.indexOf(att12), new LinkAttachment(sa2.link, sa2.title, null));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Attachment.sort(this.attachments);
                if (origPost.has("geo")) {
                    JSONObject geo2 = origPost.getJSONObject("geo");
                    this.attachments.add(Attachment.parseGeo(geo2));
                }
                Attachment.sort(this.attachments);
                this.retweetUID = origPost.optInt("owner_id");
                this.flags |= 32;
                this.retweetUserName = names.get(this.retweetUID, "DELETED");
                this.retweetUserPhoto = photos.get(this.retweetUID);
                this.retweetOrigId = origPost.optInt("id");
                this.retweetOrigTime = origPost.optInt(ServerKeys.DATE, 0);
                if ("reply".equals(origPost.optString("post_type"))) {
                    this.retweetType = 5;
                    this.retweetOrigId = origPost.getInt("reply_post_id");
                    int commentUid = origPost.getInt(ServerKeys.FROM_ID);
                    this.retweetUserName = names.get(commentUid);
                    this.retweetUserPhoto = photos.get(commentUid);
                }
                if ("photo".equals(origPost.optString("post_type"))) {
                    this.retweetType = 1;
                }
                if ("video".equals(origPost.optString("post_type"))) {
                    this.retweetType = 2;
                }
                if (item.getJSONArray("copy_history").length() > 1) {
                    JSONObject repost = item.getJSONArray("copy_history").getJSONObject(1);
                    int oid = repost.getInt("owner_id");
                    if ("reply".equals(repost.optString("post_type"))) {
                        int oid2 = repost.getInt(ServerKeys.FROM_ID);
                        this.attachments.add(new RepostAttachment(repost.getInt("owner_id"), repost.getInt("reply_post_id"), repost.getInt(ServerKeys.DATE), names.get(oid2, "DELETED"), photos.get(oid2, "http://vk.com/images/question_a.gif"), 5));
                    } else {
                        this.attachments.add(new RepostAttachment(oid, repost.getInt("id"), repost.getInt(ServerKeys.DATE), names.get(oid, "DELETED"), photos.get(oid, "http://vk.com/images/question_a.gif"), 0));
                    }
                }
                if (origPost.has("post_source")) {
                    JSONObject source2 = origPost.getJSONObject("post_source");
                    setInfoFromPostSource(source2, sex != null && sex.get(this.retweetUID, false));
                }
            }
            this.time = item.optInt(ServerKeys.DATE);
            if (item.has("comments") && item.getJSONObject("comments").has(ArgKeys.LIST)) {
                JSONArray lca = item.getJSONObject("comments").getJSONArray(ArgKeys.LIST);
                JSONObject lc = lca.getJSONObject(lca.length() - 1);
                this.lastComment = lc.getString("text");
                boolean isMention = LinkParser.isMention(this.lastComment);
                if (this.type == 4) {
                    this.lastComment = this.lastComment.replaceAll("\\[(id|club)(\\d+):bp-(\\d+)_(\\d+)\\|([^\\]]+)\\]", "$5");
                } else {
                    this.lastComment = this.lastComment.replaceAll("\\[(id|club)(\\d+)\\|([^\\]]+)\\]", "$3");
                }
                this.lastCommentUserName = names.get(lc.getInt(ServerKeys.FROM_ID));
                this.lastCommentUserPhoto = photos.get(lc.getInt(ServerKeys.FROM_ID));
                this.lastCommentUserID = lc.getInt(ServerKeys.FROM_ID);
                this.lastCommentTime = lc.getInt(ServerKeys.DATE);
                if ((this.lastComment.length() == 0 || isMention) && lc.has("attachments")) {
                    JSONArray aa = lc.getJSONArray("attachments");
                    if (aa.length() > 0) {
                        ArrayList<Attachment> atts2 = new ArrayList<>();
                        for (int i5 = 0; i5 < aa.length(); i5++) {
                            atts2.add(Attachment.parse(aa.getJSONObject(i5), listRefer, names, photos));
                        }
                        if (isMention) {
                            this.lastComment += "\n" + Attachment.getLocalizedDescription(atts2);
                        } else {
                            this.lastComment = Attachment.getLocalizedDescription(atts2);
                        }
                    }
                }
            }
            layoutThumbs();
            if (item.has("signer_id")) {
                SignatureLinkAttachment la = new SignatureLinkAttachment("https://vkontakte.ru/id" + item.getInt("signer_id"), names.get(item.getInt("signer_id")));
                this.attachments.add(la);
            }
            if (item.optInt("final_post") == 1) {
                this.flags |= 32768;
            }
            if (item.has("reply_owner_id")) {
                LinkAttachment la2 = new LinkAttachment("https://vkontakte.ru/wall" + item.getInt("reply_owner_id") + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + item.getInt("reply_post_id"), VKApplication.context.getResources().getString(R.string.wall_post_reply), "");
                this.attachments.add(la2);
            }
            if (this.ownerID < 0) {
                if ((Groups.getAdminLevel(-this.ownerID) >= 1 && this.userID > 0) || Groups.getAdminLevel(-this.ownerID) >= 2) {
                    this.flags |= 64;
                }
                this.createdBy = item.optInt("created_by");
            }
            if ("postpone".equals(item.optString("post_type"))) {
                this.flags |= 2048;
                if (item.optInt("twitter_export") == 1) {
                    this.flags |= 8192;
                }
                if (item.optInt("facebook_export") == 1) {
                    this.flags |= 16384;
                }
            }
            if ("suggest".equals(item.optString("post_type"))) {
                this.flags |= 4096;
            }
            if (this.type == 6 && this.attachments.size() == 1) {
                PhotoAttachment photo = (PhotoAttachment) this.attachments.get(0);
                this.postID = photo.pid;
                this.ownerID = photo.oid;
                flag(16, false);
                this.text = photo.descr;
                JSONObject jphoto = item.getJSONObject("photos").getJSONArray(ServerKeys.ITEMS).getJSONObject(0);
                this.numLikes = jphoto.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.COUNT);
                flag(8, jphoto.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.USER_LIKES) == 1);
                this.numComments = jphoto.getJSONObject("comments").getInt(ServerKeys.COUNT);
                flag(2, jphoto.getInt(ServerKeys.CAN_COMMENT) == 1);
                this.extra.putBoolean("converted_to_photo", true);
                this.extra.putInt("orig_type", this.type);
                this.type = 1;
            }
            if (this.text != null) {
                if (this.type == 4) {
                    this.displayablePreviewText = stripUnderlines((Spannable) Html.fromHtml(VKApplication.context.getResources().getString(R.string.feed_comments_topic) + " <a href='http://vk.com'>" + this.text + "</a>"));
                    this.flags |= 16;
                } else {
                    this.displayablePreviewText = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.text, 7, this.postInteract)));
                }
            }
            if (item.has("activity")) {
                this.activity = Activity.parse(item.getJSONObject("activity"), names, photos);
            }
        } catch (Exception x) {
            Log.w("vk", x);
            Log.i("vk", item.toString());
            if (this.text == null) {
                this.text = "";
            }
            this.text += VKApplication.context.getResources().getString(R.string.error) + "\n" + x.getClass().getSimpleName() + ": " + x.getMessage();
            this.displayablePreviewText = this.text;
        }
    }

    private void setInfoFromPostSource(JSONObject source, boolean ff) throws JSONException {
        if (source.has("data") && "profile_photo".equals(source.optString("data"))) {
            if (this.ownerID < 0) {
                this.text = VKApplication.context.getResources().getString(R.string.updated_profile_photo_g);
            } else {
                this.text = VKApplication.context.getResources().getString(ff ? R.string.updated_profile_photo_f : R.string.updated_profile_photo_m);
            }
            this.displayablePreviewText = this.text;
            this.flags |= 16;
            this.flags |= 256;
        }
        String ptype = source.optString(ServerKeys.TYPE);
        if ("api".equals(ptype)) {
            String jplatform = source.optString(JsonMarshaller.PLATFORM);
            if (AbstractSpiCall.ANDROID_CLIENT_TYPE.equals(jplatform)) {
                this.platform = 2;
            } else if ("iphone".equals(jplatform)) {
                this.platform = 3;
            } else if ("ipad".equals(jplatform)) {
                this.platform = 4;
            } else if ("wphone".equals(jplatform)) {
                this.platform = 5;
            } else if ("windows".equals(jplatform)) {
                this.platform = 6;
            } else if ("instagram".equals(jplatform)) {
                this.platform = 8;
                if (source.has("url")) {
                    this.extra.putString("post_source_url", source.getString("url"));
                }
                if (this.attachments.size() > 0 && (this.attachments.get(this.attachments.size() - 1) instanceof GeoAttachment)) {
                    ((GeoAttachment) this.attachments.get(this.attachments.size() - 1)).style = 1;
                }
            } else if ("chronicle".equals(jplatform)) {
                this.platform = 9;
            } else if ("prisma".equals(jplatform)) {
                this.platform = 10;
            } else {
                this.platform = 7;
            }
        }
    }

    public ShitAttachment getShitAttachment() {
        Iterator<Attachment> it = this.attachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof ShitAttachment) {
                return (ShitAttachment) att;
            }
        }
        return null;
    }

    public static NewsEntry parsePhoto(JSONObject photo) throws Exception {
        NewsEntry e = new NewsEntry();
        e.type = 1;
        e.postID = photo.getInt(photo.has("id") ? "id" : "pid");
        e.ownerID = photo.getInt("owner_id");
        e.text = photo.optString("text");
        e.time = photo.getInt(ServerKeys.DATE);
        if (photo.has(ServerKeys.LIKES)) {
            e.numLikes = photo.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.COUNT);
            if (photo.getJSONObject(ServerKeys.LIKES).getInt(ServerKeys.USER_LIKES) == 1) {
                e.flags |= 8;
            }
        }
        e.flags |= 2;
        e.attachments.add(new PhotoAttachment(new Photo(photo)));
        return e;
    }

    public static NewsEntry parseMarket(JSONObject market, NewsEntry e) throws Exception {
        if (e == null) {
            e = new NewsEntry();
        }
        e.type = 18;
        Good good = new Good(market);
        e.postID = good.id;
        int i = good.owner_id;
        e.userID = i;
        e.ownerID = i;
        e.time = good.date;
        e.attachments.add(new MarketAttachment(good));
        e.displayablePreviewText = good.title;
        return e;
    }

    public static NewsEntry parseVideo(JSONObject video) throws Exception {
        NewsEntry e = new NewsEntry();
        VideoFile vf = new VideoFile(video);
        e.type = 2;
        e.postID = vf.vid;
        int i = vf.oid;
        e.userID = i;
        e.ownerID = i;
        e.time = vf.date;
        e.attachments.add(new VideoAttachment(vf));
        return e;
    }

    public static NewsEntry parseTopic(JSONObject topic) throws Exception {
        NewsEntry e = new NewsEntry();
        e.type = 4;
        e.text = topic.getString("title");
        e.postID = topic.getInt("id");
        int i = topic.getInt("owner_id");
        e.userID = i;
        e.ownerID = i;
        return e;
    }

    public static NewsEntry parseFriendsRecomm(JSONObject obj) throws Exception {
        NewsEntry e = new NewsEntry();
        e.ownerID = 2000000000;
        e.postID = new Random().nextInt();
        e.type = 13;
        ArrayList<UserProfile> users = new ArrayList<>();
        JSONArray ja = obj.getJSONArray("profiles");
        for (int i = 0; i < ja.length(); i++) {
            users.add(new UserProfile(ja.getJSONObject(i)));
        }
        e.time = obj.getInt(ServerKeys.DATE);
        e.attachments.add(new FriendsRecommAttachment(users, obj.optString("next_from")));
        return e;
    }

    public static NewsEntry parseWidget(JSONObject obj) throws JSONException {
        Widget widget = Widget.create(obj.getJSONObject("app_widget"));
        if (widget == null) {
            return null;
        }
        NewsEntry entry = new NewsEntry();
        entry.ownerID = OWNER_ID_WIDGET;
        entry.postID = new Random().nextInt();
        entry.type = 19;
        entry.attachments.add(new WidgetAttachment(widget));
        return entry;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0041, code lost:
        if (r4.equals("site") != false) goto L9;
     */
    @android.support.annotation.Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.vkontakte.android.NewsEntry parseAd(org.json.JSONObject r8, android.util.SparseArray<java.lang.String> r9, android.util.SparseArray<java.lang.String> r10, android.util.SparseBooleanArray r11, java.util.Vector<java.lang.Integer> r12, java.lang.String r13) throws java.lang.Exception {
        /*
            r0 = 0
            r2 = 0
            java.lang.String r3 = "ads"
            org.json.JSONArray r3 = r8.getJSONArray(r3)
            org.json.JSONObject r1 = r3.getJSONObject(r2)
            java.lang.String r3 = "type"
            boolean r3 = r1.has(r3)
            if (r3 != 0) goto L21
            java.lang.String r2 = "vk"
            java.lang.String r3 = r1.toString()
            android.util.Log.e(r2, r3)
        L20:
            return r0
        L21:
            java.lang.String r3 = "type"
            java.lang.String r4 = r1.getString(r3)
            r3 = -1
            int r5 = r4.hashCode()
            switch(r5) {
                case 96801: goto L44;
                case 3446944: goto L65;
                case 3530567: goto L3a;
                case 1276675263: goto L5a;
                case 1844974813: goto L4f;
                default: goto L30;
            }
        L30:
            r2 = r3
        L31:
            switch(r2) {
                case 0: goto L35;
                case 1: goto L35;
                case 2: goto L35;
                case 3: goto L35;
                case 4: goto L70;
                default: goto L34;
            }
        L34:
            goto L20
        L35:
            com.vkontakte.android.NewsEntry r0 = parseAdApp(r8)
            goto L20
        L3a:
            java.lang.String r5 = "site"
            boolean r4 = r4.equals(r5)
            if (r4 == 0) goto L30
            goto L31
        L44:
            java.lang.String r2 = "app"
            boolean r2 = r4.equals(r2)
            if (r2 == 0) goto L30
            r2 = 1
            goto L31
        L4f:
            java.lang.String r2 = "app_video"
            boolean r2 = r4.equals(r2)
            if (r2 == 0) goto L30
            r2 = 2
            goto L31
        L5a:
            java.lang.String r2 = "app_slider"
            boolean r2 = r4.equals(r2)
            if (r2 == 0) goto L30
            r2 = 3
            goto L31
        L65:
            java.lang.String r2 = "post"
            boolean r2 = r4.equals(r2)
            if (r2 == 0) goto L30
            r2 = 4
            goto L31
        L70:
            java.lang.String r0 = "post"
            org.json.JSONObject r2 = r1.getJSONObject(r0)
            r0 = r8
            r3 = r9
            r4 = r10
            r5 = r11
            r6 = r12
            r7 = r13
            com.vkontakte.android.NewsEntry r0 = parseAdPost(r0, r1, r2, r3, r4, r5, r6, r7)
            goto L20
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.NewsEntry.parseAd(org.json.JSONObject, android.util.SparseArray, android.util.SparseArray, android.util.SparseBooleanArray, java.util.Vector, java.lang.String):com.vkontakte.android.NewsEntry");
    }

    private static NewsEntry parseAdPost(JSONObject obj, JSONObject oAd, JSONObject o, SparseArray<String> userNames, SparseArray<String> userPhotos, SparseBooleanArray userSex, Vector<Integer> adminGroups, String listRefer) throws JSONException {
        int adsId1 = obj.optInt("ads_id1");
        int adsId2 = obj.optInt("ads_id2");
        ShitAttachment ad = new ShitAttachment();
        ad.data = oAd.getString("ad_data");
        ad.dataImpression = new StatisticUrl(oAd.getString("ad_data_impression"), Statistic.TYPE_IMPRESSION, adsId1, adsId2, -1, ad);
        parseStatistics(obj, "ads_statistics", ad, adsId1, adsId2);
        parseStatistics(oAd, "statistics", ad, adsId1, adsId2);
        NewsEntry e = new NewsEntry(o, listRefer, userNames, userPhotos, userSex, ad);
        e.extra.putString(ServerKeys.ADS_TITLE, obj.optString(ServerKeys.ADS_TITLE));
        e.extra.putString("age_restriction", oAd.optString("age_restriction"));
        if (e.ownerID < 0 && adminGroups.contains(Integer.valueOf(-e.ownerID))) {
            e.flags |= 64;
        }
        e.type = 12;
        e.retweetOrigTime = o.optInt("time_to_live");
        if (e.retweetOrigTime != 0 && e.retweetOrigTime < 2592000) {
            e.retweetOrigTime += TimeUtils.getCurrentTime();
        }
        if (obj.has("ads_debug")) {
            e.extra.putString("ads_debug", obj.getString("ads_debug"));
        }
        e.attachments.add(ad);
        if (e.postInteract != null) {
            e.postInteract.setClickPostLinks(ad.getStatisticByType(Statistic.TYPE_POST_LINK));
        }
        e.extra.putInt(EXTRAS_KEY_ADS_ID_1, adsId1);
        e.extra.putInt(EXTRAS_KEY_ADS_ID_2, adsId2);
        return e;
    }

    private static NewsEntry parseAdApp(JSONObject obj) throws JSONException {
        int adsId1 = obj.getInt("ads_id1");
        int adsId2 = obj.getInt("ads_id2");
        NewsEntry e = new NewsEntry();
        e.type = 11;
        e.postID = adsId1;
        e.ownerID = adsId2;
        e.extra.putString(ServerKeys.ADS_TITLE, obj.optString(ServerKeys.ADS_TITLE));
        if (obj.has("ads_debug")) {
            e.extra.putString("ads_debug", obj.getString("ads_debug"));
        }
        JSONArray ads = obj.getJSONArray("ads");
        for (int j = 0; j < ads.length(); j++) {
            JSONObject o = ads.getJSONObject(j);
            ShitAttachment ad = new ShitAttachment();
            ad.guid = UUID.randomUUID().toString();
            e.extra.putString("age_restriction", o.optString("age_restriction"));
            ad.text = o.getString("description");
            ad.userPhoto = o.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
            ad.userName = o.getString("title");
            ad.genre = o.optString(ServerKeys.GENRE, o.optString("domain"));
            ad.timeToLive = o.optInt("time_to_live");
            if (ad.timeToLive != 0 && ad.timeToLive < 2592000) {
                ad.timeToLive += TimeUtils.getCurrentTime();
            }
            if (o.has("cards")) {
                ad.cards = parseCards(o.getJSONArray("cards"), adsId1, adsId2);
            } else if (o.has("video")) {
                ad.video = new VideoAttachment(new VideoFile(o.getJSONObject("video")));
            } else {
                ad.photo = new PhotoAttachment(parseAdImages(o), 0, 0, 0, "");
            }
            ad.ageRestriction = o.optString("age_restriction");
            ad.buttonText = o.optString(ServerKeys.BUTTON);
            ad.followers = o.optString("followers", o.optString("site_description"));
            ad.link = o.getString("link_url");
            ad.linkTarget = parseLinkUrlTarget(o);
            ad.rating = (float) o.optDouble("rating", 0.0d);
            ad.buttonTextInstalled = o.optString("button_open");
            ad.data = o.getString("ad_data");
            ad.dataImpression = new StatisticUrl(o.getString("ad_data_impression"), Statistic.TYPE_IMPRESSION, adsId1, adsId2, -1, ad);
            if (o.has("android_app")) {
                ad.appPackage = o.getJSONObject("android_app").getString("app_id");
                ad.deepLink = o.getJSONObject("android_app").optString(UserNotification.BUTTON_ACTION_OPEN_URL);
            }
            if (j == 0) {
                parseStatistics(obj, "ads_statistics", ad, adsId1, adsId2);
            }
            parseStatistics(o, "statistics", ad, adsId1, adsId2);
            L.e(ad);
            ad.text = ad.text == null ? "" : ad.text;
            e.attachments.add(ad);
        }
        return e;
    }

    public static int parseLinkUrlTarget(JSONObject o) throws JSONException {
        String optString = o.optString("link_url_target");
        char c = 65535;
        switch (optString.hashCode()) {
            case -1820761141:
                if (optString.equals("external")) {
                    c = 2;
                    break;
                }
                break;
            case -1544407700:
                if (optString.equals("internal_hidden")) {
                    c = 0;
                    break;
                }
                break;
            case 570410685:
                if (optString.equals("internal")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return 1;
            case 1:
                return 2;
            default:
                return 0;
        }
    }

    private static ArrayList<ShitAttachment.Card> parseCards(@NonNull JSONArray array, int adsId1, int adsId2) throws JSONException {
        ArrayList<ShitAttachment.Card> cards = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            JSONObject o = array.getJSONObject(i);
            ShitAttachment.Card card = new ShitAttachment.Card();
            card.link = o.getString("link_url");
            card.title = o.getString("title");
            card.description = o.getString("description");
            card.followers = o.optString("followers", o.optString("site_description"));
            card.rating = (float) o.optDouble("rating", 0.0d);
            card.buttonText = o.getString(ServerKeys.BUTTON);
            card.buttonTextInstalled = o.optString("button_open");
            card.linkTarget = parseLinkUrlTarget(o);
            card.photo = new PhotoAttachment(parseAdImages(o), 0, 0, 0, "");
            if (o.has("android_app")) {
                card.appPackage = o.getJSONObject("android_app").getString("app_id");
                card.deepLink = o.getJSONObject("android_app").optString(UserNotification.BUTTON_ACTION_OPEN_URL);
            }
            parseStatistics(o, "statistics", card, adsId1, adsId2);
            cards.add(card);
        }
        return cards;
    }

    private static HashMap<String, PhotoAttachment.Image> parseAdImages(@NonNull JSONObject o) throws JSONException {
        HashMap<String, PhotoAttachment.Image> images = new HashMap<>();
        JSONArray sizes = o.getJSONArray("photo_main");
        for (int i = 0; i < sizes.length(); i++) {
            JSONObject ji = sizes.getJSONObject(i);
            PhotoAttachment.Image img = new PhotoAttachment.Image();
            img.width = ji.getInt("width");
            img.height = ji.getInt("height");
            img.type = ji.getString(ServerKeys.TYPE).charAt(0);
            img.url = ji.getString("src");
            images.put(img.type + "", img);
        }
        return images;
    }

    private static void parseStatistics(@NonNull JSONObject obj, @NonNull String key, @NonNull Statistic ad, int adsId1, int adsId2) throws JSONException {
        if (obj.has(key)) {
            JSONArray stats = obj.getJSONArray(key);
            for (int i = 0; i < stats.length(); i++) {
                JSONObject s = stats.getJSONObject(i);
                String url = s.getString("url");
                String type = s.getString(ServerKeys.TYPE);
                int statisticSize = ad.getStatisticSizeByType(type);
                ad.addStatisticUrl(new StatisticUrl(url, type, adsId1, adsId2, statisticSize, ad));
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    NewsEntry(Serializer in) {
        PostInteract postInteract = null;
        this.userName = "UNKNOWN";
        this.type = 0;
        this.text = "";
        this.retweetText = "";
        this.attachType = 0;
        this.attachments = new ArrayList<>();
        this.repostAttachments = new ArrayList<>();
        this.flags = 0;
        this.numRetweets = 0;
        this.numViews = 0;
        this.extra = new Bundle();
        this.lastComment = null;
        this.order_position = 0;
        this.userName = in.readString();
        this.userID = in.readInt();
        this.ownerID = in.readInt();
        this.postID = in.readInt();
        this.type = in.readInt();
        this.text = in.readString();
        this.time = in.readInt();
        this.numComments = in.readInt();
        this.flags = in.readInt();
        this.retweetUID = in.readInt();
        this.retweetUserName = in.readString();
        this.numLikes = in.readInt();
        this.numRetweets = in.readInt();
        this.numViews = in.readInt();
        this.attachType = in.readInt();
        this.attachTitle = in.readString();
        this.userPhotoURL = in.readString();
        this.retweetText = in.readString();
        this.retweetUserPhoto = in.readString();
        this.retweetOrigId = in.readInt();
        this.retweetOrigTime = in.readInt();
        this.retweetType = in.readInt();
        this.createdBy = in.readInt();
        this.platform = in.readInt();
        int attachmentsLen = in.readInt();
        if (attachmentsLen >= 0) {
            this.attachments = new ArrayList<>(attachmentsLen);
            for (int i = 0; i < attachmentsLen; i++) {
                this.attachments.add(in.readSerializable(Attachment.class.getClassLoader()));
            }
        }
        int repostAttachmentLen = in.readInt();
        if (repostAttachmentLen >= 0) {
            this.repostAttachments = new ArrayList<>(repostAttachmentLen);
            for (int i2 = 0; i2 < repostAttachmentLen; i2++) {
                this.repostAttachments.add(in.readSerializable(Attachment.class.getClassLoader()));
            }
        }
        this.extra = in.readBundle(NewsEntry.class.getClassLoader());
        loadExtras();
        String listRefer = this.extra == null ? null : this.extra.getString(EXTRAS_KEY_LIST_REFER);
        this.postInteract = !TextUtils.isEmpty(listRefer) ? new PostInteract(listRefer, this) : postInteract;
        Statistic statistic = getShitAttachment();
        if (this.postInteract != null && statistic != null) {
            this.postInteract.setClickPostLinks(statistic.getStatisticByType(Statistic.TYPE_POST_LINK));
        }
        this.displayablePreviewText = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.text, this.postInteract)));
        if (this.retweetText != null) {
            this.displayableRetweetText = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.retweetText, this.postInteract)));
        }
        layoutThumbs();
        this.order_position = in.readInt();
        this.activity = (Activity) in.readSerializable(Activity.class.getClassLoader());
    }

    private void deserializeExtras(String xtra) {
        if (xtra != null && xtra.length() > 0) {
            try {
                JSONObject obj = new JSONObject(xtra);
                Iterator<String> keys = obj.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    Object o = obj.get(k);
                    if (o instanceof Integer) {
                        this.extra.putInt(k, ((Integer) o).intValue());
                    } else if (o instanceof Boolean) {
                        this.extra.putBoolean(k, ((Boolean) o).booleanValue());
                    } else if (o instanceof JSONObject) {
                        this.extra.putParcelable(k, JSONSerializable.Factory.from((JSONObject) o));
                    } else {
                        this.extra.putString(k, (String) o);
                    }
                }
            } catch (JSONException x) {
                Log.w("vk", x);
            }
        }
    }

    private String serializeExtras() {
        if (this.extra == null || this.extra.size() == 0) {
            return "";
        }
        try {
            JSONObject obj = new JSONObject();
            Set<String> keys = this.extra.keySet();
            for (String k : keys) {
                Object o = this.extra.get(k);
                if (o instanceof JSONSerializable) {
                    obj.put(k, JSONSerializable.Factory.to((JSONSerializable) o));
                } else {
                    obj.put(k, o);
                }
            }
            return obj.toString();
        } catch (JSONException x) {
            Log.w("vk", x);
            return "";
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer out) {
        out.writeString(this.userName);
        out.writeInt(this.userID);
        out.writeInt(this.ownerID);
        out.writeInt(this.postID);
        out.writeInt(this.type);
        out.writeString(this.text);
        out.writeInt(this.time);
        out.writeInt(this.numComments);
        out.writeInt(this.flags);
        out.writeInt(this.retweetUID);
        out.writeString(this.retweetUserName);
        out.writeInt(this.numLikes);
        out.writeInt(this.numRetweets);
        out.writeInt(this.numViews);
        out.writeInt(this.attachType);
        out.writeString(this.attachTitle);
        out.writeString(this.userPhotoURL);
        out.writeString(this.retweetText);
        out.writeString(this.retweetUserPhoto);
        out.writeInt(this.retweetOrigId);
        out.writeInt(this.retweetOrigTime);
        out.writeInt(this.retweetType);
        out.writeInt(this.createdBy);
        out.writeInt(this.platform);
        if (this.attachments == null) {
            out.writeInt(-1);
        } else {
            out.writeInt(this.attachments.size());
            for (int i = 0; i < this.attachments.size(); i++) {
                out.writeSerializable(this.attachments.get(i));
            }
        }
        if (this.repostAttachments == null) {
            out.writeInt(-1);
        } else {
            out.writeInt(this.repostAttachments.size());
            for (int i2 = 0; i2 < this.repostAttachments.size(); i2++) {
                out.writeSerializable(this.repostAttachments.get(i2));
            }
        }
        out.writeBundle(this.extra);
        out.writeInt(this.order_position);
        out.writeSerializable(this.activity);
    }

    public int getPlatformIconResource() {
        switch (this.platform) {
            case 2:
                return R.drawable.ic_post_app_android;
            case 3:
            case 4:
                return R.drawable.ic_post_app_ios;
            case 5:
            case 6:
                return R.drawable.ic_post_app_windows;
            case 7:
            case 9:
            default:
                return 0;
            case 8:
                return R.drawable.ic_post_app_instagram;
            case 10:
                return R.drawable.ic_post_app_prisma;
        }
    }

    private byte[] serializeAttachments() {
        if (this.attachments.size() == 0 && this.repostAttachments.size() == 0) {
            return null;
        }
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        DataOutputStream os = new DataOutputStream(buf);
        try {
            os.writeInt(this.attachments.size());
            Iterator<Attachment> it = this.attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                att.serialize(os);
            }
            os.writeInt(this.repostAttachments.size());
            Iterator<Attachment> it2 = this.repostAttachments.iterator();
            while (it2.hasNext()) {
                Attachment att2 = it2.next();
                att2.serialize(os);
            }
            os.flush();
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        return buf.toByteArray();
    }

    private byte[] serializeActivity() {
        if (this.activity == null) {
            return null;
        }
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        DataOutputStream os = new DataOutputStream(buf);
        try {
            this.activity.serialize(os);
            os.flush();
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        return buf.toByteArray();
    }

    public void writeToSQLite(SQLiteDatabase db, String table) {
        ContentValues values = new ContentValues();
        values.put("pid", Integer.valueOf(this.postID));
        values.put(ArgKeys.UID, Integer.valueOf(this.userID));
        values.put("text", this.text);
        values.put("time", Integer.valueOf(this.time));
        values.put(ServerKeys.LIKES, Integer.valueOf(this.numLikes));
        values.put("comments", Integer.valueOf(this.numComments));
        values.put("username", this.userName);
        values.put("userphoto", this.userPhotoURL);
        values.put("retweet_uid", Integer.valueOf(this.retweetUID));
        values.put("retweet_username", this.retweetUserName);
        values.put("attachments", (this.attachments.size() > 0 || this.repostAttachments.size() > 0) ? serializeAttachments() : null);
        values.put("flags", Integer.valueOf(this.flags | (this.type << 24)));
        values.put("retweet_text", this.retweetText);
        values.put("retweets", Integer.valueOf(this.numRetweets));
        values.put("viewers", Integer.valueOf(this.numViews));
        values.put("retweet_user_photo", this.retweetUserPhoto);
        values.put("retweet_orig_id", Integer.valueOf(this.retweetOrigId));
        values.put("retweet_orig_time", Integer.valueOf(this.retweetOrigTime));
        values.put("retweet_type", Integer.valueOf(this.retweetType));
        values.put("created_by", Integer.valueOf(this.createdBy));
        values.put(JsonMarshaller.PLATFORM, Integer.valueOf(this.platform));
        values.put(JsonMarshaller.EXTRA, serializeExtras());
        if (this.lastComment != null) {
            values.put("last_comment_name", this.lastCommentUserName);
            values.put("last_comment_photo", this.lastCommentUserPhoto);
            values.put("last_comment_text", this.lastComment);
            values.put("last_comment_time", Integer.valueOf(this.lastCommentTime));
        }
        values.put("order_position", Integer.valueOf(this.order_position));
        values.put("activity", serializeActivity());
        db.insert(table, null, values);
    }

    public void readFromSQLite(Cursor cursor) {
        PostInteract postInteract = null;
        ContentValues values = new ContentValues();
        DatabaseUtils.cursorRowToContentValues(cursor, values);
        this.postID = values.getAsInteger("pid").intValue();
        int intValue = values.getAsInteger(ArgKeys.UID).intValue();
        this.ownerID = intValue;
        this.userID = intValue;
        this.text = values.getAsString("text");
        this.time = values.getAsInteger("time").intValue();
        this.numLikes = values.getAsInteger(ServerKeys.LIKES).intValue();
        this.numRetweets = values.getAsInteger("retweets").intValue();
        this.numViews = values.getAsInteger("viewers").intValue();
        this.numComments = values.getAsInteger("comments").intValue();
        this.userName = values.getAsString("username");
        this.userPhotoURL = values.getAsString("userphoto");
        deserializeAttachments(values.getAsByteArray("attachments"));
        this.flags = values.getAsInteger("flags").intValue();
        this.retweetUID = values.getAsInteger("retweet_uid").intValue();
        this.retweetUserName = values.getAsString("retweet_username");
        this.retweetText = values.getAsString("retweet_text");
        this.retweetUserPhoto = values.getAsString("retweet_user_photo");
        this.retweetOrigId = values.getAsInteger("retweet_orig_id").intValue();
        this.retweetOrigTime = values.getAsInteger("retweet_orig_time").intValue();
        this.retweetType = values.getAsInteger("retweet_type").intValue();
        this.type = this.flags >> 24;
        if (values.containsKey("last_comment_name")) {
            this.lastCommentUserName = values.getAsString("last_comment_name");
            this.lastCommentUserPhoto = values.getAsString("last_comment_photo");
            this.lastComment = values.getAsString("last_comment_text");
            this.lastCommentTime = values.getAsInteger("last_comment_time").intValue();
        }
        this.createdBy = values.getAsInteger("created_by").intValue();
        this.platform = values.getAsInteger(JsonMarshaller.PLATFORM).intValue();
        deserializeExtras(values.getAsString(JsonMarshaller.EXTRA));
        if (this.extra.getBoolean("converted_to_photo")) {
            this.type = 1;
        }
        loadExtras();
        layoutThumbs();
        String listRefer = this.extra == null ? null : this.extra.getString(EXTRAS_KEY_LIST_REFER);
        if (!TextUtils.isEmpty(listRefer)) {
            postInteract = new PostInteract(listRefer, this);
        }
        this.postInteract = postInteract;
        Statistic statistic = getShitAttachment();
        if (this.postInteract != null && statistic != null) {
            this.postInteract.setClickPostLinks(statistic.getStatisticByType(Statistic.TYPE_POST_LINK));
        }
        if (this.type == 4) {
            this.displayablePreviewText = stripUnderlines((Spannable) Html.fromHtml(VKApplication.context.getResources().getString(R.string.feed_comments_topic) + " <a href='http://vk.com'>" + this.text + "</a>"));
            this.flags |= 16;
        } else {
            this.displayablePreviewText = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.text, this.postInteract)));
        }
        if (this.retweetText != null) {
            this.displayableRetweetText = Global.replaceEmoji(LinkParser.truncatePost(LinkParser.parseLinks(this.retweetText, this.postInteract)));
        }
        this.order_position = values.getAsInteger("order_position").intValue();
        deserializeActivity(values.getAsByteArray("activity"));
    }

    private void deserializeAttachments(byte[] b) {
        if (b != null) {
            ByteArrayInputStream buf = new ByteArrayInputStream(b);
            DataInputStream is = new DataInputStream(buf);
            try {
                int count = is.readInt();
                for (int i = 0; i < count; i++) {
                    this.attachments.add(Attachment.deserialize(is));
                }
                int count2 = is.readInt();
                for (int i2 = 0; i2 < count2; i2++) {
                    this.repostAttachments.add(Attachment.deserialize(is));
                }
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }
    }

    private void deserializeActivity(byte[] b) {
        if (b != null) {
            ByteArrayInputStream buf = new ByteArrayInputStream(b);
            DataInputStream is = new DataInputStream(buf);
            try {
                this.activity = Activity.deserialize(is);
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }
    }

    public int getImageCount() {
        int cnt = 0;
        Iterator<Attachment> it = this.repostAttachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof ImageAttachment) {
                cnt++;
            }
        }
        Iterator<Attachment> it2 = this.attachments.iterator();
        while (it2.hasNext()) {
            Attachment att2 = it2.next();
            if (att2 instanceof ImageAttachment) {
                cnt++;
            }
        }
        return cnt;
    }

    public ImageAttachment getImageAttachment(int idx) {
        int cnt = 0;
        Iterator<Attachment> it = this.repostAttachments.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof ImageAttachment) {
                if (cnt == idx) {
                    return (ImageAttachment) att;
                }
                cnt++;
            }
        }
        Iterator<Attachment> it2 = this.attachments.iterator();
        while (it2.hasNext()) {
            Attachment att2 = it2.next();
            if (att2 instanceof ImageAttachment) {
                if (cnt == idx) {
                    return (ImageAttachment) att2;
                }
                cnt++;
            }
        }
        return null;
    }

    public boolean flag(int f) {
        return (this.flags & f) > 0;
    }

    public void flag(int f, boolean v) {
        if (v) {
            this.flags |= f;
        } else {
            this.flags &= f ^ (-1);
        }
    }

    public boolean equals(NewsEntry e) {
        return e != null && e.ownerID == this.ownerID && e.postID == this.postID && e.userID == this.userID && e.type == this.type;
    }

    public String getTypeString() {
        switch (this.type) {
            case 1:
                return "photo";
            case 2:
                return "video";
            case 3:
                return "note";
            case 4:
                return "topic";
            case 5:
                return "wallreply";
            default:
                return ReportAppInputData.REPORT_TYPE_WALL;
        }
    }

    public String getRepostTypeString() {
        switch (this.retweetType) {
            case 1:
                return "photo";
            case 2:
                return "video";
            case 3:
                return "note";
            case 4:
                return "topic";
            case 5:
                return "wallreply";
            default:
                return ReportAppInputData.REPORT_TYPE_WALL;
        }
    }

    public static Spannable stripUnderlines(Spannable s) {
        URLSpan[] spans = (URLSpan[]) s.getSpans(0, s.length(), URLSpan.class);
        for (URLSpan span : spans) {
            int start = s.getSpanStart(span);
            int end = s.getSpanEnd(span);
            s.removeSpan(span);
            s.setSpan(new URLSpanNoUnderline(span.getURL()), start, end, 0);
        }
        ForegroundColorSpan[] aspans = (ForegroundColorSpan[]) s.getSpans(0, s.length(), ForegroundColorSpan.class);
        for (ForegroundColorSpan span2 : aspans) {
            int start2 = s.getSpanStart(span2);
            int end2 = s.getSpanEnd(span2);
            s.removeSpan(span2);
            XColorSpan as = new XColorSpan(span2.getForegroundColor());
            s.setSpan(as, start2, end2, 0);
        }
        return s;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class URLSpanNoUnderline extends URLSpan {
        public URLSpanNoUnderline(String url) {
            super(url);
        }

        @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint ds) {
            super.updateDrawState(ds);
            ds.setUnderlineText(false);
            if (ds.drawableState != null) {
                for (int i = 0; i < ds.drawableState.length; i++) {
                    if (ds.drawableState[i] == 16842919 || ds.drawableState[i] == 16842913) {
                    }
                }
                ds.setColor(-13936518);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class XColorSpan extends ForegroundColorSpan {
        public XColorSpan(int color) {
            super(color);
        }

        @Override // android.text.style.ForegroundColorSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint ds) {
            super.updateDrawState(ds);
            ds.setUnderlineText(false);
            if (ds.drawableState != null) {
                boolean isPressed = false;
                for (int i = 0; i < ds.drawableState.length; i++) {
                    if (ds.drawableState[i] == 16842919 || ds.drawableState[i] == 16842913) {
                        isPressed = true;
                    }
                }
                if (isPressed) {
                    ds.setColor(-1);
                } else {
                    ds.setColor(getForegroundColor());
                }
            }
        }
    }

    public static int getMaxThumbsWidth() {
        int tSize;
        DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
        if (Build.VERSION.SDK_INT >= 17) {
            Point p = new Point();
            WindowManager wm = (WindowManager) VKApplication.context.getSystemService("window");
            wm.getDefaultDisplay().getRealSize(p);
            tSize = Math.min(p.x, p.y);
        } else {
            tSize = Math.min(metrics.widthPixels, metrics.heightPixels);
        }
        return Math.min(tSize - (Screen.isTablet() ? V.dp(84.0f) : 0), V.dp(640.0f));
    }

    public void layoutThumbs() {
        layoutThumbs(this.attachments);
        layoutThumbs(this.repostAttachments);
        Iterator<Attachment> it = this.attachments.iterator();
        while (it.hasNext()) {
            Attachment a = it.next();
            if (a instanceof PollAttachment) {
                ((PollAttachment) a).parentPost = this;
            }
        }
        Iterator<Attachment> it2 = this.repostAttachments.iterator();
        while (it2.hasNext()) {
            Attachment a2 = it2.next();
            if (a2 instanceof PollAttachment) {
                ((PollAttachment) a2).parentPost = this;
            }
        }
    }

    public static void layoutThumbs(List<Attachment> attachments) {
        if (attachments.size() != 0) {
            boolean hasAnyThumbs = false;
            boolean hasSnippets = false;
            for (Attachment a : attachments) {
                if (a instanceof ThumbAttachment) {
                    hasAnyThumbs = true;
                }
                if (a instanceof SnippetAttachment) {
                    hasSnippets = true;
                }
            }
            int tSize = getMaxThumbsWidth();
            ZhukovLayout.processThumbs(tSize, tSize, attachments);
            if (hasAnyThumbs || hasSnippets) {
                for (Attachment a2 : attachments) {
                    if (a2 instanceof GeoAttachment) {
                        ((GeoAttachment) a2).style = 1;
                    }
                }
            }
        }
    }

    private static String ell(String s, int lim) {
        if (s.length() > lim) {
            return s.substring(0, lim) + "...";
        }
        return s;
    }

    public String toString() {
        return "NewsEntry {id=" + this.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.postID + ", text=" + ell(this.text, 200) + ", repostText=" + ell(this.retweetText, 200) + ", flags=" + this.flags + ", type=" + this.type + ", attachments=" + this.attachments + ", repostAttachments=" + this.repostAttachments + "}";
    }

    @Nullable
    public String getTrackCode() {
        return this.extra.getString(EXTRAS_KEY_TRACK_CODE);
    }

    public boolean hasTrackCode() {
        return this.extra.containsKey(EXTRAS_KEY_TRACK_CODE);
    }

    /* loaded from: classes2.dex */
    public static class Activity extends Serializer.SerializableAdapter implements Serializable {
        public static final Serializer.Creator<Activity> CREATOR = new Serializer.CreatorAdapter<Activity>() { // from class: com.vkontakte.android.NewsEntry.Activity.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Activity mo1087createFromSerializer(Serializer is) {
                Activity activity = new Activity();
                activity.type = is.readInt();
                activity.likesText = is.readString();
                int counter = is.readInt();
                for (int i = 0; i < counter; i++) {
                    activity.users.add(is.readString());
                }
                int counter2 = is.readInt();
                for (int i2 = 0; i2 < counter2; i2++) {
                    activity.photos.add(is.readString());
                }
                activity.commentID = is.readInt();
                activity.commentFromID = is.readInt();
                activity.commentDate = is.readLong();
                activity.commentText = is.readString();
                return activity;
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Activity[] mo1088newArray(int size) {
                return new Activity[size];
            }
        };
        public static final int TYPE_COMMENT = 1;
        public static final int TYPE_LIKES = 0;
        public long commentDate;
        public int commentFromID;
        public int commentID;
        public String commentText;
        public String likesText;
        public int type;
        public ArrayList<String> users = new ArrayList<>();
        public ArrayList<String> photos = new ArrayList<>();

        public final void serialize(DataOutputStream os) throws IOException {
            Serializer.get(os).writeSerializable(this);
        }

        public static Activity deserialize(DataInputStream is) throws IOException {
            return (Activity) Serializer.get(is).readSerializable(Activity.class.getClassLoader());
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer os) {
            os.writeInt(this.type);
            os.writeString(this.likesText);
            os.writeInt(this.users.size());
            Iterator<String> it = this.users.iterator();
            while (it.hasNext()) {
                String s = it.next();
                os.writeString(s);
            }
            os.writeInt(this.photos.size());
            Iterator<String> it2 = this.photos.iterator();
            while (it2.hasNext()) {
                String s2 = it2.next();
                os.writeString(s2);
            }
            os.writeInt(this.commentID);
            os.writeInt(this.commentFromID);
            os.writeLong(this.commentDate);
            os.writeString(this.commentText);
        }

        public static int getType(String type) {
            char c = 65535;
            switch (type.hashCode()) {
                case 102974396:
                    if (type.equals(ServerKeys.LIKES)) {
                        c = 0;
                        break;
                    }
                    break;
                case 950398559:
                    if (type.equals("comment")) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return 0;
                case 1:
                    return 1;
                default:
                    throw new IllegalArgumentException("Illegal activity type: " + type);
            }
        }

        public static Activity parse(JSONObject json, SparseArray<String> names, SparseArray<String> photos) throws JSONException {
            Activity activity = new Activity();
            String type = json.getString(ServerKeys.TYPE);
            JSONObject data = json.getJSONObject(type);
            char c = 65535;
            switch (type.hashCode()) {
                case 102974396:
                    if (type.equals(ServerKeys.LIKES)) {
                        c = 0;
                        break;
                    }
                    break;
                case 950398559:
                    if (type.equals("comment")) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    activity.type = 0;
                    activity.likesText = data.getString("text");
                    JSONArray userIDs = data.getJSONArray(ServerKeys.USER_IDS);
                    for (int i = 0; i < userIDs.length(); i++) {
                        activity.photos.add(photos.get(userIDs.getInt(i)));
                    }
                    break;
                case 1:
                    activity.type = 1;
                    int userId = data.getInt(ServerKeys.FROM_ID);
                    activity.commentFromID = userId;
                    activity.users.add(names.get(userId));
                    activity.photos.add(photos.get(userId));
                    activity.commentID = data.getInt("id");
                    activity.commentDate = data.getLong(ServerKeys.DATE);
                    activity.commentText = data.getString("text");
                    break;
                default:
                    throw new IllegalArgumentException("illegal activity type: " + type);
            }
            return activity;
        }
    }
}
