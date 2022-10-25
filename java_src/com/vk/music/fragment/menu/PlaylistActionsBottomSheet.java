package com.vk.music.fragment.menu;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.constraint.ConstraintLayout;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import com.vk.core.util.Resourcer;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.menu.ActionsBottomSheet;
import com.vk.music.view.adapter.IdResolver;
import com.vk.music.view.adapter.ItemAdapter;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vk.music.view.adapter.PlaylistBinder;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public final class PlaylistActionsBottomSheet extends ActionsBottomSheet<Playlist> {
    private static final String TAG = PlaylistActionsBottomSheet.class.getName();

    /* loaded from: classes2.dex */
    public static final class Builder extends ActionsBottomSheet.ArgsBuilder<Playlist> {
        @Override // com.vk.music.fragment.menu.ActionsBottomSheet.ArgsBuilder
        public /* bridge */ /* synthetic */ void callback(@Nullable ActionsBottomSheet.Callback<Playlist> callback) {
            super.callback(callback);
        }

        public Builder(@NonNull Playlist playlist, ActionsBottomSheet.Callback<Playlist> callback, boolean canAdd, boolean canRemove) {
            super(playlist);
            callback(callback);
            if (canAdd) {
                addAction(R.id.music_action_add_to_my_music, R.drawable.ic_add_24dp, R.string.music_add_to_my_music);
            } else if (canRemove) {
                addAction(R.id.music_action_remove_from_my_music, R.drawable.ic_ab_delete, R.string.music_remove_from_my_music);
            }
            addAction(R.id.music_action_play_next, R.drawable.ic_new_playlist_24dp, R.string.music_play_next);
            addAction(R.id.music_action_share, R.drawable.ic_share_24dp, R.string.music_share);
        }

        public void show(@NonNull Activity activity) {
            if (activity instanceof AppCompatActivity) {
                FragmentManager fragmentManager = ((AppCompatActivity) activity).getSupportFragmentManager();
                if (PlaylistActionsBottomSheet.find(fragmentManager) == null) {
                    PlaylistActionsBottomSheet bottomSheet = new PlaylistActionsBottomSheet();
                    bottomSheet.setArguments(build());
                    bottomSheet.setCallback(this.callback);
                    bottomSheet.show(fragmentManager, PlaylistActionsBottomSheet.TAG);
                }
            }
        }
    }

    public static void restoreCallback(@NonNull Activity activity, @Nullable ActionsBottomSheet.Callback<Playlist> callback) {
        PlaylistActionsBottomSheet bottomSheet;
        if ((activity instanceof AppCompatActivity) && (bottomSheet = find(((AppCompatActivity) activity).getSupportFragmentManager())) != null) {
            bottomSheet.setCallback(callback);
        }
    }

    @Nullable
    public static PlaylistActionsBottomSheet find(@NonNull FragmentManager fragmentManager) {
        return (PlaylistActionsBottomSheet) fragmentManager.findFragmentByTag(TAG);
    }

    @Override // com.vk.music.fragment.menu.ActionsBottomSheet
    @NonNull
    protected ItemAdapter<Playlist> onCreateHeaderAdapter(int viewType) {
        ItemViewHolder.Builder.Init init;
        IdResolver idResolver;
        ItemAdapter.Builder layout = new ItemAdapter.Builder(LayoutInflater.from(getContext())).layout(R.layout.music_bottom_sheet_header_playlist);
        init = PlaylistActionsBottomSheet$$Lambda$1.instance;
        ItemAdapter.Builder registerClickListener = layout.init(init).binder(new PlaylistBinder(Resourcer.of(getContext()))).registerClickListener(PlaylistActionsBottomSheet$$Lambda$2.lambdaFactory$(this));
        idResolver = PlaylistActionsBottomSheet$$Lambda$3.instance;
        return registerClickListener.resolver(idResolver).viewType(viewType).build();
    }

    public static /* synthetic */ void lambda$onCreateHeaderAdapter$0(View view) {
        ImageView menu = (ImageView) view.findViewById(R.id.playlist_menu);
        menu.setBackground(null);
        menu.setImageResource(R.drawable.ic_chevron_24dp);
        ConstraintLayout.LayoutParams params = (ConstraintLayout.LayoutParams) menu.getLayoutParams();
        params.bottomToTop = 0;
    }

    public /* synthetic */ void lambda$onCreateHeaderAdapter$1(View v, Playlist playlist, int position) {
        if (this.callback != null) {
            this.callback.onActionClick(playlist, R.id.music_action_header);
        }
        dismiss();
    }
}
