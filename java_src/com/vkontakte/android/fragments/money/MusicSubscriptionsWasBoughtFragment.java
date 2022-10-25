package com.vkontakte.android.fragments.money;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.music.utils.BoomHelper;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.utils.Utils;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class MusicSubscriptionsWasBoughtFragment extends AppKitFragment implements View.OnClickListener {
    public static void show(Context ctx) {
        Bundle args = new Bundle();
        new Navigator(MusicSubscriptionsWasBoughtFragment.class, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(312.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowBackgroundResource(R.drawable.white_rect_with_2dp_corners), args).go(ctx);
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fr_music_subscription_was_bought, container, false);
        view.findViewById(R.id.button).setOnClickListener(this);
        TextView buttonText = (TextView) view.findViewById(R.id.button_text);
        if (BoomHelper.isBoomInstalled(inflater.getContext())) {
            buttonText.setText(R.string.music_subs_success_4);
        }
        return view;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button /* 2131755279 */:
                BoomHelper.openBoom(v.getContext(), BoomHelper.From.subscription);
                Utils.castToActivity(v.getContext()).finish();
                return;
            default:
                return;
        }
    }
}
