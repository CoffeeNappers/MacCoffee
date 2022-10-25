package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.utils.Utils;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class MusicWasPausedFragment extends AppKitFragment implements View.OnClickListener {
    private static boolean showed = false;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        showed = true;
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        showed = false;
    }

    public static void show(Context ctx, Activity activity) {
        Bundle args = new Bundle();
        Navigator navigator = new Navigator(MusicWasPausedFragment.class, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(312.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowBackgroundResource(R.drawable.white_rect_with_2dp_corners), args);
        if (!showed) {
            if (activity != null) {
                navigator.go(activity);
                return;
            }
            Intent intent = navigator.intent(ctx);
            intent.setFlags(268435456);
            ctx.startActivity(intent);
        }
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fr_music_was_paused, container, false);
        View closeBtn = view.findViewById(R.id.close_btn);
        closeBtn.setOnClickListener(this);
        View closeBtnImg = view.findViewById(R.id.close_btn_img);
        Drawable drawable = ViewUtils.getDrawable(inflater.getContext(), R.drawable.ic_close);
        int gray = inflater.getContext().getResources().getColor(R.color.gray);
        closeBtnImg.setBackground(new RecoloredDrawable(drawable, gray));
        view.findViewById(R.id.button_more).setOnClickListener(this);
        return view;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.close_btn /* 2131755674 */:
                Utils.castToActivity(v.getContext()).finish();
                return;
            case R.id.button_more /* 2131755693 */:
                BuyMusicSubscriptionFragment.show(v.getContext());
                Utils.castToActivity(v.getContext()).finish();
                return;
            default:
                return;
        }
    }
}
