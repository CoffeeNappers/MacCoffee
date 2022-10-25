package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.GameLeaderboard;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameLeaderboardHolder extends RecyclerHolder<Data> implements UsableRecyclerView.Clickable {
    private static final DecimalFormat formatter = (DecimalFormat) NumberFormat.getInstance(Locale.US);
    private static final DecimalFormatSymbols symbols = formatter.getDecimalFormatSymbols();
    private VKImageView imageView;
    private TextView textViewName;
    private TextView textViewNumber;
    private TextView textViewPoints;

    /* loaded from: classes3.dex */
    public static class Data {
        public GameLeaderboard gameLeaderboard;
        public int itemNumber;

        public Data(GameLeaderboard gameLeaderboard, int itemNumber) {
            this.gameLeaderboard = gameLeaderboard;
            this.itemNumber = itemNumber;
        }
    }

    static {
        symbols.setGroupingSeparator(' ');
        formatter.setDecimalFormatSymbols(symbols);
    }

    public GameLeaderboardHolder(@NonNull Context context) {
        super((int) R.layout.apps_leaderboard_item, context);
        this.imageView = (VKImageView) $(R.id.image);
        this.textViewName = (TextView) $(R.id.text_name);
        this.textViewPoints = (TextView) $(R.id.text_points);
        this.textViewNumber = (TextView) $(R.id.text_number);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Data gameLiderboard) {
        if (gameLiderboard.gameLeaderboard.userProfile != null) {
            this.imageView.load(gameLiderboard.gameLeaderboard.userProfile.photo);
            this.textViewName.setText(gameLiderboard.gameLeaderboard.userProfile.fullName);
            this.textViewPoints.setText(getSubText(gameLiderboard.gameLeaderboard));
            this.textViewNumber.setText(String.valueOf(gameLiderboard.itemNumber));
        }
        if (VKAccountManager.isCurrentUser(gameLiderboard.gameLeaderboard.userId)) {
            this.itemView.setBackgroundColor(-1315086);
        } else {
            this.itemView.setBackgroundColor(-1);
        }
    }

    public String getSubText(GameLeaderboard l) {
        return l.isPoints ? getResources().getQuantityString(R.plurals.games_points, l.intValue, Integer.valueOf(l.intValue)) : getResources().getQuantityString(R.plurals.games_level, l.intValue, Integer.valueOf(l.intValue));
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        new ProfileFragment.Builder(getItem().gameLeaderboard.userId).go(getContext());
    }
}
