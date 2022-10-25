package com.vkontakte.android.ui.posts;

import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1 implements View.OnClickListener {
    private final FriendsRecommPostDisplayItem.FriendsRecommViewHolder arg$1;
    private final ViewGroup arg$2;

    private FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1(FriendsRecommPostDisplayItem.FriendsRecommViewHolder friendsRecommViewHolder, ViewGroup viewGroup) {
        this.arg$1 = friendsRecommViewHolder;
        this.arg$2 = viewGroup;
    }

    public static View.OnClickListener lambdaFactory$(FriendsRecommPostDisplayItem.FriendsRecommViewHolder friendsRecommViewHolder, ViewGroup viewGroup) {
        return new FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1(friendsRecommViewHolder, viewGroup);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(this.arg$2, view);
    }
}
