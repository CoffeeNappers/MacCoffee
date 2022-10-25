package com.vkontakte.android;

import android.view.MenuItem;
import android.widget.PopupMenu;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioPlayerActivity$$Lambda$5 implements PopupMenu.OnMenuItemClickListener {
    private final AudioPlayerActivity arg$1;

    private AudioPlayerActivity$$Lambda$5(AudioPlayerActivity audioPlayerActivity) {
        this.arg$1 = audioPlayerActivity;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(AudioPlayerActivity audioPlayerActivity) {
        return new AudioPlayerActivity$$Lambda$5(audioPlayerActivity);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.onOptionsItemSelected(menuItem);
    }
}
