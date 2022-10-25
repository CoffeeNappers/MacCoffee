package com.vkontakte.android.fragments;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomSheetBehavior;
import android.support.design.widget.BottomSheetDialogFragment;
import android.support.design.widget.CoordinatorLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.apps.AppsGetGameLeaderboard;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.GameLeaderboard;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class LeaderboardFragment extends BottomSheetDialogFragment {
    public static final String ARG_LEADERBOARD_DATA = "leaderboard_data";
    public OnDismissedListener dismissedListener;
    private AppsGetGameLeaderboard.LeaderboardData leaderboardData;
    private ArrayList<GameLeaderboard> leaderboardList;
    private BottomSheetBehavior.BottomSheetCallback mBottomSheetBehaviorCallback = new BottomSheetBehavior.BottomSheetCallback() { // from class: com.vkontakte.android.fragments.LeaderboardFragment.1
        @Override // android.support.design.widget.BottomSheetBehavior.BottomSheetCallback
        public void onStateChanged(@NonNull View bottomSheet, int newState) {
            if (newState == 5) {
                LeaderboardFragment.this.handleDismissed();
                LeaderboardFragment.this.dismiss();
            }
        }

        @Override // android.support.design.widget.BottomSheetBehavior.BottomSheetCallback
        public void onSlide(@NonNull View bottomSheet, float slideOffset) {
        }
    };
    private UsableRecyclerView usableRecyclerView;

    /* loaded from: classes2.dex */
    public interface OnDismissedListener {
        void onLeaderboardDismissed();
    }

    @Override // android.support.v4.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        handleDismissed();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleDismissed() {
        if (this.dismissedListener != null) {
            this.dismissedListener.onLeaderboardDismissed();
        }
    }

    @Override // android.support.v7.app.AppCompatDialogFragment, android.support.v4.app.DialogFragment
    public void setupDialog(Dialog dialog, int style) {
        super.setupDialog(dialog, style);
        dialog.getWindow().addFlags(1024);
        this.leaderboardData = (AppsGetGameLeaderboard.LeaderboardData) getArguments().getParcelable(ARG_LEADERBOARD_DATA);
        prepareLeaderboardList(this.leaderboardData.leaderboard);
        this.usableRecyclerView = new UsableRecyclerView(getContext());
        this.usableRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        this.usableRecyclerView.setAdapter(new Adapter());
        FrameLayout.LayoutParams recViewParams = new FrameLayout.LayoutParams(-1, -1);
        recViewParams.setMargins(0, 0, 0, Screen.dp(48));
        dialog.setContentView(this.usableRecyclerView, recViewParams);
        CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) ((View) this.usableRecyclerView.getParent()).getLayoutParams();
        CoordinatorLayout.Behavior behavior = layoutParams.getBehavior();
        if (behavior != null && (behavior instanceof BottomSheetBehavior)) {
            ((BottomSheetBehavior) behavior).setBottomSheetCallback(this.mBottomSheetBehaviorCallback);
            ((BottomSheetBehavior) behavior).setPeekHeight((int) ((Screen.height() * 70.0f) / 100.0f));
        }
        View container = (View) this.usableRecyclerView.getParent();
        container.setBackgroundColor(0);
        CoordinatorLayout cl = (CoordinatorLayout) this.usableRecyclerView.getParent().getParent();
        View playAgainButton = LayoutInflater.from(getContext()).inflate(R.layout.htmlapp_leaderboard_button, (ViewGroup) cl, false);
        TextView playAgainTextView = (TextView) playAgainButton.findViewById(R.id.tv_button);
        if (Build.VERSION.SDK_INT >= 21) {
            playAgainButton.setElevation(200.0f);
        }
        playAgainTextView.setText(this.leaderboardList.get(0).isPoints ? getString(R.string.htmlgame_leaderboard_play_again) : getString(R.string.htmlgame_leaderboard_continue_playing));
        playAgainButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.LeaderboardFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                LeaderboardFragment.this.dismiss();
            }
        });
        cl.addView(playAgainButton);
    }

    private void prepareLeaderboardList(ArrayList<GameLeaderboard> list) {
        this.leaderboardList = list;
    }

    /* loaded from: classes2.dex */
    public class Adapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        private final int TYPE_HEADER = 0;
        private final int TYPE_LEADERBOARD_ITEM = 1;

        public Adapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new HeaderHolder(parent);
                case 1:
                    return new ViewHolder(parent);
                default:
                    return null;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return position == 0 ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            if (position == 0) {
                ((HeaderHolder) holder).bind(LeaderboardFragment.this.leaderboardData);
            } else {
                ((ViewHolder) holder).bind(LeaderboardFragment.this.leaderboardList.get(position - 1));
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return LeaderboardFragment.this.leaderboardList.size() + 1;
        }
    }

    /* loaded from: classes2.dex */
    public static class HeaderHolder extends RecyclerHolder<AppsGetGameLeaderboard.LeaderboardData> {
        private VKImageView imageViewGame;
        private TextView textViewSubtitle;
        private TextView textViewTitle;

        public HeaderHolder(ViewGroup parent) {
            super((int) R.layout.htmlapp_leaderboard_header, parent);
            this.textViewTitle = (TextView) this.itemView.findViewById(R.id.tv_title);
            this.textViewSubtitle = (TextView) this.itemView.findViewById(R.id.tv_subtitle);
            this.imageViewGame = (VKImageView) this.itemView.findViewById(R.id.image);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(AppsGetGameLeaderboard.LeaderboardData item) {
            this.textViewTitle.setText(item.apiApplication.title);
            CharSequence subtitleText = "";
            switch (item.apiApplication.leaderboardType) {
                case 1:
                    subtitleText = Html.fromHtml(getString(R.string.htmlgame_leaderboard_you_reached_level_x, Global.formatNumberWithThousandSeparator(item.userLevelOrPointsCurrent)));
                    break;
                case 2:
                    subtitleText = Html.fromHtml(getQuantityString(R.plurals.htmlgame_leaderboard_you_got_points, item.userLevelOrPointsCurrent, Global.formatNumberWithThousandSeparator(item.userLevelOrPointsCurrent)));
                    break;
            }
            this.textViewSubtitle.setText(subtitleText);
            this.imageViewGame.load(item.apiApplication.icon.getImageByWidth(Screen.dp(72)).url);
        }
    }

    /* loaded from: classes2.dex */
    public class ViewHolder extends RecyclerHolder<GameLeaderboard> {
        private ImageView imageViewPlace;
        private VKImageView imageViewUser;
        private GameLeaderboard item;
        private TextView textViewName;
        private TextView textViewPoints;

        public ViewHolder(ViewGroup parent) {
            super((int) R.layout.htmlapp_leaderboard_item, parent);
            this.textViewName = (TextView) this.itemView.findViewById(R.id.text_name);
            this.textViewPoints = (TextView) this.itemView.findViewById(R.id.text_points);
            this.imageViewPlace = (ImageView) this.itemView.findViewById(R.id.image_place);
            this.imageViewUser = (VKImageView) this.itemView.findViewById(R.id.image);
            this.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.LeaderboardFragment.ViewHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (ViewHolder.this.item != null) {
                        new ProfileFragment.Builder(ViewHolder.this.item.userId).go(ViewHolder.this.getContext());
                    }
                }
            });
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GameLeaderboard item) {
            int i = -11367476;
            this.item = item;
            this.textViewName.setText(item.userProfile.fullName);
            this.imageViewUser.load(item.userProfile.photo);
            if (item.isPoints) {
                this.textViewPoints.setText(getQuantityString(R.plurals.games_points, item.intValue, Integer.valueOf(item.intValue)));
            } else {
                this.textViewPoints.setText(getQuantityString(R.plurals.games_level, item.intValue, Integer.valueOf(item.intValue)));
            }
            this.textViewName.setTextColor(VKAccountManager.isCurrentUser(item.userId) ? -11367476 : -13882066);
            TextView textView = this.textViewPoints;
            if (!VKAccountManager.isCurrentUser(item.userId)) {
                i = -7301991;
            }
            textView.setTextColor(i);
            if (LeaderboardFragment.this.leaderboardList.size() > 3 && item.place > 0 && item.place < 4) {
                this.imageViewPlace.setVisibility(0);
                switch (item.place) {
                    case 1:
                        this.imageViewPlace.setImageResource(R.drawable.ic_leaderboard_1st);
                        return;
                    case 2:
                        this.imageViewPlace.setImageResource(R.drawable.ic_leaderboard_2nd);
                        return;
                    case 3:
                        this.imageViewPlace.setImageResource(R.drawable.ic_leaderboard_3rd);
                        return;
                    default:
                        return;
                }
            }
            this.imageViewPlace.setVisibility(8);
        }
    }
}
