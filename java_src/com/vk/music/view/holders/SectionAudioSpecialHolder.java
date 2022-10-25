package com.vk.music.view.holders;

import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vk.music.dto.Section;
import com.vk.music.model.RecommendedModel;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SectionAudioSpecialHolder extends RecyclerHolder<Section> {
    private TextView subtitle;
    private final ArrayList<HolderThumps> thumpHolders;
    private TextView title;

    public SectionAudioSpecialHolder(ViewGroup parent, @NonNull RecommendedModel recommendedModel) {
        super(createView(parent));
        this.thumpHolders = new ArrayList<>();
        int verMargin = getResources().getDimensionPixelSize(R.dimen.music_section_special2_thumps_margin_ver);
        int horMargin = getResources().getDimensionPixelSize(R.dimen.music_section_special2_thumps_margin_hor);
        addThumbs(R.layout.music_section_special2_thumbs1, 85, horMargin, verMargin);
        addThumbs(R.layout.music_section_special2_thumbs2, 51, horMargin, verMargin);
        HolderBlock holderBlock = new HolderBlock((ViewGroup) this.itemView, recommendedModel);
        ((ViewGroup) this.itemView).addView(holderBlock.itemView, holderBlock.getLayoutParams());
        this.title = (TextView) $(16908308);
        this.subtitle = (TextView) $(16908309);
    }

    private void addThumbs(@LayoutRes int layout, int gravity, int horMargin, int verMargin) {
        HolderThumps holder = new HolderThumps(layout, (ViewGroup) this.itemView);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2);
        lp.topMargin = verMargin;
        lp.leftMargin = horMargin;
        lp.bottomMargin = verMargin;
        lp.rightMargin = horMargin;
        lp.gravity = gravity;
        ((FrameLayout) this.itemView).addView(holder.itemView, lp);
        this.thumpHolders.add(holder);
    }

    private static FrameLayout createView(@NonNull ViewGroup parent) {
        final int DP_320 = V.dp(320.0f);
        final int DP_420 = V.dp(420.0f);
        final int DP_480 = V.dp(480.0f);
        final int DP_640 = V.dp(640.0f);
        final int DP_14 = V.dp(14.0f);
        final int DP_34 = V.dp(34.0f);
        final int DP_74 = V.dp(74.0f);
        final int DP_20 = V.dp(20.0f);
        final int thumbsSize = parent.getResources().getDimensionPixelSize(R.dimen.music_section_special2_thumps_width);
        FrameLayout layout = new FrameLayout(parent.getContext()) { // from class: com.vk.music.view.holders.SectionAudioSpecialHolder.1
            @Override // android.widget.FrameLayout, android.view.View
            protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                int w = View.MeasureSpec.getSize(widthMeasureSpec);
                HolderBlock holderBlock = null;
                int gravity = 0;
                int dx = 0;
                boolean isOneThumbs = true;
                for (int i = 0; i < getChildCount(); i++) {
                    View view = getChildAt(i);
                    if (view.getId() == R.id.special_block) {
                        holderBlock = (HolderBlock) view.getTag();
                    } else {
                        if (w < DP_320) {
                            isOneThumbs = true;
                            dx = DP_14;
                            gravity = 3;
                        } else if (DP_320 <= w && w < DP_420) {
                            isOneThumbs = true;
                            dx = SectionAudioSpecialHolder.normalize(DP_320, DP_420, DP_14, DP_34, w);
                            gravity = 3;
                        } else if (DP_420 <= w && w < DP_480) {
                            isOneThumbs = true;
                            dx = DP_74;
                            gravity = 3;
                        } else if (DP_480 <= w && w < DP_640) {
                            isOneThumbs = false;
                            dx = SectionAudioSpecialHolder.normalize(DP_480, DP_640, 0, DP_20, w);
                            gravity = 1;
                        } else {
                            isOneThumbs = false;
                            dx = DP_20;
                            gravity = 1;
                        }
                        boolean isLeft = (((FrameLayout.LayoutParams) view.getLayoutParams()).gravity & 3) == 3;
                        view.setTranslationX(isLeft ? isOneThumbs ? -thumbsSize : dx : -dx);
                    }
                }
                if (holderBlock != null) {
                    holderBlock.setParams(gravity, dx, isOneThumbs);
                }
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            }
        };
        layout.setBackgroundResource(R.drawable.music_section_special2_bg);
        layout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        layout.setMinimumHeight(V.dp(176.0f));
        layout.setClipToPadding(false);
        return layout;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int normalize(int inputMin, int inputMax, int outputMin, int outputMax, float input) {
        return ((int) (((outputMax - outputMin) * (input - inputMin)) / (inputMax - inputMin))) + outputMin;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Section item) {
        VKImageView[] vKImageViewArr;
        if (item.thumbs != null) {
            int DP_72 = V.dp(72.0f);
            int currentImage = 0;
            Iterator<HolderThumps> it = this.thumpHolders.iterator();
            while (it.hasNext()) {
                HolderThumps holder = it.next();
                for (VKImageView imageView : holder.imageViews) {
                    String url = item.thumbs.size() > currentImage ? item.thumbs.get(currentImage).getForSize(DP_72) : null;
                    if (!TextUtils.isEmpty(url)) {
                        imageView.load(url);
                    } else {
                        imageView.clear();
                    }
                    currentImage++;
                }
            }
        }
        ViewUtils.setText(this.title, item.title);
        ViewUtils.setText(this.subtitle, item.subtitle, true);
    }

    /* loaded from: classes2.dex */
    private class HolderBlock implements View.OnClickListener {
        final int DP_24;
        final int DP_360;
        final int borderMaxStart;
        final int borderMiddleStart;
        final int borderMinStart;
        final LinearLayout itemView;
        final RecommendedModel recommendedModel;
        final TextView subtitle;
        final TextView title;

        HolderBlock(@NonNull ViewGroup parent, RecommendedModel recommendedModel) {
            this.itemView = (LinearLayout) LayoutInflater.from(parent.getContext()).inflate(R.layout.music_section_special2_block, parent, false);
            this.title = (TextView) this.itemView.findViewById(16908308);
            this.subtitle = (TextView) this.itemView.findViewById(16908309);
            this.itemView.findViewById(16908313).setOnClickListener(this);
            this.recommendedModel = recommendedModel;
            this.borderMinStart = V.dp(22.0f);
            this.borderMiddleStart = V.dp(66.0f);
            this.borderMaxStart = V.dp(110.0f);
            this.DP_24 = V.dp(24.0f);
            this.DP_360 = V.dp(360.0f);
            this.itemView.setTag(this);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            this.recommendedModel.playSection(SectionAudioSpecialHolder.this.getItem(), null);
        }

        FrameLayout.LayoutParams getLayoutParams() {
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2);
            lp.gravity = 16;
            return lp;
        }

        void setParams(int gravity, int dx, boolean isOneThumbs) {
            this.itemView.setGravity(gravity);
            this.title.setGravity(gravity);
            this.subtitle.setGravity(gravity);
            if (isOneThumbs) {
                this.itemView.setPadding(this.DP_24, this.itemView.getPaddingTop(), 0, this.itemView.getPaddingBottom());
                int padTitle = this.borderMinStart + dx + this.DP_24;
                this.title.setPadding(0, this.title.getPaddingTop(), padTitle, this.title.getPaddingBottom());
                this.title.setMaxWidth(this.DP_360 + padTitle);
                int padSubtitle = this.borderMiddleStart + dx + this.DP_24;
                this.subtitle.setPadding(0, this.subtitle.getPaddingTop(), padSubtitle, this.subtitle.getPaddingBottom());
                this.title.setMaxWidth(this.DP_360 + padSubtitle);
                return;
            }
            this.itemView.setPadding(0, this.itemView.getPaddingTop(), 0, this.itemView.getPaddingBottom());
            int pad = this.borderMaxStart + dx + this.DP_24;
            this.title.setPadding(pad, this.title.getPaddingTop(), pad, this.title.getPaddingBottom());
            this.title.setMaxWidth(this.DP_360 + (pad * 2));
            this.subtitle.setPadding(pad, this.subtitle.getPaddingTop(), pad, this.subtitle.getPaddingBottom());
            this.subtitle.setMaxWidth(this.DP_360 + (pad * 2));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class HolderThumps {
        @NonNull
        final VKImageView[] imageViews;
        final ViewGroup itemView;

        HolderThumps(@LayoutRes int layout, @NonNull ViewGroup parent) {
            this.itemView = (ViewGroup) LayoutInflater.from(parent.getContext()).inflate(layout, parent, false);
            this.imageViews = new VKImageView[this.itemView.getChildCount()];
            for (int i = 0; i < this.imageViews.length; i++) {
                this.imageViews[i] = (VKImageView) this.itemView.getChildAt(i).findViewById(16908294);
            }
        }
    }
}
