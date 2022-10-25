package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.common.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.Match;
import com.vkontakte.android.api.widget.Team;
/* loaded from: classes3.dex */
public class WidgetMatchesItemView extends LinearLayout {
    private static final int iconSize = Global.scale(24.0f);
    private final VKImageView gameIcon;
    private final View liveIcon;
    private final TextView scoreNone;
    private final TextView scoreTeamA;
    private final TextView scoreTeamB;
    private final View scoreView;
    private final View separator;
    private final VKImageView teamIconA;
    private final VKImageView teamIconB;
    private final View teamIcons;
    private final TextView teamNameA;
    private final TextView teamNameB;

    public WidgetMatchesItemView(Context context) {
        this(context, null);
    }

    public WidgetMatchesItemView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetMatchesItemView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        View widgetView = inflate(getContext(), R.layout.profile_widget_matches_item, this);
        this.teamIconA = (VKImageView) widgetView.findViewById(R.id.team_icon_a);
        this.teamIconB = (VKImageView) widgetView.findViewById(R.id.team_icon_b);
        this.gameIcon = (VKImageView) widgetView.findViewById(R.id.game_icon);
        this.scoreTeamA = (TextView) widgetView.findViewById(R.id.team_score_a);
        this.scoreTeamB = (TextView) widgetView.findViewById(R.id.team_score_b);
        this.scoreNone = (TextView) widgetView.findViewById(R.id.score_none);
        this.teamNameA = (TextView) widgetView.findViewById(R.id.team_name_a);
        this.teamNameB = (TextView) widgetView.findViewById(R.id.team_name_b);
        this.scoreView = widgetView.findViewById(R.id.score_view);
        this.teamIcons = widgetView.findViewById(R.id.team_icons);
        this.separator = widgetView.findViewById(R.id.separator);
        this.liveIcon = widgetView.findViewById(R.id.live_icon);
    }

    public void bind(Match match) {
        int i = 4;
        int i2 = 8;
        Team teamA = match.getTeamA();
        Team teamB = match.getTeamB();
        Match.Score score = match.getScore();
        this.teamNameA.setText(teamA.getName());
        this.teamNameB.setText(teamB.getName());
        boolean hasScore = score.hasScore();
        this.scoreNone.setVisibility(hasScore ? 8 : 0);
        this.scoreTeamA.setVisibility(hasScore ? 0 : 8);
        this.scoreTeamB.setVisibility(hasScore ? 0 : 8);
        if (hasScore) {
            this.scoreTeamA.setText(String.valueOf(score.getScoreA()));
            this.scoreTeamB.setText(String.valueOf(score.getScoreB()));
        }
        ImageSize icon = match.getIcon(iconSize);
        ImageSize imageA = teamA.getImage(iconSize);
        ImageSize imageB = teamB.getImage(iconSize);
        loadImage(this.gameIcon, icon);
        loadImage(this.teamIconA, imageA);
        loadImage(this.teamIconB, imageB);
        this.gameIcon.setVisibility(icon != null ? 0 : 4);
        View view = this.teamIcons;
        if (imageA != null || imageB != null) {
            i = 0;
        }
        view.setVisibility(i);
        String liveUrl = match.getLiveUrl();
        View view2 = this.liveIcon;
        if (!TextUtils.isEmpty(liveUrl)) {
            i2 = 0;
        }
        view2.setVisibility(i2);
        this.liveIcon.setOnClickListener(WidgetMatchesItemView$$Lambda$1.lambdaFactory$(this, liveUrl));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$bind$0(String liveUrl, View v) {
        openLink(getContext(), liveUrl);
    }

    public void postBind(boolean showSeparator, boolean showGameIcon, boolean showTeamIcons, int scoreWidth) {
        this.scoreView.getLayoutParams().width = scoreWidth;
        this.scoreView.requestLayout();
        this.separator.setVisibility(showSeparator ? 0 : 8);
        if (!showGameIcon) {
            this.gameIcon.setVisibility(8);
        }
        if (!showTeamIcons) {
            this.teamIcons.setVisibility(8);
        }
    }

    public int measureScoreWidth() {
        this.scoreView.measure(0, 0);
        return this.scoreView.getMeasuredWidth();
    }

    private static void loadImage(VKImageView view, ImageSize image) {
        if (image == null) {
            view.setImageDrawable(null);
        } else {
            view.load(image.getUrl());
        }
    }

    private static void openLink(Context context, String url) {
        if (!TextUtils.isEmpty(url)) {
            Intent intent = new Intent(context, LinkRedirActivity.class);
            intent.setData(Uri.parse(url));
            context.startActivity(intent);
        }
    }
}
