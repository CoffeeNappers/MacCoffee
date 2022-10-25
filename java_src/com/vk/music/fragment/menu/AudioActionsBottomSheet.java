package com.vk.music.fragment.menu;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.MusicBinder;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public final class AudioActionsBottomSheet extends ActionsBottomSheet<MusicTrack> {
    private static final String TAG = AudioActionsBottomSheet.class.getName();

    /* loaded from: classes2.dex */
    public static final class Builder extends ActionsBottomSheet.ArgsBuilder<MusicTrack> {
        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.ArgsBuilder
        public /* bridge */ /* synthetic */ void callback(@Nullable ActionsBottomSheet.Callback<MusicTrack> callback) {
            super.callback(callback);
        }

        public Builder(@NonNull MusicTrack musicTrack, ActionsBottomSheet.Callback<MusicTrack> callback, boolean canAdd, boolean canRemove) {
            super(musicTrack);
            if (canAdd) {
                addExtAction(R.id.music_action_add_to_my_music, R.drawable.ic_add);
            } else if (canRemove) {
                addExtAction(R.id.music_action_remove_from_my_music, R.drawable.ic_ab_delete);
            }
            callback(callback);
            addExtAction(R.id.music_action_toggle_download, R.drawable.ic_download_24dp);
            addExtAction(R.id.music_action_share, R.drawable.ic_share_24dp);
            addAction(R.id.music_action_add_to_playlist, R.drawable.ic_new_playlist_24dp, R.string.music_add_to_playlist);
            addAction(R.id.music_action_play_next, R.drawable.ic_play_next_24dp, R.string.music_play_next);
            addAction(R.id.music_action_play_similar, R.drawable.ic_similar_24dp, R.string.music_play_similar);
        }

        public void show(@NonNull Activity activity) {
            if (activity instanceof AppCompatActivity) {
                FragmentManager fragmentManager = ((AppCompatActivity) activity).getSupportFragmentManager();
                if (AudioActionsBottomSheet.find(fragmentManager) == null) {
                    AudioActionsBottomSheet bottomSheet = new AudioActionsBottomSheet();
                    bottomSheet.setArguments(build());
                    bottomSheet.setCallback(this.callback);
                    try {
                        bottomSheet.show(fragmentManager, AudioActionsBottomSheet.TAG);
                    } catch (IllegalStateException e) {
                        L.e(e, new Object[0]);
                    }
                }
            }
        }
    }

    public static void restoreCallback(@NonNull Activity activity, @Nullable ActionsBottomSheet.Callback<MusicTrack> callback) {
        if (activity instanceof AppCompatActivity) {
            AppCompatActivity compatActivity = (AppCompatActivity) activity;
            AudioActionsBottomSheet bottomSheet = find(compatActivity.getSupportFragmentManager());
            if (bottomSheet != null) {
                bottomSheet.setCallback(callback);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Nullable
    public static AudioActionsBottomSheet find(@NonNull FragmentManager fragmentManager) {
        return (AudioActionsBottomSheet) fragmentManager.findFragmentByTag(TAG);
    }

    @Override // com.vk.music.fragment.menu.ActionsBottomSheet
    @NonNull
    protected ItemAdapter<MusicTrack> onCreateHeaderAdapter(int viewType) {
        IdResolver idResolver;
        ItemAdapter.Builder binder = new ItemAdapter.Builder(LayoutInflater.from(getContext())).layout(R.layout.music_bottom_sheet_header_audio).init(AudioActionsBottomSheet$$Lambda$1.lambdaFactory$(this)).binder(new MusicBinder());
        idResolver = AudioActionsBottomSheet$$Lambda$2.instance;
        return binder.resolver(idResolver).viewType(viewType).build();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateHeaderAdapter$1(View itemView) {
        ImageView menu = (ImageView) itemView.findViewById(R.id.audio_menu);
        menu.setVisibility(8);
        Bundle args = getArguments();
        ArrayList<Action> actions = args.getParcelableArrayList("extActions");
        int count = actions.size();
        LayoutInflater inflater = LayoutInflater.from(getContext());
        LinearLayout actionsBlock = (LinearLayout) itemView.findViewById(R.id.actions_block);
        actionsBlock.setWeightSum(count);
        View.OnClickListener clickListener = AudioActionsBottomSheet$$Lambda$3.lambdaFactory$(this);
        Iterator<Action> it = actions.iterator();
        while (it.hasNext()) {
            Action action = it.next();
            ImageView image = (ImageView) inflater.inflate(R.layout.music_bottom_sheet_header_audio_item, (ViewGroup) actionsBlock, false);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -1);
            params.weight = 1.0f;
            actionsBlock.addView(image, params);
            image.setImageResource(action.iconRes);
            image.setTag(action);
            image.setOnClickListener(clickListener);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(View v) {
        onActionClick(this.header, ((Action) v.getTag()).id);
    }
}
