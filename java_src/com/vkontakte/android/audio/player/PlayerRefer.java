package com.vkontakte.android.audio.player;

import android.text.TextUtils;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
/* loaded from: classes.dex */
public class PlayerRefer implements MediaPlayerHelperI.Refer {
    private static final int CAT_FEED = 105;
    private static final int CAT_GROUP_LIST = 103;
    private static final int CAT_IM = 106;
    private static final int CAT_MY = 101;
    private static final int CAT_OTHER = 114;
    private static final int CAT_RECOMMENDS = 107;
    private static final int CAT_SEARCH = 110;
    private static final int CAT_USER_LIST = 102;
    private static final int CAT_WALL_STATUS_REPLIES = 104;
    private static final String REF_SEARCH = "search";
    private static final String REF_STATUS = "status";
    private static final String VK_CAT_GLOBAL_SEARCH = "global_search";
    private static final String VK_CAT_OTHER = "other";
    private final int cat;
    private final String extStr;
    private final String str;
    public static final PlayerRefer none = $(null, 114, "other");
    private static final String VK_CAT_USER_STATUS = "user_status";
    public static final PlayerRefer status_user = $("status", 104, VK_CAT_USER_STATUS);
    private static final String VK_CAT_GROUP_STATUS = "group_status";
    public static final PlayerRefer status_group = $("status", 104, VK_CAT_GROUP_STATUS);
    public static final PlayerRefer search = $("search", 110, "global_search");
    private static final String REF_MESSAGES = "messages";
    private static final String VK_CAT_IM = "im";
    public static final PlayerRefer im = $(REF_MESSAGES, 106, VK_CAT_IM);
    private static final String REF_AUDIOS_USER = "audios_user";
    private static final String VK_CAT_USER_LIST = "user_list";
    public static final PlayerRefer audios_user = $(REF_AUDIOS_USER, 102, VK_CAT_USER_LIST);
    private static final String REF_AUDIOS_GROUP = "audios_group";
    private static final String VK_CAT_GROUP_LIST = "group_list";
    public static final PlayerRefer audios_group = $(REF_AUDIOS_GROUP, 103, VK_CAT_GROUP_LIST);
    private static final String VK_CAT_MY = "my";
    public static final PlayerRefer audios_my = $(REF_AUDIOS_USER, 101, VK_CAT_MY);
    private static final String VK_CAT_RECS = "recs";
    public static final PlayerRefer recommendation_user = $(REF_AUDIOS_USER, 107, VK_CAT_RECS);
    public static final PlayerRefer recommendation_group = $(REF_AUDIOS_GROUP, 107, VK_CAT_RECS);
    private static final String REF_NEWS = "news";
    private static final String VK_CAT_FEED = "feed";
    public static final PlayerRefer news = $(REF_NEWS, 105, VK_CAT_FEED);
    private static final String REF_WALL_USER = "wall_user";
    private static final String VK_CAT_USER_WALL = "user_wall";
    public static final PlayerRefer wall_user = $(REF_WALL_USER, 104, VK_CAT_USER_WALL);
    private static final String REF_WALL_GROUP = "wall_group";
    private static final String VK_CAT_GROUP_WALL = "group_wall";
    public static final PlayerRefer wall_group = $(REF_WALL_GROUP, 104, VK_CAT_GROUP_WALL);
    private static final String REF_COMMENTS = "comments";
    private static final String VK_CAT_REPLIES = "replies";
    public static final PlayerRefer comments = $(REF_COMMENTS, 104, VK_CAT_REPLIES);

    private static PlayerRefer $(String str, int cat, String extStr) {
        return new PlayerRefer(str, cat, extStr);
    }

    private PlayerRefer(String str, int cat, String extStr) {
        this.str = str;
        this.cat = cat;
        this.extStr = extStr;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.Refer
    public int getInt() {
        return this.cat;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.Refer
    public String getStr() {
        return this.str;
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.Refer
    public String getExtStr() {
        return this.extStr;
    }

    public static PlayerRefer parse(String s) {
        String valueOf = String.valueOf(s);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -2010190902:
                if (valueOf.equals(REF_WALL_GROUP)) {
                    c = 3;
                    break;
                }
                break;
            case -602415628:
                if (valueOf.equals(REF_COMMENTS)) {
                    c = 4;
                    break;
                }
                break;
            case -462094004:
                if (valueOf.equals(REF_MESSAGES)) {
                    c = 0;
                    break;
                }
                break;
            case 3377875:
                if (valueOf.equals(REF_NEWS)) {
                    c = 1;
                    break;
                }
                break;
            case 1459593504:
                if (valueOf.equals(REF_WALL_USER)) {
                    c = 2;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return im;
            case 1:
                return news;
            case 2:
                return wall_user;
            case 3:
                return wall_group;
            case 4:
                return comments;
            default:
                return new PlayerRefer(s, 114, "other");
        }
    }

    public static PlayerRefer parseRecommended(String s) {
        return TextUtils.isEmpty(s) ? none : $(s, 107, VK_CAT_RECS);
    }
}
