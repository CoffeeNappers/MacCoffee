package com.vkontakte.android.api.account;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AccountSetInfo extends ResultlessAPIRequest {
    public AccountSetInfo() {
        super("account.setInfo");
    }

    public AccountSetInfo setCommunityComments(boolean communityComments) {
        param("name", "community_comments");
        param("value", communityComments ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        return this;
    }

    public AccountSetInfo setMusicIntro(boolean musicIntro) {
        param("name", "music_intro");
        param("value", musicIntro ? 1 : 0);
        return this;
    }

    public AccountSetInfo(int flags) {
        super("account.setInfo");
        param("intro", flags);
        param("v", "5.46");
    }

    public AccountSetInfo(boolean ownPostsDefault, boolean noWallReplies) {
        super("account.setInfo");
        param("own_posts_default", ownPostsDefault ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param("no_wall_replies", noWallReplies ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param("v", "5.46");
    }
}
