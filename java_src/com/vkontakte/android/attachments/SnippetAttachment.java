package com.vkontakte.android.attachments;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vk.imageloader.view.VKSnippetImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ButtonAction;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.fragments.WikiViewFragment;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.ui.RatingView;
import com.vkontakte.android.utils.AdsUtil;
import com.vkontakte.android.utils.LinkUtils;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SnippetAttachment extends Attachment implements ImageAttachment, View.OnClickListener {
    public static final Serializer.Creator<SnippetAttachment> CREATOR = new Serializer.CreatorAdapter<SnippetAttachment>() { // from class: com.vkontakte.android.attachments.SnippetAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public SnippetAttachment mo1087createFromSerializer(Serializer is) {
            boolean z = true;
            Photo photo = (Photo) is.readSerializable(Photo.class.getClassLoader());
            String readString = is.readString();
            String readString2 = is.readString();
            String readString3 = is.readString();
            String readString4 = is.readString();
            String readString5 = is.readString();
            if (is.readInt() != 1) {
                z = false;
            }
            return new SnippetAttachment(readString, readString2, readString3, readString4, readString5, photo, z, is.readString(), is.readString(), is.readFloat(), is.readInt(), is.readString(), (ButtonAction) is.readSerializable(ButtonAction.class.getClassLoader()));
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public SnippetAttachment[] mo1088newArray(int size) {
            return new SnippetAttachment[size];
        }
    };
    private String button;
    private ButtonAction buttonAction;
    private String buttonLink;
    public boolean forceSmall = false;
    private boolean isBig;
    private boolean isProduct;
    private int lastPhotoWidth;
    public String link;
    public Photo photo;
    @Nullable
    private transient PostInteract postInteract;
    public String previewPage;
    private float rating;
    public String referWiki;
    private int reviewCount;
    private String subsubtitle;
    private String subtitle;
    public String target;
    public String title;

    public void setReferData(@Nullable PostInteract postInteract) {
        this.postInteract = postInteract;
    }

    public SnippetAttachment(String title, String subtitle, String subsubtitle, String link, String target, Photo photo, boolean isProduct, String button, String buttonLink, float rating, int reviewCount, String previewPage, ButtonAction buttonAction) {
        this.title = title;
        this.subtitle = subtitle;
        this.subsubtitle = subsubtitle;
        this.photo = photo;
        this.link = link;
        this.target = target;
        this.isProduct = isProduct;
        this.button = button;
        this.buttonLink = buttonLink;
        this.rating = rating;
        this.reviewCount = reviewCount;
        this.previewPage = previewPage;
        if (TextUtils.isEmpty(subsubtitle)) {
            this.subsubtitle = Uri.parse(link).getAuthority();
        }
        if (TextUtils.isEmpty(title)) {
            this.title = link;
        }
        if (buttonAction != null && buttonAction.isValidAction()) {
            this.buttonAction = buttonAction;
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    private RelativeLayout.LayoutParams removeRelLayoutRules(RelativeLayout.LayoutParams params, int ruleToRemove) {
        if (Build.VERSION.SDK_INT >= 17) {
            params.removeRule(ruleToRemove);
            return params;
        }
        int[] rules = params.getRules();
        RelativeLayout.LayoutParams res = new RelativeLayout.LayoutParams(params.width, params.height);
        for (int i = 0; i < rules.length; i++) {
            if (rules[i] != 0 && ruleToRemove != i) {
                res.addRule(i, rules[i]);
            }
        }
        return res;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v;
        RelativeLayout.LayoutParams l;
        boolean isMessagesSnippet = ViewUtils.getBoolFromTheme(context, R.attr.is_messages_snippet);
        if (!isMessagesSnippet && !this.forceSmall && this.photo.getImage('l', 'x') != null && this.photo.getImage('l', 'x').width >= 537 && this.photo.getImage('l', 'x').height >= 240) {
            this.isBig = true;
            v = View.inflate(context, R.layout.attach_snippet_big, null);
            FlowLayout.LayoutParams lp = new FlowLayout.LayoutParams();
            Photo.Image img = this.photo.getImage('l', 'x');
            lp.width = NewsEntry.getMaxThumbsWidth() - (context.getResources().getDimensionPixelOffset(R.dimen.post_side_padding_btn) * 2);
            int imgScaledHeight = Math.round((lp.width - (V.dp(8.0f) * 2)) * (img.height / img.width));
            lp.height = -2;
            lp.center = true;
            v.setLayoutParams(lp);
            v.findViewById(R.id.snippet_image).setLayoutParams(new FrameLayout.LayoutParams(-1, imgScaledHeight));
            ((TextView) v.findViewById(R.id.attach_title)).setMaxLines(2);
            float tw = ((TextView) v.findViewById(R.id.attach_title)).getPaint().measureText(this.title);
            if (tw > lp.width - (V.dp(12.0f) * 2) && !this.isProduct) {
                v.findViewById(R.id.attach_subtitle).setVisibility(8);
            } else {
                v.findViewById(R.id.attach_subtitle).setVisibility(TextUtils.isEmpty(this.subtitle) ? 8 : 0);
            }
            this.lastPhotoWidth = lp.width - (V.dp(8.0f) * 2);
            if (!TextUtils.isEmpty(this.button)) {
                View btn = v.findViewById(R.id.attach_button);
                RelativeLayout.LayoutParams l2 = (RelativeLayout.LayoutParams) btn.getLayoutParams();
                RelativeLayout.LayoutParams l22 = (RelativeLayout.LayoutParams) v.findViewById(R.id.attach_title).getLayoutParams();
                if (this.isProduct) {
                    l = removeRelLayoutRules(l2, 15);
                    l.addRule(8, R.id.attach_subsubtitle);
                    l22 = removeRelLayoutRules(l22, 0);
                } else {
                    l = removeRelLayoutRules(l2, 8);
                    l.addRule(15);
                    l22.addRule(0, R.id.attach_button);
                }
                btn.setLayoutParams(l);
                v.findViewById(R.id.attach_title).setLayoutParams(l22);
            }
        } else {
            v = View.inflate(context, isMessagesSnippet ? R.layout.attach_snippet_small_messages : R.layout.attach_snippet_small, null);
            if (this.forceSmall) {
                v.setPadding(0, 0, 0, 0);
            }
            if (isMessagesSnippet) {
                v.findViewById(R.id.video_single_info).setMinimumHeight(V.dp(80.0f));
                v.setPadding(0, 0, 0, 0);
                VKSnippetImageView imageView = (VKSnippetImageView) v.findViewById(R.id.snippet_image);
                imageView.setBorderColor(0);
                imageView.setBorderWidth(0.0f);
                imageView.setType(2);
                imageView.setPlaceholderImage(R.drawable.attach_snippet_small_message_placeholder);
            }
            FlowLayout.LayoutParams lp2 = new FlowLayout.LayoutParams();
            lp2.width = -1;
            lp2.height = -2;
            lp2.center = true;
            v.setLayoutParams(lp2);
            this.lastPhotoWidth = V.dp(isMessagesSnippet ? 80.0f : 114.0f);
            v.findViewById(R.id.attach_subtitle).setVisibility(TextUtils.isEmpty(this.subtitle) ? 8 : 0);
        }
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(this.subtitle);
        ((TextView) v.findViewById(R.id.attach_subsubtitle)).setText(this.subsubtitle);
        if (TextUtils.isEmpty(this.button)) {
            v.findViewById(R.id.attach_button).setVisibility(8);
        } else {
            v.findViewById(R.id.attach_button).setVisibility(0);
            ((TextView) v.findViewById(R.id.attach_button)).setText(this.button);
        }
        v.setOnClickListener(this);
        v.findViewById(R.id.attach_button).setOnClickListener(this);
        if (this.rating > 0.0f) {
            v.findViewById(R.id.attach_rating).setVisibility(0);
            ((RatingView) v.findViewById(R.id.attach_rating)).setRating(this.rating);
            v.findViewById(R.id.attach_review_count).setVisibility(0);
            ((TextView) v.findViewById(R.id.attach_review_count)).setText("(" + Global.formatBigNumber(this.reviewCount) + ")");
        } else {
            v.findViewById(R.id.attach_rating).setVisibility(8);
            v.findViewById(R.id.attach_review_count).setVisibility(8);
        }
        return v;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (this.previewPage != null && this.previewPage.length() > 0 && v.getId() != R.id.attach_button) {
            String[] sp = this.previewPage.split(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR);
            new WikiViewFragment.Builder().setOid(Integer.parseInt(sp[0])).setPid(Integer.parseInt(sp[1])).setRefer(this.referWiki).setSite(true).go(v.getContext());
        } else if (v.getId() == R.id.attach_button) {
            if (this.postInteract != null) {
                this.postInteract.setLink(this.link).sendNow(PostInteract.Type.snippet_button_action);
            }
            if (this.buttonAction != null) {
                AdsUtil.onActionButtonClick(v.getContext(), this.buttonAction, this.postInteract);
            } else if (!TextUtils.isEmpty(this.buttonLink)) {
                LinkUtils.processLink(v.getContext(), this.buttonLink, this.target);
            }
        } else {
            if (this.postInteract != null) {
                this.postInteract.setLink(this.link).sendNow(PostInteract.Type.snippet_action);
            }
            LinkUtils.processLink(v.getContext(), this.link, this.target);
        }
    }

    public boolean isStory() {
        if (!TextUtils.isEmpty(this.link)) {
            return this.link.startsWith("https://vk.com/story");
        }
        return false;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.photo);
        s.writeString(this.title);
        s.writeString(this.subtitle);
        s.writeString(this.subsubtitle);
        s.writeString(this.link);
        s.writeString(this.target);
        s.writeInt(this.isProduct ? 1 : 0);
        s.writeString(this.button);
        s.writeString(this.buttonLink);
        s.writeFloat(this.rating);
        s.writeInt(this.reviewCount);
        s.writeString(this.previewPage);
        s.writeSerializable(this.buttonAction);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        int diff;
        Photo.Image closest = this.photo.sizes.get(0);
        int closestDiff = Integer.MAX_VALUE;
        Iterator<Photo.Image> it = this.photo.sizes.iterator();
        while (it.hasNext()) {
            Photo.Image img = it.next();
            if (img.width <= 604 && (diff = Math.abs(this.lastPhotoWidth - img.width)) < closestDiff) {
                closestDiff = diff;
                closest = img;
            }
        }
        return closest.url;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        VKSnippetImageView imageView = (VKSnippetImageView) view.findViewById(R.id.snippet_image);
        if (ViewUtils.getBoolFromTheme(view.getContext(), R.attr.is_messages_snippet)) {
            imageView.setType(2);
            imageView.setPlaceholderImage(R.drawable.attach_snippet_small_message_placeholder);
        } else {
            imageView.setType(this.isBig ? 1 : 0);
            imageView.setPlaceholderImage(this.isBig ? R.drawable.placeholder_snippet_big : R.drawable.placeholder_snippet_medium);
        }
        imageView.load(getImageURL());
    }
}
