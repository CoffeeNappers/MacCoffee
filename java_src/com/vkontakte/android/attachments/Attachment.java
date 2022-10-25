package com.vkontakte.android.attachments;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import android.widget.ImageView;
import com.facebook.internal.NativeProtocol;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.media.camera.CameraUtils;
import com.vk.music.dto.Playlist;
import com.vk.sharing.SharingService;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.AudioAttachView;
import com.vkontakte.android.DocAttachView;
import com.vkontakte.android.GeoPlace;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ButtonAction;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.wall.WallGetById;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.PrettyCardAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.GoodAlbum;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.ActivityLocal;
import com.vkontakte.android.utils.Serializer;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public abstract class Attachment extends Serializer.SerializableAdapter {
    private static ActivityLocal<HashMap<String, ArrayList<View>>> reusableViews = new ActivityLocal<>();

    public abstract View getFullView(Context context);

    public abstract View getViewForList(Context context, View view);

    @Nullable
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }

    public final void serialize(DataOutputStream os) throws IOException {
        Serializer.get(os).writeSerializable(this);
    }

    public static Attachment deserialize(DataInputStream is) throws IOException {
        return (Attachment) Serializer.get(is).readSerializable(Attachment.class.getClassLoader());
    }

    public static Attachment parse(JSONObject o, @Nullable SparseArray<String> names, @Nullable SparseArray<String> photos) {
        return parse(o, null, names, photos);
    }

    public static Attachment parse(JSONObject o, String listRefer, @Nullable SparseArray<String> post_names, @Nullable SparseArray<String> post_photos) {
        try {
            String type = o.getString(ServerKeys.TYPE);
            JSONObject att = o.optJSONObject(type);
            String valueOf = String.valueOf(type);
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -2000418763:
                    if (valueOf.equals("wall_reply")) {
                        c = 17;
                        break;
                    }
                    break;
                case -1890252483:
                    if (valueOf.equals("sticker")) {
                        c = 16;
                        break;
                    }
                    break;
                case -1081306052:
                    if (valueOf.equals(ReportAppInputData.REPORT_TYPE_MARKET)) {
                        c = 0;
                        break;
                    }
                    break;
                case -601830049:
                    if (valueOf.equals("chronicle")) {
                        c = 18;
                        break;
                    }
                    break;
                case -165445030:
                    if (valueOf.equals(PrettyCardAttachment.REUSE_VIEW_TYPE)) {
                        c = 21;
                        break;
                    }
                    break;
                case 96801:
                    if (valueOf.equals("app")) {
                        c = 5;
                        break;
                    }
                    break;
                case 99640:
                    if (valueOf.equals("doc")) {
                        c = '\t';
                        break;
                    }
                    break;
                case 3172656:
                    if (valueOf.equals("gift")) {
                        c = '\n';
                        break;
                    }
                    break;
                case 3321850:
                    if (valueOf.equals("link")) {
                        c = 11;
                        break;
                    }
                    break;
                case 3387378:
                    if (valueOf.equals("note")) {
                        c = '\r';
                        break;
                    }
                    break;
                case 3433103:
                    if (valueOf.equals("page")) {
                        c = 14;
                        break;
                    }
                    break;
                case 3446719:
                    if (valueOf.equals("poll")) {
                        c = '\f';
                        break;
                    }
                    break;
                case 3641802:
                    if (valueOf.equals(ReportAppInputData.REPORT_TYPE_WALL)) {
                        c = 15;
                        break;
                    }
                    break;
                case 91412680:
                    if (valueOf.equals("graffiti")) {
                        c = 2;
                        break;
                    }
                    break;
                case 92896879:
                    if (valueOf.equals(ArgKeys.ALBUM)) {
                        c = 4;
                        break;
                    }
                    break;
                case 93166550:
                    if (valueOf.equals(MimeTypes.BASE_TYPE_AUDIO)) {
                        c = 6;
                        break;
                    }
                    break;
                case 106642994:
                    if (valueOf.equals("photo")) {
                        c = 1;
                        break;
                    }
                    break;
                case 112202875:
                    if (valueOf.equals("video")) {
                        c = '\b';
                        break;
                    }
                    break;
                case 190908443:
                    if (valueOf.equals("audio_playlist")) {
                        c = 20;
                        break;
                    }
                    break;
                case 241785004:
                    if (valueOf.equals("market_album")) {
                        c = 7;
                        break;
                    }
                    break;
                case 656372530:
                    if (valueOf.equals("posted_photo")) {
                        c = 3;
                        break;
                    }
                    break;
                case 1799528586:
                    if (valueOf.equals("money_transfer")) {
                        c = 19;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return new MarketAttachment(new Good(att));
                case 1:
                    if (att.optJSONArray("sizes") != null) {
                        return new PhotoAttachment(new Photo(att));
                    }
                    return new PhotoAttachment(new PhotoAttachment.Image[]{new PhotoAttachment.Image('m', att.getString("src"), 0, 0), new PhotoAttachment.Image('x', att.getString("src_big"), 0, 0), new PhotoAttachment.Image('y', att.optString("src_xbig", null), 0, 0)}, att.getInt("owner_id"), att.optInt("id", -att.optInt("gid")), att.optInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, -7), att.optString("text"), att.optInt("user_id", att.getInt("owner_id")), att.optInt(ServerKeys.CREATED), att.optString("access_key", ""), 0, -9000.0d, -9000.0d);
                case 2:
                    PhotoAttachment pa = new PhotoAttachment(att.getString("photo_200"), att.getString("photo_586"), att.getInt("owner_id"), att.getInt("id"), Integer.MIN_VALUE);
                    pa.images.get("m").width = 200;
                    pa.images.get("m").height = 100;
                    pa.images.get("x").width = 586;
                    pa.images.get("x").height = 293;
                    return pa;
                case 3:
                    PhotoAttachment pa2 = new PhotoAttachment(att.getString("photo_130"), att.getString("photo_604"), att.getInt("owner_id"), att.getInt("id"), Integer.MIN_VALUE);
                    pa2.images.get("m").width = 130;
                    pa2.images.get("m").height = 98;
                    pa2.images.get("x").width = 604;
                    pa2.images.get("x").height = CameraUtils.Settings.LOW_HEIGHT;
                    return pa2;
                case 4:
                    JSONArray sizes = att.getJSONObject(AttachmentInfo.DATA_THUMB).optJSONArray("sizes");
                    if (sizes != null) {
                        ArrayList<PhotoAttachment.Image> photos = new ArrayList<>();
                        for (int i = 0; i < sizes.length(); i++) {
                            JSONObject so = sizes.getJSONObject(i);
                            photos.add(new PhotoAttachment.Image(so.optString(ServerKeys.TYPE, "?").charAt(0), so.getString("src"), so.getInt("width"), so.getInt("height")));
                        }
                        return new AlbumAttachment((PhotoAttachment.Image[]) photos.toArray(new PhotoAttachment.Image[0]), att.getInt("owner_id"), att.optInt("pid", -1), att.optInt("id", -7), att.optString("title"), att.getInt("size"));
                    }
                    return new AlbumAttachment(new PhotoAttachment.Image[]{new PhotoAttachment.Image('m', att.getJSONObject(AttachmentInfo.DATA_THUMB).getString("src"), 0, 0), new PhotoAttachment.Image('x', att.getJSONObject(AttachmentInfo.DATA_THUMB).getString("src_big"), 0, 0), new PhotoAttachment.Image('y', att.getJSONObject(AttachmentInfo.DATA_THUMB).optString("src_xbig", null), 0, 0)}, att.getInt("owner_id"), att.optInt("pid", -att.optInt("gid")), att.optInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID), att.optString("title"), att.getInt("size"));
                case 5:
                    return new PhotoAttachment(att.getString("src"), (String) null, -1, -1, -1);
                case 6:
                    return new AudioAttachment(new MusicTrack(att));
                case 7:
                    return new MarketAlbumAttachment(new GoodAlbum(att));
                case '\b':
                    VideoFile vf = new VideoFile(att);
                    if (post_names != null) {
                        vf.ownerName = post_names.get(vf.oid);
                    }
                    if (post_photos != null) {
                        vf.ownerPhoto = post_photos.get(vf.oid);
                    }
                    return new VideoAttachment(vf);
                case '\t':
                    JSONObject preview = att.optJSONObject("preview");
                    if (preview != null) {
                        if (preview.optJSONObject("graffiti") != null) {
                            return new GraffitiAttachment(new Document(att));
                        }
                        if (preview.has("audio_msg")) {
                            return new AudioMessageAttachment(new Document(att));
                        }
                        return new DocumentAttachment(new Document(att));
                    }
                    return new DocumentAttachment(new Document(att));
                case '\n':
                    return new GiftAttachment(att.getInt("id"), new String[]{att.getString("thumb_48"), att.getString("thumb_96"), att.getString("thumb_256")}, att.optInt("stickers_product_id"));
                case 11:
                    if (att.has("photo")) {
                        String descr = att.has("product") ? att.getJSONObject("product").getJSONObject("price").getString("text") : att.optString("description");
                        String btn = "";
                        String btnLink = "";
                        ButtonAction buttonAction = null;
                        if (att.has(ServerKeys.BUTTON)) {
                            btn = att.getJSONObject(ServerKeys.BUTTON).getString("title");
                            btnLink = att.getJSONObject(ServerKeys.BUTTON).optString("url");
                            JSONObject buttonActionJson = att.getJSONObject(ServerKeys.BUTTON).optJSONObject(NativeProtocol.WEB_DIALOG_ACTION);
                            if (buttonActionJson != null) {
                                buttonAction = new ButtonAction(buttonActionJson);
                            }
                        }
                        float rating = 0.0f;
                        int reviewCount = 0;
                        if (att.has("rating")) {
                            rating = (float) att.getJSONObject("rating").getDouble("stars");
                            reviewCount = att.getJSONObject("rating").getInt("reviews_count");
                        }
                        return new SnippetAttachment(att.getString("title"), descr, att.optString(ShareConstants.FEED_CAPTION_PARAM), att.getString("url"), att.getString(SharingService.EXTRA_TARGET), new Photo(att.getJSONObject("photo")), att.has("product"), btn, btnLink, rating, reviewCount, att.optString("preview_page"), buttonAction);
                    }
                    return new LinkAttachment(att.getString("url"), att.getString("title"), att.optString("preview_page", ""));
                case '\f':
                    return new PollAttachment(att);
                case '\r':
                    return new NoteAttachment(att.getString("title"), att.getInt("owner_id"), att.getInt("id"));
                case 14:
                    return new WikiAttachment(att.getString("title"), att.optString(ServerKeys.SECTION), -att.optInt("group_id"), att.optInt("page_id"));
                case 15:
                    if (att.has("copy_post_id") || att.has("copy_history")) {
                        final NewsEntry[] post = {null};
                        new WallGetById(new String[]{att.getInt("to_id") + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + att.getInt("id")}).setCallback(new SimpleCallback<NewsEntry[]>() { // from class: com.vkontakte.android.attachments.Attachment.1
                            @Override // com.vkontakte.android.api.Callback
                            public void success(NewsEntry[] news) {
                                post[0] = news[0];
                            }
                        }).execSync();
                        if (post[0] != null) {
                            return new PostAttachment(post[0]);
                        }
                        return null;
                    }
                    SparseArray<String> names = new SparseArray<>();
                    SparseArray<String> photos2 = new SparseArray<>();
                    JSONObject users1 = att.optJSONObject(ServerKeys.FROM);
                    JSONObject users2 = att.optJSONObject("copy_owner");
                    if (users1 != null) {
                        for (int i2 = 0; i2 < users1.length(); i2++) {
                            if (users1.has("id")) {
                                int uid = users1.getInt("id");
                                if (users1.has("first_name")) {
                                    names.put(uid, users1.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + users1.getString("last_name"));
                                    photos2.put(uid, users1.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", ""));
                                } else {
                                    names.put(-uid, users1.getString("name"));
                                    photos2.put(-uid, users1.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", ""));
                                }
                            } else if (users1.has(ArgKeys.UID)) {
                                int uid2 = users1.getInt(ArgKeys.UID);
                                names.put(uid2, users1.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + users1.getString("last_name"));
                                photos2.put(uid2, users1.optString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec", ""));
                            } else {
                                int uid3 = -users1.getInt("gid");
                                names.put(uid3, users1.getString("name"));
                                photos2.put(uid3, users1.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", ""));
                            }
                        }
                    }
                    if (users2 != null) {
                        for (int i3 = 0; i3 < users2.length(); i3++) {
                            if (users2.has("id")) {
                                int uid4 = users2.getInt("id");
                                String ph = users2.optString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
                                if (ph == null) {
                                    ph = users2.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                                }
                                if (users2.has("first_name")) {
                                    names.put(uid4, users2.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + users2.getString("last_name"));
                                    photos2.put(uid4, ph);
                                } else {
                                    names.put(-uid4, users2.getString("name"));
                                    photos2.put(-uid4, ph);
                                }
                            } else {
                                int uid5 = -users2.getInt("gid");
                                names.put(uid5, users2.getString("name"));
                                photos2.put(uid5, users2.getString(Global.displayDensity > 1.0f ? "photo" : "photo_medium"));
                            }
                        }
                    }
                    return new PostAttachment(new NewsEntry(att, listRefer, names, photos2));
                case 16:
                    String[] imgs = {att.getString("photo_64"), att.getString("photo_128"), att.getString("photo_256")};
                    int id = att.getInt("id");
                    return new StickerAttachment(id, imgs, att.getInt("width"), att.getInt("height"), att.optInt("product_id", 0));
                case 17:
                    final NewsEntry[] post2 = {null};
                    new WallGetById(new String[]{att.getInt("owner_id") + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + att.getInt(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID)}).setCallback(new SimpleCallback<NewsEntry[]>() { // from class: com.vkontakte.android.attachments.Attachment.2
                        @Override // com.vkontakte.android.api.Callback
                        public void success(NewsEntry[] news) {
                            post2[0] = news[0];
                        }
                    }).execSync();
                    if (post2[0] == null) {
                        return null;
                    }
                    return new PostAttachment(post2[0]);
                case 18:
                    return new ChronicleAttachment(att.getInt("id"), att.getInt("owner_id"), att.getString(NativeProtocol.BRIDGE_ARG_APP_NAME_STRING), att.optString(ShareConstants.FEED_CAPTION_PARAM), att.getString("package"), att.getString("label"), att.getString("src_blur"), att.optString("src_big"));
                case 19:
                    return new MoneyTransferAttachment(new MoneyTransfer(att));
                case 20:
                    return new AudioPlaylistAttachment(new Playlist(att));
                case 21:
                    return new PrettyCardAttachment(att);
                default:
                    Log.w("vk", "Unknown attachment " + o);
                    return null;
            }
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    public static GeoAttachment parseGeo(JSONObject j) throws JSONException {
        String str;
        char c = 65535;
        String coords = j.getString("coordinates");
        String[] c2 = coords.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        double lat = Double.parseDouble(c2[0]);
        double lon = Double.parseDouble(c2[1]);
        if (j.has("place")) {
            GeoPlace place = new GeoPlace(j.getJSONObject("place"));
            int style = 0;
            String string = j.getString(ServerKeys.TYPE);
            switch (string.hashCode()) {
                case 106748167:
                    if (string.equals("place")) {
                        c = 1;
                        break;
                    }
                    break;
                case 106845584:
                    if (string.equals("point")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    if (j.optInt("showmap") != 1) {
                        style = 1;
                        break;
                    } else {
                        style = 3;
                        break;
                    }
                case 1:
                    style = 2;
                    break;
            }
            String str2 = place.title;
            if (!TextUtils.isEmpty(place.address)) {
                str = place.address;
            } else {
                str = TextUtils.isEmpty(place.city) ? TextUtils.isEmpty(place.country) ? "" : place.country : place.city;
            }
            return new GeoAttachment(lat, lon, str2, str, place.id, place.photo, style);
        }
        return new GeoAttachment(lat, lon, "title", "subtitle", -1, null, 0);
    }

    public static View getReusableView(Context context, String type) {
        Activity activity = Utils.castToActivity(context);
        if (reusableViews.get(activity) == null) {
            reusableViews.put(activity, new HashMap<>());
        }
        if (!reusableViews.get(activity).containsKey(type)) {
            reusableViews.get(activity).put(type, new ArrayList<>());
        }
        if (reusableViews.get(activity).get(type).size() > 0) {
            return reusableViews.get(activity).get(type).remove(0);
        }
        if ("common".equals(type)) {
            View v = View.inflate(context, R.layout.post_attach_common, null);
            v.setTag(type);
            return v;
        } else if ("signature".equals(type)) {
            View v2 = View.inflate(context, R.layout.post_attach_signature, null);
            v2.setTag(type);
            return v2;
        } else if (MimeTypes.BASE_TYPE_AUDIO.equals(type)) {
            View v3 = new AudioAttachView(context);
            v3.setTag(type);
            return v3;
        } else if (ArgKeys.ALBUM.equals(type)) {
            View v4 = View.inflate(context, R.layout.attach_album, null);
            v4.setTag(type);
            return v4;
        } else if ("video".equals(type)) {
            View v5 = View.inflate(context, R.layout.attach_video, null);
            v5.setTag(type);
            return v5;
        } else if (VideoAttachment.HOLDER_TYPE_SINGLE.equals(type) || VideoAttachment.HOLDER_TYPE_ADS.equals(type)) {
            View v6 = View.inflate(context, R.layout.attach_video_single, null);
            v6.setTag(type);
            return v6;
        } else if ("photo".equals(type)) {
            View v7 = new PhotoAttachment.FixedSizeImageView(context);
            v7.setTag(type);
            return v7;
        } else if ("market_album".equals(type)) {
            View v8 = new PhotoAttachment.FixedSizeImageViewTopCrop(context);
            v8.setTag(type);
            return v8;
        } else if ("doc_thumb".equals(type)) {
            View v9 = View.inflate(context, R.layout.attach_doc_thumb, null);
            v9.setTag(type);
            return v9;
        } else if ("repost".equals(type)) {
            View v10 = View.inflate(context, R.layout.wall_retweet, null);
            v10.setTag(type);
            return v10;
        } else if ("animation".equals(type)) {
            View v11 = View.inflate(context, R.layout.attach_animation, null);
            v11.setTag(type);
            return v11;
        } else if ("audio_message".equals(type)) {
            View v12 = View.inflate(context, R.layout.attach_audio_message, null);
            v12.setTag(type);
            return v12;
        } else if (!PrettyCardAttachment.REUSE_VIEW_TYPE.equals(type)) {
            return null;
        } else {
            RecyclerView v13 = new RecyclerView(context);
            v13.addItemDecoration(new PrettyCardAttachment.PrettyCardDecoration());
            v13.setLayoutManager(new LinearLayoutManager(context, 0, false));
            v13.setTag(type);
            return v13;
        }
    }

    public static void reuseView(View view, String type) {
        Context context = view.getContext();
        Activity activity = Utils.castToActivity(context);
        if (reusableViews.get(activity) == null) {
            reusableViews.put(activity, new HashMap<>());
        }
        if (!reusableViews.get(activity).containsKey(type)) {
            reusableViews.get(activity).put(type, new ArrayList<>());
        }
        reusableViews.get(activity).get(type).add(view);
        if ("photo".equals(type)) {
            ((ImageView) view).setImageBitmap(null);
        }
        if ("doc_thumb".equals(type)) {
            ((DocAttachView) view).reset();
        }
    }

    public static void sort(List<Attachment> atts) {
        ArrayList<Attachment> photos = new ArrayList<>();
        ArrayList<Attachment> albums = new ArrayList<>();
        ArrayList<Attachment> videos = new ArrayList<>();
        ArrayList<Attachment> audios = new ArrayList<>();
        ArrayList<Attachment> others = new ArrayList<>();
        for (Attachment a : atts) {
            if (a instanceof AlbumAttachment) {
                albums.add(a);
            } else if (a instanceof PhotoAttachment) {
                photos.add(a);
            } else if (a instanceof VideoAttachment) {
                videos.add(a);
            } else if ((a instanceof AudioAttachment) || (a instanceof DocumentAttachment) || (a instanceof PollAttachment)) {
                audios.add(a);
            } else {
                others.add(a);
            }
        }
        atts.clear();
        atts.addAll(photos);
        atts.addAll(albums);
        atts.addAll(videos);
        atts.addAll(audios);
        atts.addAll(others);
    }

    public static String getLocalizedDescription(Attachment att) {
        if (att instanceof PhotoAttachment) {
            return VKApplication.context.getString(R.string.photo);
        }
        if (att instanceof VideoAttachment) {
            return VKApplication.context.getString(R.string.video);
        }
        if (att instanceof AudioAttachment) {
            return VKApplication.context.getString(R.string.audio);
        }
        if (att instanceof AudioMessageAttachment) {
            return VKApplication.context.getString(R.string.audio_message);
        }
        if (att instanceof DocumentAttachment) {
            return VKApplication.context.getString(R.string.doc);
        }
        if (att instanceof PostAttachment) {
            return VKApplication.context.getString(R.string.attach_wall_post);
        }
        if (att instanceof GeoAttachment) {
            return VKApplication.context.getString(R.string.place);
        }
        if (att instanceof StickerAttachment) {
            return VKApplication.context.getString(R.string.sticker);
        }
        if (att instanceof GiftAttachment) {
            return VKApplication.context.getString(R.string.gift);
        }
        if (att instanceof PollAttachment) {
            return VKApplication.context.getString(R.string.attach_poll);
        }
        if (att instanceof NoteAttachment) {
            return VKApplication.context.getString(R.string.attach_note);
        }
        if (att instanceof WikiAttachment) {
            return VKApplication.context.getString(R.string.attach_wiki);
        }
        if (att instanceof LinkAttachment) {
            return VKApplication.context.getString(R.string.attach_link);
        }
        if (att instanceof ChronicleAttachment) {
            return ((ChronicleAttachment) att).label;
        }
        if (att instanceof MarketAttachment) {
            return VKApplication.context.getString(R.string.good);
        }
        if (att instanceof GraffitiAttachment) {
            return VKApplication.context.getString(R.string.picker_graffiti);
        }
        if (att instanceof MoneyTransferAttachment) {
            return VKApplication.context.getString(R.string.money_transfer_money_transfer);
        }
        if ((att instanceof SnippetAttachment) && ((SnippetAttachment) att).isStory()) {
            return VKApplication.context.getString(R.string.story);
        }
        if (att instanceof AudioPlaylistAttachment) {
            return VKApplication.context.getString(R.string.music_title_playlist);
        }
        return VKApplication.context.getString(R.string.attachment);
    }

    public static String getLocalizedDescription(List<Attachment> atts) {
        if (atts.size() == 1) {
            return getLocalizedDescription(atts.get(0));
        }
        String firstType = atts.get(0).getClass().getSimpleName();
        for (Attachment att : atts) {
            if (!att.getClass().getSimpleName().equals(firstType)) {
                return VKApplication.context.getString(R.string.attachments);
            }
        }
        return getLocalizedDescription(atts.get(0));
    }

    public static String appendLocalizedDescription(String text, List<Attachment> atts) {
        if (atts.size() != 0) {
            String desc = getLocalizedDescription(atts);
            return TextUtils.isEmpty(text) ? desc : text + " [" + desc + "]";
        }
        return text;
    }
}
