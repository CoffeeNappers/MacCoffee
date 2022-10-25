package com.facebook.share.internal;

import android.os.Bundle;
import com.facebook.FacebookException;
import com.facebook.internal.Utility;
import com.facebook.share.model.AppGroupCreationContent;
import com.facebook.share.model.GameRequestContent;
import com.facebook.share.model.ShareLinkContent;
import com.facebook.share.model.ShareOpenGraphContent;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class WebDialogParameters {
    public static Bundle create(AppGroupCreationContent appGroupCreationContent) {
        Bundle webParams = new Bundle();
        Utility.putNonEmptyString(webParams, "name", appGroupCreationContent.getName());
        Utility.putNonEmptyString(webParams, "description", appGroupCreationContent.getDescription());
        AppGroupCreationContent.AppGroupPrivacy privacy = appGroupCreationContent.getAppGroupPrivacy();
        if (privacy != null) {
            Utility.putNonEmptyString(webParams, ShareConstants.WEB_DIALOG_PARAM_PRIVACY, privacy.toString().toLowerCase(Locale.ENGLISH));
        }
        return webParams;
    }

    public static Bundle create(GameRequestContent gameRequestContent) {
        Bundle webParams = new Bundle();
        Utility.putNonEmptyString(webParams, "message", gameRequestContent.getMessage());
        Utility.putNonEmptyString(webParams, "to", gameRequestContent.getTo());
        Utility.putNonEmptyString(webParams, "title", gameRequestContent.getTitle());
        Utility.putNonEmptyString(webParams, "data", gameRequestContent.getData());
        if (gameRequestContent.getActionType() != null) {
            Utility.putNonEmptyString(webParams, ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, gameRequestContent.getActionType().toString().toLowerCase(Locale.ENGLISH));
        }
        Utility.putNonEmptyString(webParams, "object_id", gameRequestContent.getObjectId());
        if (gameRequestContent.getFilters() != null) {
            Utility.putNonEmptyString(webParams, ShareConstants.WEB_DIALOG_PARAM_FILTERS, gameRequestContent.getFilters().toString().toLowerCase(Locale.ENGLISH));
        }
        Utility.putCommaSeparatedStringList(webParams, ShareConstants.WEB_DIALOG_PARAM_SUGGESTIONS, gameRequestContent.getSuggestions());
        return webParams;
    }

    public static Bundle create(ShareLinkContent shareLinkContent) {
        Bundle params = new Bundle();
        Utility.putUri(params, ShareConstants.WEB_DIALOG_PARAM_HREF, shareLinkContent.getContentUrl());
        return params;
    }

    public static Bundle create(ShareOpenGraphContent shareOpenGraphContent) {
        Bundle params = new Bundle();
        Utility.putNonEmptyString(params, ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, shareOpenGraphContent.getAction().getActionType());
        try {
            JSONObject ogJSON = ShareInternalUtility.removeNamespacesFromOGJsonObject(ShareInternalUtility.toJSONObjectForWeb(shareOpenGraphContent), false);
            if (ogJSON != null) {
                Utility.putNonEmptyString(params, ShareConstants.WEB_DIALOG_PARAM_ACTION_PROPERTIES, ogJSON.toString());
            }
            return params;
        } catch (JSONException e) {
            throw new FacebookException("Unable to serialize the ShareOpenGraphContent to JSON", e);
        }
    }

    public static Bundle createForFeed(ShareLinkContent shareLinkContent) {
        Bundle webParams = new Bundle();
        Utility.putNonEmptyString(webParams, "name", shareLinkContent.getContentTitle());
        Utility.putNonEmptyString(webParams, "description", shareLinkContent.getContentDescription());
        Utility.putNonEmptyString(webParams, "link", Utility.getUriString(shareLinkContent.getContentUrl()));
        Utility.putNonEmptyString(webParams, "picture", Utility.getUriString(shareLinkContent.getImageUrl()));
        return webParams;
    }

    public static Bundle createForFeed(ShareFeedContent shareFeedContent) {
        Bundle webParams = new Bundle();
        Utility.putNonEmptyString(webParams, "to", shareFeedContent.getToId());
        Utility.putNonEmptyString(webParams, "link", shareFeedContent.getLink());
        Utility.putNonEmptyString(webParams, "picture", shareFeedContent.getPicture());
        Utility.putNonEmptyString(webParams, ShareConstants.FEED_SOURCE_PARAM, shareFeedContent.getMediaSource());
        Utility.putNonEmptyString(webParams, "name", shareFeedContent.getLinkName());
        Utility.putNonEmptyString(webParams, ShareConstants.FEED_CAPTION_PARAM, shareFeedContent.getLinkCaption());
        Utility.putNonEmptyString(webParams, "description", shareFeedContent.getLinkDescription());
        return webParams;
    }
}
