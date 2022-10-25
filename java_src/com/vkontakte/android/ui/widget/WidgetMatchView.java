package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.common.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.Match;
import com.vkontakte.android.api.widget.Team;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetMatch;
/* loaded from: classes3.dex */
public class WidgetMatchView extends WidgetTitleView {
    private static final int iconSize = Global.scale(56.0f);
    private final View descriptionSpace;
    private final View nameSpace;
    private final TextView score;
    private final View scoreView;
    private final TextView state;
    private final View teamDescription;
    private final TextView teamDescriptionA;
    private final TextView teamDescriptionB;
    private final VKImageView teamIconA;
    private final VKImageView teamIconB;
    private final TextView teamNameA;
    private final TextView teamNameB;

    public WidgetMatchView(Context context) {
        this(context, null);
    }

    public WidgetMatchView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetMatchView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        View widgetView = inflate(getContext(), R.layout.profile_widget_match, this);
        this.teamIconA = (VKImageView) widgetView.findViewById(R.id.team_icon_a);
        this.teamIconB = (VKImageView) widgetView.findViewById(R.id.team_icon_b);
        this.teamNameA = (TextView) widgetView.findViewById(R.id.team_name_a);
        this.teamNameB = (TextView) widgetView.findViewById(R.id.team_name_b);
        this.teamDescriptionA = (TextView) widgetView.findViewById(R.id.team_descr_a);
        this.teamDescriptionB = (TextView) widgetView.findViewById(R.id.team_descr_b);
        this.teamDescription = widgetView.findViewById(R.id.description);
        this.state = (TextView) widgetView.findViewById(R.id.state);
        this.score = (TextView) widgetView.findViewById(R.id.score);
        this.scoreView = widgetView.findViewById(R.id.score_view);
        this.nameSpace = widgetView.findViewById(R.id.name_space);
        this.descriptionSpace = widgetView.findViewById(R.id.description_space);
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        FrameLayout.LayoutParams paramsIconA = (FrameLayout.LayoutParams) this.teamIconA.getLayoutParams();
        FrameLayout.LayoutParams paramsIconB = (FrameLayout.LayoutParams) this.teamIconB.getLayoutParams();
        LinearLayout.LayoutParams scoreParams = (LinearLayout.LayoutParams) this.scoreView.getLayoutParams();
        int width = getMeasuredWidth() / 3;
        if (this.state.getMeasuredWidth() > width) {
            scoreParams.width = width;
            this.state.requestLayout();
            measure(widthMeasureSpec, heightMeasureSpec);
        } else if (this.state.getMeasuredWidth() < width && scoreParams.width != -2) {
            scoreParams.width = -2;
            measure(widthMeasureSpec, heightMeasureSpec);
        } else if (iconSize < width / 3 && (paramsIconA.gravity != 1 || paramsIconB.gravity != 1)) {
            paramsIconA.gravity = 1;
            paramsIconB.gravity = 1;
            this.teamNameA.setGravity(1);
            this.teamNameB.setGravity(1);
            this.teamDescriptionA.setGravity(1);
            this.teamDescriptionB.setGravity(1);
            this.nameSpace.getLayoutParams().width = this.scoreView.getMeasuredWidth();
            this.descriptionSpace.getLayoutParams().width = this.scoreView.getMeasuredWidth();
            this.nameSpace.requestLayout();
            this.descriptionSpace.requestLayout();
            measure(widthMeasureSpec, heightMeasureSpec);
        } else if (iconSize <= width / 3) {
        } else {
            if (paramsIconA.gravity != 3 || paramsIconB.gravity != 5) {
                paramsIconA.gravity = 3;
                paramsIconB.gravity = 5;
                this.teamNameA.setGravity(3);
                this.teamNameB.setGravity(5);
                this.teamDescriptionA.setGravity(3);
                this.teamDescriptionB.setGravity(5);
                this.nameSpace.getLayoutParams().width = 0;
                this.descriptionSpace.getLayoutParams().width = 0;
                this.nameSpace.requestLayout();
                this.descriptionSpace.requestLayout();
                measure(widthMeasureSpec, heightMeasureSpec);
            }
        }
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        super.bind(widget);
        if (widget instanceof WidgetMatch) {
            bind(((WidgetMatch) widget).getMatch());
        }
    }

    private void bind(Match match) {
        int i = 8;
        Team teamA = match.getTeamA();
        this.teamNameA.setText(teamA.getName());
        this.teamDescriptionA.setText(teamA.getDescription());
        Team teamB = match.getTeamB();
        this.teamNameB.setText(teamB.getName());
        this.teamDescriptionB.setText(teamB.getDescription());
        boolean noDescription = TextUtils.isEmpty(teamA.getDescription()) && TextUtils.isEmpty(teamB.getDescription());
        this.teamDescription.setVisibility(noDescription ? 8 : 0);
        this.state.setText(match.getState());
        TextView textView = this.state;
        if (!TextUtils.isEmpty(match.getState())) {
            i = 0;
        }
        textView.setVisibility(i);
        this.score.setText(match.getScore().toString());
        ImageSize imageA = teamA.getImage(iconSize);
        ImageSize imageB = teamB.getImage(iconSize);
        if (imageA != null) {
            this.teamIconA.load(imageA.getUrl());
        }
        if (imageB != null) {
            this.teamIconB.load(imageB.getUrl());
        }
    }
}
