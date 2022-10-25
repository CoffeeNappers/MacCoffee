package com.vkontakte.android.api.users;

import android.graphics.RectF;
import android.text.TextUtils;
import android.util.SparseArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.music.dto.Playlist;
import com.vk.stories.model.GetStoriesResponse;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.BoardTopic;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.ExtendedUserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.models.GiftItem;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.data.Wiki;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.Utils;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetFullProfile extends VKAPIRequest<Result> {
    int uid;

    /* loaded from: classes2.dex */
    public static class Result {
        public ExtendedUserProfile profile;
    }

    public GetFullProfile(int uid, int photoCount, int giftCount, int goodsCount) {
        super(uid > 0 ? "execute.getFullProfileNewNew" : "execute.getFullGroupNewNew");
        if (uid > 0) {
            param("user_id", uid);
            param("func_v", 2);
        } else {
            param("group_id", -uid);
            param("func_v", 5);
            param("good_count", goodsCount);
        }
        this.uid = uid;
        param("photo_count", photoCount);
        param("gift_count", giftCount);
        param(ServerKeys.PHOTO_SIZES, 1);
        param("skip_hidden", 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        JSONObject getStoriesJson;
        JSONArray jgoods;
        JSONArray jphotos;
        JSONArray coverSizes;
        try {
            JSONObject o2 = o.optJSONObject(ServerKeys.RESPONSE);
            if (o2 == null) {
                return new Result();
            }
            ExtendedUserProfile ep = new ExtendedUserProfile();
            JSONObject oButton = o2.optJSONObject("app_button");
            if (oButton != null) {
                ep.buttonAppId = oButton.optInt("app_id");
                ep.buttonTitle = oButton.optString("title");
            }
            JSONObject cover = o2.optJSONObject("cover");
            if (cover != null && (coverSizes = cover.optJSONArray("images")) != null && coverSizes.length() > 0) {
                ep.setHasCover(cover.optInt("enabled", 0) != 0);
                ep.coverPhoto = new Photo();
                for (int i = 0; i < coverSizes.length(); i++) {
                    JSONObject coverItem = coverSizes.getJSONObject(i);
                    Photo.Image image = new Photo.Image();
                    image.height = coverItem.getInt("height");
                    image.width = coverItem.getInt("width");
                    image.url = coverItem.getString("url");
                    ep.coverPhoto.sizes.add(image);
                }
            }
            ep.profile = new UserProfile();
            ep.screenName = o2.optString("screen_name", "id" + this.uid);
            ep.isFavorite = o2.optInt("is_favorite") == 1;
            ep.isSubscribed = o2.optInt("is_subscribed") == 1;
            ep.canSendFriendRequest = o2.optInt("can_send_friend_request") == 1;
            ep.canUploadVideo = o2.optInt("can_upload_video") == 1;
            if (this.uid > 0) {
                ep.profile.uid = o2.getInt("id");
                ep.profile.firstName = o2.getString("first_name");
                ep.profile.lastName = o2.getString("last_name");
                ep.profile.fullName = ep.profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ep.profile.lastName;
                ep.profile.photo = o2.getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
                ep.profile.isFriend = o2.getInt("friend_status") == 3;
                ep.bigPhoto = o2.optString("photo_max", o2.getString("photo_medium_rec"));
                ep.activity = o2.optString("activity", "");
                ep.profile.f = o2.getInt("sex") == 1;
                ep.profile.online = Global.getUserOnlineStatus(o2);
                if (o2.has("crop_photo")) {
                    ep.photo = new Photo(o2.getJSONObject("crop_photo").getJSONObject("photo"));
                    JSONObject rect = o2.getJSONObject("crop_photo").getJSONObject("rect");
                    JSONObject crop = o2.getJSONObject("crop_photo").getJSONObject("crop");
                    double cropX1 = crop.getDouble("x");
                    double cropX2 = crop.getDouble("x2");
                    double cropY1 = crop.getDouble("y");
                    double cropY2 = crop.getDouble("y2");
                    double rectX1 = rect.getDouble("x");
                    double rectX2 = rect.getDouble("x2");
                    double rectY1 = rect.getDouble("y");
                    double rectY2 = rect.getDouble("y2");
                    double cropW = (cropX2 - cropX1) / 100.0d;
                    double cropH = (cropY2 - cropY1) / 100.0d;
                    double rectW = (rectX2 - rectX1) / 100.0d;
                    double rectH = (rectY2 - rectY1) / 100.0d;
                    double destW = rectW * cropW;
                    double destH = rectH * cropH;
                    ep.photoRect = new RectF((float) ((cropX1 / 100.0d) + ((rectX1 / 100.0d) * cropW)), (float) ((cropY1 / 100.0d) + ((rectY1 / 100.0d) * cropH)), (float) ((cropX1 / 100.0d) + ((rectX1 / 100.0d) * cropW) + destW), (float) ((cropY1 / 100.0d) + ((rectY1 / 100.0d) * cropH) + destH));
                }
                SparseArray<String> cities = new SparseArray<>();
                JSONArray jcities = o2.getJSONArray("cities");
                for (int i2 = 0; i2 < jcities.length(); i2++) {
                    JSONObject city = jcities.getJSONObject(i2);
                    cities.put(city.getInt("id"), city.getString("title"));
                }
                SparseArray<String> countries = new SparseArray<>();
                JSONArray jcountries = o2.getJSONArray("cities");
                for (int i3 = 0; i3 < jcountries.length(); i3++) {
                    JSONObject country = jcountries.getJSONObject(i3);
                    countries.put(country.getInt("id"), country.getString("title"));
                }
                ep.canWrite = o2.getInt("can_write_private_message") == 1;
                ep.canPost = o2.getInt("can_post") == 1;
                ep.canSeeAllPosts = o2.optInt("can_see_all_posts") == 1;
                ep.showAllPosts = "all".equals(o2.optString("wall_default"));
                ep.canCall = o2.optInt("can_call") == 1;
                ep.blacklisted = o2.optInt("blacklisted_by_me") == 1;
                if (o2.optInt("blacklisted") == 1) {
                    ep.ban = new ExtendedUserProfile.BanInfo();
                }
                ep.relation = o2.optInt("relation");
                if (o2.has("relation_partner")) {
                    ep.relationPartner = o2.getJSONObject("relation_partner").getInt("id");
                    ep.relationPartnerName = o2.getJSONObject("relation_partner").getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + o2.getJSONObject("relation_partner").getString("last_name");
                }
                if (o2.has("bdate")) {
                    String[] bd = o2.getString("bdate").split("\\.");
                    ep.bDay = Integer.parseInt(bd[0]);
                    ep.bMonth = Integer.parseInt(bd[1]);
                    if (bd.length > 2) {
                        ep.bYear = Integer.parseInt(bd[2]);
                    }
                }
                ep.firstNameDat = o2.optString("first_name_dat", ep.profile.firstName);
                ep.firstNameGen = o2.optString("first_name_gen", ep.profile.firstName);
                ep.firstNameIns = o2.optString("first_name_ins", ep.profile.firstName);
                ep.firstNameAcc = o2.optString("first_name_acc", ep.profile.firstName);
                ep.lastNameDat = o2.optString("last_name_dat", ep.profile.lastName);
                ep.lastNameGen = o2.optString("last_name_gen", ep.profile.lastName);
                ep.lastNameIns = o2.optString("last_name_ins", ep.profile.lastName);
                ep.lastNameAcc = o2.optString("last_name_acc", ep.profile.lastName);
                if (o2.has("city") && o2.has("country")) {
                    ep.city = o2.getJSONObject("city").getString("title");
                    ep.country = o2.getJSONObject("country").getString("title");
                }
                if (o2.has("mobile_phone") && o2.getString("mobile_phone").length() > 0) {
                    ep.mobilePhone = o2.getString("mobile_phone");
                }
                if (o2.has("home_phone") && o2.getString("home_phone").length() > 0) {
                    ep.homePhone = o2.getString("home_phone");
                }
                if (o2.has("skype")) {
                    ep.skype = o2.getString("skype");
                }
                if (o2.has("twitter")) {
                    ep.twitter = o2.getString("twitter");
                }
                if (o2.has("livejournal")) {
                    ep.livejournal = o2.getString("livejournal");
                }
                if (o2.has("facebook") && o2.optLong("facebook", -1L) != -1) {
                    ep.facebookId = o2.getLong("facebook");
                    ep.facebookName = o2.getString("facebook_name");
                }
                if (o2.has("instagram")) {
                    ep.instagram = o2.getString("instagram");
                }
                ep.friendStatus = o2.getInt("friend_status");
                JSONArray schools = o2.optJSONArray("schools");
                ep.schools = new ArrayList<>();
                if (schools != null) {
                    for (int i4 = 0; i4 < schools.length(); i4++) {
                        ExtendedUserProfile.School s = new ExtendedUserProfile.School();
                        JSONObject js = schools.getJSONObject(i4);
                        s.city = cities.get(js.optInt("city"));
                        s.name = js.optString("name", "???");
                        s.from = js.optInt("year_from");
                        s.to = js.optInt("year_to");
                        s.graduation = js.optInt("year_graduated");
                        s.className = js.optString("class", null);
                        s.speciality = js.optString("speciality", null);
                        s.type = js.optString("type_str", VKApplication.context.getResources().getString(R.string.profile_school));
                        ep.schools.add(s);
                    }
                }
                ep.universities = new ArrayList<>();
                JSONArray univers = o2.optJSONArray("universities");
                if (univers != null) {
                    for (int i5 = 0; i5 < univers.length(); i5++) {
                        ExtendedUserProfile.University u = new ExtendedUserProfile.University();
                        JSONObject ju = univers.getJSONObject(i5);
                        u.city = cities.get(ju.getInt("city"));
                        u.name = ju.getString("name").trim();
                        if (ju.has("faculty_name")) {
                            u.faculty = ju.getString("faculty_name").trim();
                        }
                        if (ju.has("chair_name")) {
                            u.chair = ju.getString("chair_name").trim();
                        }
                        u.graduation = ju.optInt("graduation");
                        ep.universities.add(u);
                    }
                }
                if (o2.has("interests") && o2.getString("interests").length() > 0) {
                    ep.interests = o2.getString("interests");
                }
                if (o2.has("movies") && o2.getString("movies").length() > 0) {
                    ep.movies = o2.getString("movies");
                }
                if (o2.has("music") && o2.getString("music").length() > 0) {
                    ep.music = o2.getString("music");
                }
                if (o2.has("tv") && o2.getString("tv").length() > 0) {
                    ep.tv = o2.getString("tv");
                }
                if (o2.has("books") && o2.getString("books").length() > 0) {
                    ep.books = o2.getString("books");
                }
                if (o2.has("games") && o2.getString("games").length() > 0) {
                    ep.games = o2.getString("games");
                }
                if (o2.has("about") && o2.getString("about").length() > 0) {
                    ep.about = o2.getString("about");
                }
                if (o2.has("quotes") && o2.getString("quotes").length() > 0) {
                    ep.quotations = o2.getString("quotes");
                }
                if (o2.has("activities") && o2.getString("activities").length() > 0) {
                    ep.activities = o2.getString("activities");
                }
                if (o2.has("home_town") && o2.getString("home_town").length() > 0) {
                    ep.hometown = o2.getString("home_town");
                }
                if (o2.has("site") && o2.getString("site").length() > 0) {
                    ep.website = o2.getString("site");
                }
                ep.verified = o2.optInt("verified") == 1;
                JSONObject personal = o2.optJSONObject("personal");
                if (personal != null) {
                    JSONArray langs = personal.optJSONArray("langs");
                    if (langs != null) {
                        ArrayList<String> sl = new ArrayList<>();
                        for (int i6 = 0; i6 < langs.length(); i6++) {
                            sl.add(langs.getString(i6));
                        }
                        ep.langs = TextUtils.join(", ", sl);
                    }
                    ep.political = personal.optInt("political");
                    ep.religion = personal.optString("religion");
                    ep.lifeMain = personal.optInt("life_main");
                    ep.peopleMain = personal.optInt("people_main");
                    ep.inspiredBy = personal.optString("inspired_by");
                    ep.smoking = personal.optInt("smoking");
                    ep.alcohol = personal.optInt("alcohol");
                }
                SparseArray<UserProfile> relatives = new SparseArray<>();
                JSONArray jrelprofiles = o2.optJSONArray("relatives_profiles");
                if (jrelprofiles != null) {
                    for (int i7 = 0; i7 < jrelprofiles.length(); i7++) {
                        UserProfile p = new UserProfile(jrelprofiles.getJSONObject(i7));
                        relatives.put(p.uid, p);
                    }
                }
                JSONArray rels = o2.optJSONArray("relatives");
                if (rels != null) {
                    ArrayList<UserProfile> parents = null;
                    ArrayList<UserProfile> siblings = null;
                    ArrayList<UserProfile> children = null;
                    ArrayList<UserProfile> grandparents = null;
                    ArrayList<UserProfile> grandchildren = null;
                    for (int i8 = 0; i8 < rels.length(); i8++) {
                        JSONObject jr = rels.getJSONObject(i8);
                        int uid = jr.getInt("id");
                        if (Utils.containsKey(relatives, uid)) {
                            String valueOf = String.valueOf(jr.getString(ServerKeys.TYPE));
                            char c = 65535;
                            switch (valueOf.hashCode()) {
                                case -995424086:
                                    if (valueOf.equals("parent")) {
                                        c = 4;
                                        break;
                                    }
                                    break;
                                case -268316490:
                                    if (valueOf.equals("grandparent")) {
                                        c = 1;
                                        break;
                                    }
                                    break;
                                case 94631196:
                                    if (valueOf.equals("child")) {
                                        c = 2;
                                        break;
                                    }
                                    break;
                                case 395180944:
                                    if (valueOf.equals("grandchild")) {
                                        c = 0;
                                        break;
                                    }
                                    break;
                                case 2083595970:
                                    if (valueOf.equals("sibling")) {
                                        c = 3;
                                        break;
                                    }
                                    break;
                            }
                            switch (c) {
                                case 0:
                                    grandchildren = Utils.addAndInitIfNeed(grandchildren, relatives.get(uid));
                                    continue;
                                case 1:
                                    grandparents = Utils.addAndInitIfNeed(grandparents, relatives.get(uid));
                                    continue;
                                case 2:
                                    children = Utils.addAndInitIfNeed(children, relatives.get(uid));
                                    continue;
                                case 3:
                                    siblings = Utils.addAndInitIfNeed(siblings, relatives.get(uid));
                                    continue;
                                case 4:
                                    parents = Utils.addAndInitIfNeed(parents, relatives.get(uid));
                                    continue;
                                default:
                                    continue;
                            }
                        }
                    }
                    ep.relativesParents = (UserProfile[]) Utils.arrayListToArray(parents, UserProfile.CREATOR);
                    ep.relativesSibling = (UserProfile[]) Utils.arrayListToArray(siblings, UserProfile.CREATOR);
                    ep.relativesChild = (UserProfile[]) Utils.arrayListToArray(children, UserProfile.CREATOR);
                    ep.relativesGrandparent = (UserProfile[]) Utils.arrayListToArray(grandparents, UserProfile.CREATOR);
                    ep.relativesGrandchild = (UserProfile[]) Utils.arrayListToArray(grandchildren, UserProfile.CREATOR);
                }
                if (o2.has("last_seen")) {
                    ep.lastSeen = o2.getJSONObject("last_seen").getInt("time");
                    int platform = o2.getJSONObject("last_seen").optInt(JsonMarshaller.PLATFORM);
                    ep.lastSeenMobile = platform == 1 || platform == 2 || platform == 3 || platform == 4 || platform == 5;
                }
                ep.deactivated = ExtendedUserProfile.Deactivated.parse(o2.optString("deactivated"));
                JSONObject gifts = o2.optJSONObject("gifts");
                if (gifts != null) {
                    ep.gifts = new VKList<>(gifts, GiftItem.class);
                }
                if (o2.has("friends")) {
                    JSONArray friends = o2.getJSONArray("friends");
                    ep.friends = new ArrayList<>();
                    for (int i9 = 0; i9 < friends.length(); i9++) {
                        ep.friends.add(new UserProfile(friends.getJSONObject(i9)));
                    }
                }
                if (o2.has("career")) {
                    ep.career = new ArrayList<>();
                    JSONArray career = o2.getJSONArray("career");
                    for (int i10 = 0; i10 < career.length(); i10++) {
                        JSONObject jc = career.getJSONObject(i10);
                        ExtendedUserProfile.Employer e = new ExtendedUserProfile.Employer();
                        if (jc.has("group")) {
                            e.group = new Group(jc.getJSONObject("group"));
                        } else {
                            e.title = jc.getString("company");
                        }
                        e.yearFrom = jc.optInt(ServerKeys.FROM);
                        e.yearTo = jc.optInt("until");
                        e.position = jc.optString("position");
                        if (jc.has("city_id")) {
                            e.city = cities.get(jc.getInt("city_id"));
                        }
                        ep.career.add(e);
                    }
                }
                if (o2.has("display_fields")) {
                    JSONArray df = o2.getJSONArray("display_fields");
                    ep.displayFields = new ArrayList<>();
                    for (int i11 = 0; i11 < df.length(); i11++) {
                        ep.displayFields.add(df.getString(i11));
                    }
                }
                ep.allPhotosAreHidden = o2.getBoolean("all_photos_are_hidden");
            } else {
                ep.profile.uid = this.uid;
                ep.profile.fullName = o2.getString("name");
                ep.profile.photo = o2.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                ep.bigPhoto = o2.optString("photo_200", o2.getString("photo_100"));
                ep.infoLine = o2.optString("activity");
                ep.activity = o2.getJSONObject("status").optString("text");
                ep.about = o2.optString("description");
                ep.eventStartTime = o2.optInt(FirebaseAnalytics.Param.START_DATE);
                ep.eventEndTime = o2.optInt(FirebaseAnalytics.Param.END_DATE);
                ep.website = o2.optString("site");
                ep.adminLevel = o2.optInt("admin_level");
                ep.verified = o2.optInt("verified") == 1;
                ep.canWrite = o2.optInt("can_message") == 1;
                ep.deactivated = ExtendedUserProfile.Deactivated.parse(o2.optString("deactivated"));
                if (o2.has("ban_info")) {
                    JSONObject ban = o2.getJSONObject("ban_info");
                    ep.ban = new ExtendedUserProfile.BanInfo();
                    ep.ban.comment = ban.optString("comment");
                    ep.ban.reason = ban.optInt("reason");
                    ep.ban.endTime = ban.optInt(FirebaseAnalytics.Param.END_DATE);
                }
                if (o2.has("invited_by")) {
                    ep.invitedBy = new UserProfile(o2.getJSONObject("invited_by"));
                }
                if (!o2.isNull("country_name") && !o2.isNull("city_name")) {
                    ArrayList<String> ss = new ArrayList<>();
                    if (o2.has("country_name")) {
                        ss.add(o2.getString("country_name"));
                    }
                    if (o2.has("city_name")) {
                        ss.add(0, o2.getString("city_name"));
                    }
                    if (o2.has("place")) {
                        JSONObject jp = o2.getJSONObject("place");
                        if (jp.has("address")) {
                            ss.add(0, jp.getString("address"));
                        }
                        ep.lat = jp.optDouble("latitude", -9000.0d);
                        ep.lon = jp.optDouble("longitude", -9000.0d);
                    } else {
                        ep.lon = -9000.0d;
                        ep.lat = -9000.0d;
                    }
                    ep.city = TextUtils.join(", ", ss);
                }
                ep.friendStatus = o2.optInt("is_member");
                ep.groupAccess = o2.getInt(ArgKeys.IS_CLOSED);
                ep.canSeeAllPosts = o2.optInt("can_see_all_posts") == 1;
                ep.friendStatus = o2.optInt("member_status", ep.friendStatus);
                if (ep.friendStatus == 3) {
                    ep.friendStatus = 0;
                }
                if ("group".equals(o2.getString(ServerKeys.TYPE))) {
                    ep.groupType = 0;
                }
                if ("event".equals(o2.getString(ServerKeys.TYPE))) {
                    ep.groupType = 1;
                }
                if ("page".equals(o2.getString(ServerKeys.TYPE))) {
                    ep.groupType = 2;
                }
                ep.canPost = o2.optInt("can_post") == 1;
                if (o2.has("wiki_page")) {
                    ep.mobilePhone = o2.getString("wiki_page");
                }
                if (o2.has("links")) {
                    JSONArray links = o2.getJSONArray("links");
                    ep.links = new ArrayList<>();
                    for (int i12 = 0; i12 < links.length(); i12++) {
                        JSONObject jl = links.getJSONObject(i12);
                        ExtendedUserProfile.Link l = new ExtendedUserProfile.Link();
                        l.url = jl.getString("url");
                        l.title = jl.getString("name");
                        if (l.title == null || l.title.length() == 0) {
                            l.title = l.url;
                        }
                        l.subtitle = jl.optString("desc", "");
                        l.photo = jl.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", null);
                        if (l.photo == null) {
                            int size = Global.displayDensity > 1.0f ? 100 : 50;
                            l.photo = l.url.contains("//vk.com/") ? "http://vk.com/images/lnkinner" + size + ".gif" : "http://vk.com/images/lnkouter" + size + ".gif";
                        }
                        ep.links.add(l);
                    }
                }
                if (o2.has("contacts")) {
                    ep.contacts = new ArrayList<>();
                    JSONArray users = o2.optJSONArray("contacts_profiles");
                    SparseArray<UserProfile> profiles = new SparseArray<>();
                    if (users != null) {
                        for (int i13 = 0; i13 < users.length(); i13++) {
                            UserProfile p2 = new UserProfile(users.getJSONObject(i13));
                            profiles.put(p2.uid, p2);
                        }
                    }
                    JSONArray contacts = o2.getJSONArray("contacts");
                    for (int i14 = 0; i14 < contacts.length(); i14++) {
                        JSONObject jc2 = contacts.getJSONObject(i14);
                        ExtendedUserProfile.Contact c2 = new ExtendedUserProfile.Contact();
                        c2.title = jc2.optString("desc", "");
                        if (jc2.has("user_id")) {
                            c2.user = profiles.get(jc2.getInt("user_id"));
                        }
                        c2.email = jc2.optString("email", null);
                        c2.phone = jc2.optString(SignupPhoneFragment.KEY_PHONE, null);
                        if (c2.user != null || c2.email != null || c2.phone != null) {
                            ep.contacts.add(c2);
                        }
                    }
                }
                if (o2.has("members")) {
                    JSONArray friends2 = o2.getJSONArray("members");
                    ep.friends = new ArrayList<>();
                    for (int i15 = 0; i15 < friends2.length(); i15++) {
                        ep.friends.add(new UserProfile(friends2.getJSONObject(i15)));
                    }
                }
                if (o2.has("main_album") && !o2.isNull("main_album")) {
                    ep.mainAlbum = new PhotoAlbum(o2.getJSONObject("main_album"));
                }
                ep.mainSection = o2.optInt("main_section");
                JSONObject widget = o2.optJSONObject("widget");
                if (widget != null && widget.optInt(ServerKeys.TYPE, -1) != -1) {
                    ep.widget = Widget.create(widget);
                }
            }
            if (o2.has("video_live") && !o2.isNull("video_live")) {
                JSONObject videoLive = o2.getJSONObject("video_live");
                if (this.uid < 0) {
                    ep.isLiveEnabled = videoLive.optInt("enabled", 0) != 0;
                } else {
                    ep.isLiveEnabled = videoLive.optInt("enabled", 0) != 0 && (ep.friendStatus == 3 || ep.friendStatus == 1);
                }
                ep.isLiveSubscribed = videoLive.optInt("is_notifications_blocked", 0) == 0;
            }
            ep.isHiddenFromFeed = o2.optInt("is_hidden_from_feed") == 1;
            ep.hasPhoto = o2.optInt("has_photo") == 1;
            ep.counters = new HashMap<>();
            JSONObject counters = o2.optJSONObject("counters");
            if (counters != null) {
                Iterator<String> keys = counters.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    ep.counters.put(k, Integer.valueOf(counters.getInt(k)));
                }
            }
            if (this.uid < 0) {
                ep.counters.put("members", Integer.valueOf(o2.optInt(ServerKeys.MEMBERS_COUNT)));
                ep.counters.put("friends_members", Integer.valueOf(o2.optInt("friends_members_count")));
            } else if (counters != null) {
                ep.counters.put("_subscriptions", ep.counters.get("subscriptions"));
                ep.counters.put("subscriptions", Integer.valueOf(counters.optInt("pages") + counters.optInt("subscriptions")));
            }
            ep.groups = new ArrayList<>();
            if (o2.has("groups") && o2.optJSONArray("groups") != null) {
                JSONArray jg = o2.getJSONArray("groups");
                for (int i16 = 0; i16 < jg.length(); i16++) {
                    ep.groups.add(new Group(jg.getJSONObject(i16)));
                }
            }
            ep.photos = new VKList<>();
            if (o2.has("photos") && o2.optJSONObject("photos") != null && (jphotos = APIUtils.unwrapArray(o2, "photos").array) != null) {
                for (int i17 = 0; i17 < jphotos.length(); i17++) {
                    ep.photos.add(new Photo(jphotos.getJSONObject(i17)));
                }
            }
            if (o2.has(ReportAppInputData.REPORT_TYPE_MARKET) && !o2.isNull(ReportAppInputData.REPORT_TYPE_MARKET)) {
                JSONObject market = o2.getJSONObject(ReportAppInputData.REPORT_TYPE_MARKET);
                if (market.has("wiki") && !market.isNull("wiki")) {
                    ep.marketWiki = new Wiki(market.getJSONObject("wiki"));
                }
                ep.marketMainAlbumId = market.optInt("main_album_id", -1);
            }
            ep.goods = new VKList<>();
            if (o2.has("goods") && o2.optJSONObject("goods") != null && (jgoods = APIUtils.unwrapArray(o2, "goods").array) != null) {
                for (int i18 = 0; i18 < jgoods.length(); i18++) {
                    ep.goods.add(new Good(jgoods.getJSONObject(i18)));
                }
            }
            ep.audios = new ArrayList<>();
            if (o2.optJSONArray("audios") != null) {
                JSONArray jaudios = o2.getJSONArray("audios");
                for (int i19 = 0; i19 < jaudios.length(); i19++) {
                    ep.audios.add(new MusicTrack(jaudios.getJSONObject(i19)));
                }
            }
            ep.playlists = new ArrayList<>();
            if (o2.optJSONArray("playlists") != null) {
                JSONArray jplaylists = o2.getJSONArray("playlists");
                for (int i20 = 0; i20 < jplaylists.length(); i20++) {
                    ep.playlists.add(new Playlist(jplaylists.getJSONObject(i20)));
                }
            }
            ep.videos = new ArrayList<>();
            if (o2.has("videos") && o2.optJSONArray("videos") != null) {
                JSONArray jaudios2 = o2.getJSONArray("videos");
                ArrayList<Integer> uids = new ArrayList<>();
                for (int i21 = 0; i21 < jaudios2.length(); i21++) {
                    VideoFile v = new VideoFile(jaudios2.getJSONObject(i21));
                    if (v.oid == ep.profile.uid) {
                        v.ownerName = ep.profile.fullName;
                        v.ownerPhoto = ep.profile.photo;
                    } else if (!uids.contains(Integer.valueOf(v.oid))) {
                        uids.add(Integer.valueOf(v.oid));
                    }
                    ep.videos.add(v);
                }
                if (uids.size() > 0) {
                    ArrayList<UserProfile> profiles2 = Friends.getUsersBlocking(uids);
                    SparseArray<UserProfile> p3 = new SparseArray<>();
                    Iterator<UserProfile> it = profiles2.iterator();
                    while (it.hasNext()) {
                        UserProfile u2 = it.next();
                        p3.put(u2.uid, u2);
                    }
                    Iterator<VideoFile> it2 = ep.videos.iterator();
                    while (it2.hasNext()) {
                        VideoFile v2 = it2.next();
                        if (Utils.containsKey(p3, v2.oid)) {
                            UserProfile u3 = p3.get(v2.oid);
                            v2.ownerName = u3.fullName;
                            v2.ownerPhoto = u3.photo;
                        }
                    }
                }
            }
            ep.docs = new ArrayList<>();
            if (o2.has("docs") && o2.optJSONArray("docs") != null) {
                JSONArray jdocs = o2.getJSONArray("docs");
                for (int i22 = 0; i22 < jdocs.length(); i22++) {
                    ep.docs.add(new Document(jdocs.getJSONObject(i22)));
                }
            }
            ep.topics = new ArrayList<>();
            if (o2.has("topics") && o2.optJSONArray("topics") != null) {
                JSONArray jtopics = o2.getJSONArray("topics");
                for (int i23 = 0; i23 < jtopics.length(); i23++) {
                    ep.topics.add(new BoardTopic(jtopics.getJSONObject(i23)));
                }
            }
            ep.subscriptions = new ArrayList<>();
            if (o2.has("subscriptions") && o2.optJSONArray("subscriptions") != null) {
                JSONArray jsubs = o2.getJSONArray("subscriptions");
                for (int i24 = 0; i24 < jsubs.length(); i24++) {
                    if (jsubs.getJSONObject(i24).getString(ServerKeys.TYPE).equals("profile")) {
                        ep.subscriptions.add(new UserProfile(jsubs.getJSONObject(i24)));
                    } else {
                        ep.subscriptions.add(new UserProfile(new Group(jsubs.getJSONObject(i24))));
                    }
                }
            }
            if (o2.getJSONObject("status").has(MimeTypes.BASE_TYPE_AUDIO)) {
                JSONObject jf = o2.getJSONObject("status").getJSONObject(MimeTypes.BASE_TYPE_AUDIO);
                MusicTrack file = new MusicTrack(jf);
                ep.audioStatus = file;
                ep.activity = file.artist + " - " + file.title;
            }
            if (o2.has("stories") && (getStoriesJson = o2.optJSONObject("stories")) != null) {
                ep.storiesResponse = new GetStoriesResponse(getStoriesJson);
            }
            Result res = new Result();
            res.profile = ep;
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
