package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.widget.Match;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetMatches;
import java.util.List;
/* loaded from: classes3.dex */
public class WidgetMatchesView extends WidgetItemsView<WidgetMatchesItemView> {
    public WidgetMatchesView(Context context) {
        this(context, null);
    }

    public WidgetMatchesView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetMatchesView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setPadding(0, 0, 0, Global.scale(8.0f));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.widget.WidgetItemsView
    @NonNull
    public WidgetMatchesItemView createItemView(Context context) {
        return new WidgetMatchesItemView(context);
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        super.bind(widget);
        if (widget instanceof WidgetMatches) {
            bind(((WidgetMatches) widget).getMatches());
        }
    }

    private void bind(List<Match> matches) {
        super.bind(matches.size());
        int maxScoreWidth = 0;
        boolean showGameIcon = false;
        boolean showTeamIcons = false;
        for (int i = 0; i < matches.size(); i++) {
            Match match = matches.get(i);
            showGameIcon |= match.hasIcon();
            showTeamIcons = showTeamIcons | match.getTeamA().hasImage() | match.getTeamB().hasImage();
            WidgetMatchesItemView view = (WidgetMatchesItemView) this.items.get(i);
            view.bind(match);
            maxScoreWidth = Math.max(maxScoreWidth, view.measureScoreWidth());
        }
        int i2 = 0;
        while (i2 < this.items.size()) {
            ((WidgetMatchesItemView) this.items.get(i2)).postBind(i2 < this.items.size() + (-1), showGameIcon, showTeamIcons, maxScoreWidth);
            i2++;
        }
    }
}
