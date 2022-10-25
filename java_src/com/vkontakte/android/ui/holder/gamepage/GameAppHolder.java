package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.GameCardActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameAppHolder extends RecyclerHolder<ApiApplication> implements UsableRecyclerView.Clickable, View.OnClickListener {
    private final View bubble;
    @NonNull
    private final GetterData getterData;
    private final VKImageView icon;
    private final View iconInstant;
    private final TextView subtitle;
    private final TextView title;
    @NonNull
    private final String visitSource;

    /* loaded from: classes3.dex */
    public interface GetterData {
        ArrayList<ApiApplication> getApiApplications();
    }

    public GameAppHolder(@NonNull GetterData getterData, @NonNull Context context, @NonNull String visitSource) {
        super((int) R.layout.installed_apps_item, context);
        this.getterData = getterData;
        this.visitSource = visitSource;
        this.icon = (VKImageView) $(R.id.app_icon);
        this.title = (TextView) $(R.id.app_title);
        this.subtitle = (TextView) $(R.id.app_subtitle);
        this.bubble = $(R.id.app_bubble);
        this.iconInstant = $(R.id.app_img_instant);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(ApiApplication item) {
        int i = 0;
        this.title.setText(item.title);
        this.subtitle.setText(item.description);
        if (item.isNew && this.bubble.getVisibility() != 0) {
            this.bubble.setVisibility(0);
        } else if (!item.isNew && this.bubble.getVisibility() != 8) {
            this.bubble.setVisibility(8);
        }
        View view = this.iconInstant;
        if (!item.isHtml5App) {
            i = 8;
        }
        view.setVisibility(i);
        this.icon.load(getIconUrl(item));
    }

    public static String getIconUrl(ApiApplication item) {
        return item.icon.getImageByWidth(V.dp(72.0f)).url;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        onClick();
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        ArrayList<ApiApplication> apps = this.getterData.getApiApplications();
        GameCardActivity.openApp(getContext(), this.visitSource, "catalog", apps, apps.indexOf(getItem()));
    }
}
