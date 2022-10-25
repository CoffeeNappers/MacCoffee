package com.vkontakte.android.attachments;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKSnippetImageView;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class MarketAttachment extends Attachment implements ImageAttachment {
    public final boolean canEdit;
    @NonNull
    public final Good good;
    private static GoodFragment.Builder.Source lastSource = GoodFragment.Builder.Source.link;
    public static final Serializer.Creator<MarketAttachment> CREATOR = new Serializer.CreatorAdapter<MarketAttachment>() { // from class: com.vkontakte.android.attachments.MarketAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public MarketAttachment mo1087createFromSerializer(Serializer s) {
            Good good = (Good) s.readSerializable(Good.class.getClassLoader());
            if (good == null) {
                return null;
            }
            return new MarketAttachment(good, s.readByte() != 0);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public MarketAttachment[] mo1088newArray(int size) {
            return new MarketAttachment[size];
        }
    };

    public static void setLastSource(@NonNull GoodFragment.Builder.Source source) {
        lastSource = source;
    }

    public MarketAttachment(@NonNull Good good) {
        this(good, true);
    }

    public MarketAttachment(@NonNull Good good, boolean canEdit) {
        this.good = good;
        this.canEdit = canEdit;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v;
        boolean isMessagesSnippet = ViewUtils.getBoolFromTheme(context, R.attr.is_messages_snippet);
        if (reuse == null) {
            v = View.inflate(context, isMessagesSnippet ? R.layout.attach_snippet_small_messages : R.layout.attach_snippet_small, null);
        } else {
            v = reuse;
        }
        v.setPadding(0, 0, 0, 0);
        v.findViewById(R.id.video_single_info).setMinimumHeight(isMessagesSnippet ? V.dp(80.0f) : V.dp(114.0f));
        FlowLayout.LayoutParams lp = new FlowLayout.LayoutParams();
        lp.width = -1;
        lp.height = -2;
        lp.center = true;
        v.setLayoutParams(lp);
        v.findViewById(R.id.attach_subtitle).setVisibility(TextUtils.isEmpty(this.good.price_text) ? 8 : 0);
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.good.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(this.good.price_text);
        ((TextView) v.findViewById(R.id.attach_subsubtitle)).setText(R.string.good);
        v.findViewById(R.id.attach_button).setVisibility(8);
        View.OnClickListener l = MarketAttachment$$Lambda$1.lambdaFactory$(this, v);
        v.setOnClickListener(l);
        v.findViewById(R.id.attach_button).setOnClickListener(l);
        v.findViewById(R.id.attach_rating).setVisibility(8);
        v.findViewById(R.id.attach_review_count).setVisibility(8);
        return v;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v, View v1) {
        new GoodFragment.Builder(lastSource, this.good.owner_id, this.good.id).go(v.getContext());
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.good);
        s.writeByte(this.canEdit ? (byte) 1 : (byte) 0);
    }

    public String toString() {
        return ReportAppInputData.REPORT_TYPE_MARKET + this.good.owner_id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.good.id;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return this.good.thumb_photo;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        VKSnippetImageView imageView = (VKSnippetImageView) view.findViewById(R.id.snippet_image);
        if (ViewUtils.getBoolFromTheme(view.getContext(), R.attr.is_messages_snippet)) {
            imageView.setType(2);
            imageView.setPlaceholderImage(R.drawable.attach_snippet_small_message_placeholder);
        } else {
            imageView.setType(0);
            imageView.setPlaceholderImage(R.drawable.placeholder_snippet_medium);
        }
        imageView.load(getImageURL());
    }
}
