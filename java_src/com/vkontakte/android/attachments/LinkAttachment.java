package com.vkontakte.android.attachments;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.core.network.Network;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.fragments.WikiViewFragment;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes2.dex */
public class LinkAttachment extends Attachment implements View.OnClickListener, View.OnLongClickListener {
    public static final Serializer.Creator<LinkAttachment> CREATOR = new Serializer.CreatorAdapter<LinkAttachment>() { // from class: com.vkontakte.android.attachments.LinkAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public LinkAttachment mo1087createFromSerializer(Serializer in) {
            return new LinkAttachment(in.readString(), in.readString(), in.readString());
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public LinkAttachment[] mo1088newArray(int size) {
            return new LinkAttachment[size];
        }
    };
    private NewsEntry post;
    @Nullable
    private transient PostInteract postInteract;
    public String previewPage;
    public String referWiki;
    public String title;
    public String url;

    public LinkAttachment(String _url, String _title, String preview) {
        this.url = _url;
        this.title = _title;
        this.previewPage = preview;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.url);
        s.writeString(this.title);
        s.writeString(this.previewPage);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (!Network.getInstance().proxy().isEnable() && this.previewPage != null && this.previewPage.length() > 0) {
            String[] sp = this.previewPage.split(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR);
            new WikiViewFragment.Builder().setOid(Integer.parseInt(sp[0])).setPid(Integer.parseInt(sp[1])).setRefer(this.referWiki).setSite(true).go(v.getContext());
        } else {
            v.getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + this.url)));
        }
        if (this.postInteract != null) {
            this.postInteract.sendNow(PostInteract.Type.attached_link_click, this.url);
        }
        if (this.post != null) {
            Analytics.sendPromoPostActionByType(this.post, Statistic.TYPE_POST_LINK);
        }
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        if (this.previewPage == null || this.previewPage.length() <= 0) {
            return false;
        }
        v.getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + this.url)));
        if (this.postInteract != null) {
            this.postInteract.sendNow(PostInteract.Type.link_click, this.url);
        }
        return true;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v = reuse == null ? getReusableView(context, "common") : reuse;
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(ViewUtils.getResFromTheme(context, R.attr.ic_attach_link));
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title.length() > 0 ? this.title : context.getResources().getString(R.string.attach_link));
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(Uri.parse(this.url).getAuthority());
        v.setOnClickListener(this);
        v.setOnLongClickListener(this);
        return v;
    }

    public String toString() {
        return (this.url.startsWith("http:") || this.url.startsWith("https:")) ? this.url : "http://" + this.url;
    }

    public void setReferrer(NewsEntry e, PostInteract postInteract) {
        this.post = e;
        this.postInteract = postInteract;
    }
}
