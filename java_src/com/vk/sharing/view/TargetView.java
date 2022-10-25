package com.vk.sharing.view;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.sharing.target.Target;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
final class TargetView extends FrameLayout {
    @NonNull
    TargetImageView iconView;
    @NonNull
    TextView labelView;
    @Nullable
    private Target target;

    public TargetView(@NonNull Context context) {
        this(context, null);
    }

    public TargetView(@NonNull Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public TargetView(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setBackgroundResource(R.drawable.rounded_list_selector);
        inflate(context, R.layout.layout_share_target_view, this);
        this.iconView = (TargetImageView) getChildAt(0);
        this.labelView = (TextView) getChildAt(1);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(getResources().getDimensionPixelSize(R.dimen.sharing_target_width), 1073741824), View.MeasureSpec.makeMeasureSpec(getResources().getDimensionPixelSize(R.dimen.sharing_target_height), 1073741824));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTarget(@Nullable Target target) {
        this.target = target;
        if (target != null) {
            this.iconView.load(target.photoUrl);
            this.labelView.setText(target.name);
            this.iconView.setSelected(target.selected);
            this.labelView.setSelected(target.selected);
            return;
        }
        this.iconView.load(null);
        this.labelView.setText((CharSequence) null);
        this.iconView.setSelected(false);
        this.labelView.setSelected(false);
    }

    @Nullable
    public Target getTarget() {
        return this.target;
    }
}
