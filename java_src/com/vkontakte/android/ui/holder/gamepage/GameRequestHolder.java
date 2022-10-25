package com.vkontakte.android.ui.holder.gamepage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.ui.drawables.RequestBgDrawable;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameRequestHolder extends GameInviteHolder implements UsableRecyclerView.Clickable {
    public GameRequestHolder(@NonNull Context context, @NonNull String visitSource) {
        super(context, visitSource);
    }

    public GameRequestHolder(@NonNull Context context, @NonNull String visitSource, RequestBgDrawable drawable) {
        super(context, visitSource, drawable);
    }

    public GameRequestHolder(@NonNull Context context, @NonNull String visitSource, RequestBgDrawable drawable, int layoutRes) {
        super(context, visitSource, drawable, layoutRes);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        openGame(getItem(), (Activity) getContext(), this.visitSource);
        Games.deleteRequest(getContext(), getItem());
    }

    @Override // com.vkontakte.android.ui.holder.gamepage.GameInviteHolder
    protected void onPlayButtonClick() {
        openGame(getItem(), (Activity) getContext(), this.visitSource);
    }

    public static void openGame(GameRequest request, Activity activity, String visitSource) {
        Bundle extras = new Bundle();
        extras.putString("key", request.key);
        extras.putString("name", request.name);
        extras.putBoolean(ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID, true);
        if (request.apiApplication != null) {
            Games.open(request.apiApplication, extras, activity, visitSource, ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID);
        } else {
            Games.openInstallableGame(request.appPackage, extras, activity, request.appId, visitSource, ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID);
        }
    }
}
