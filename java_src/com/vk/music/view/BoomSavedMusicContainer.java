package com.vk.music.view;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.music.utils.BoomHelper;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes2.dex */
public class BoomSavedMusicContainer extends FrameLayout implements View.OnClickListener {
    public BoomSavedMusicContainer(@NonNull Context context) {
        super(context);
        AudioFacade.OnConnectionListener onConnectionListener;
        LayoutInflater.from(context).inflate(R.layout.music_playlist_boom_saved, (ViewGroup) this, true);
        TextView textView = (TextView) findViewById(R.id.button_open);
        textView.setOnClickListener(this);
        textView.setText(BoomHelper.isBoomInstalled(context) ? R.string.music_saved_playlist_boom_open : R.string.music_saved_playlist_boom_install);
        findViewById(R.id.button_hide).setOnClickListener(this);
        findViewById(R.id.back_btn).setOnClickListener(this);
        onConnectionListener = BoomSavedMusicContainer$$Lambda$1.instance;
        AudioFacade.bind(context, onConnectionListener);
    }

    public static /* synthetic */ void lambda$new$0() {
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button_hide /* 2131755707 */:
                AudioFacade.removeSavedTrack(new String[0]);
                break;
            case R.id.back_btn /* 2131755992 */:
                break;
            case R.id.button_open /* 2131755995 */:
                BoomHelper.openBoom(v.getContext(), BoomHelper.From.cache);
                return;
            default:
                return;
        }
        Activity activity = Utils.castToActivity(v.getContext());
        if (activity != null) {
            activity.finish();
        }
    }
}
