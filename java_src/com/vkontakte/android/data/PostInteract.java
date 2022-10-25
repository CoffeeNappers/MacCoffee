package com.vkontakte.android.data;

import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.List;
/* loaded from: classes2.dex */
public class PostInteract extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<PostInteract> CREATOR = new Serializer.CreatorAdapter<PostInteract>() { // from class: com.vkontakte.android.data.PostInteract.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PostInteract mo1087createFromSerializer(Serializer in) {
            return new PostInteract(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PostInteract[] mo1088newArray(int size) {
            return new PostInteract[size];
        }
    };
    public String adData;
    private List<StatisticUrl> adsClickUrls;
    private String cardData;
    private String link;
    private final String postIdStr;
    public final String refer;
    private String trackCode;

    /* loaded from: classes2.dex */
    public enum Type {
        hide,
        report,
        expand,
        open,
        open_user,
        open_group,
        link_click,
        audio_start,
        open_photo,
        video_start,
        snippet_button_action,
        snippet_action,
        attached_link_click,
        click_pretty_card
    }

    public String getPostIdStr() {
        return this.postIdStr;
    }

    public PostInteract(String refer, NewsEntry entry) {
        this(refer, entry, entry.getShitAttachment());
    }

    public PostInteract(String refer, NewsEntry entry, ShitAttachment shitAttachment) {
        this.refer = refer;
        this.postIdStr = entry.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + entry.postID;
        this.trackCode = entry.getTrackCode();
        if (shitAttachment != null) {
            this.adData = shitAttachment.data;
            this.adsClickUrls = shitAttachment.getStatisticByType(Statistic.TYPE_POST_LINK);
        }
    }

    public PostInteract setLink(String link) {
        this.link = link;
        return this;
    }

    public PostInteract setCardData(String cardData) {
        this.cardData = cardData;
        return this;
    }

    public void setClickPostLinks(List<StatisticUrl> adsClickUrls) {
        this.adsClickUrls = adsClickUrls;
    }

    private void send(Type type, String link, boolean immediately) {
        L.d(type, this.refer, this.postIdStr);
        if (!TextUtils.isEmpty(this.refer)) {
            Analytics.EventBuilder eventBuilder = Analytics.track("post_interaction").addParam(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, this.postIdStr).addParam(NativeProtocol.WEB_DIALOG_ACTION, type.name()).addParam("ref", this.refer);
            if (!TextUtils.isEmpty(this.trackCode)) {
                eventBuilder.addParam("track_code", this.trackCode);
            }
            if (!TextUtils.isEmpty(link)) {
                eventBuilder.addParam("link", link);
            }
            if (!TextUtils.isEmpty(this.adData)) {
                eventBuilder.addParam("ad_data", this.adData);
            }
            if (!TextUtils.isEmpty(this.cardData)) {
                eventBuilder.addParam("card_data", this.cardData);
            }
            if (immediately) {
                eventBuilder.sendNow();
            } else {
                eventBuilder.commit();
            }
        }
    }

    public void commit(Type type) {
        send(type, this.link, false);
        if (type == Type.link_click && this.adsClickUrls != null) {
            Analytics.sendPromoAction(this.adsClickUrls);
        }
    }

    public void sendNow(Type type, String link) {
        send(type, link, true);
        if (type == Type.link_click && this.adsClickUrls != null) {
            Analytics.sendPromoAction(this.adsClickUrls);
        }
    }

    public void sendNow(Type type) {
        sendNow(type, this.link);
    }

    public PostInteract(Serializer s) {
        this.refer = s.readString();
        this.postIdStr = s.readString();
        this.adsClickUrls = s.createTypedArrayList(StatisticUrl.CREATOR);
        this.adData = s.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.refer);
        s.writeString(this.postIdStr);
        s.writeTypedList(this.adsClickUrls);
        s.writeString(this.adData);
    }
}
