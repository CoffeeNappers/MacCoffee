package com.vkontakte.android.ui.holder.gamepage;

import android.app.Fragment;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.apps.AppsToggleRequests;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.fragments.GameCardFragment;
import com.vkontakte.android.fragments.userlist.SendRequestToGameFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameIconButtonHolder extends RecyclerHolder<GameCardFragment> implements UsableRecyclerView.Clickable {
    static Handler handler = new Handler(Looper.getMainLooper());
    private static Runnable pendingRequest;
    private final Switch aSwitch;
    private ApiApplication lastApp;
    private final boolean showSwitch;

    public GameIconButtonHolder(@NonNull Context context, boolean showSwitch) {
        super((int) R.layout.apps_icon_button, context);
        this.showSwitch = showSwitch;
        TextView textView = (TextView) $(R.id.text);
        textView.setText(showSwitch ? R.string.sett_notifications : R.string.games_invite_friends);
        this.aSwitch = (Switch) $(R.id.switchWidget);
        this.aSwitch.setVisibility(showSwitch ? 0 : 8);
        if (showSwitch) {
            this.aSwitch.setOnCheckedChangeListener(GameIconButtonHolder$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(CompoundButton buttonView, boolean isChecked) {
        updateNotificationsStateDelayed(isChecked);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(GameCardFragment data) {
        this.lastApp = data.getApplication();
        if (this.showSwitch) {
            this.aSwitch.setChecked(this.lastApp.notificationsEnabled);
        }
    }

    public void switchValue() {
        if (this.showSwitch) {
            this.aSwitch.setChecked(!this.aSwitch.isChecked());
        }
    }

    private void updateNotificationsStateDelayed(boolean switchState) {
        if (pendingRequest != null) {
            handler.removeCallbacks(pendingRequest);
        }
        pendingRequest = GameIconButtonHolder$$Lambda$2.lambdaFactory$(this, switchState);
        handler.postDelayed(pendingRequest, 400L);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$updateNotificationsStateDelayed$1(boolean switchState) {
        pendingRequest = null;
        if (switchState != this.lastApp.notificationsEnabled) {
            new AppsToggleRequests(this.lastApp.id, switchState).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.ui.holder.gamepage.GameIconButtonHolder.1
                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                }
            }).persist(null, null).exec();
        }
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.showSwitch) {
            switchValue();
        } else {
            inviteToGame(getItem(), getItem().getApplication().id);
        }
    }

    public static void inviteToGame(Fragment fragment, int appId) {
        new SendRequestToGameFragment.Builder(appId).setDisableSpinner().setSelect().setGlobalSearch(false).setTitle(fragment.getString(R.string.select_recipient)).forResult(fragment, GameCardFragment.INVITE_RESULT);
    }
}
