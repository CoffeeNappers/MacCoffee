package com.vkontakte.android.fragments.friends;

import com.facebook.AccessToken;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import java.lang.invoke.LambdaForm;
import org.json.JSONArray;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsImportFragment$Legacy$$Lambda$6 implements GraphRequest.GraphJSONArrayCallback {
    private final FriendsImportFragment.Legacy arg$1;
    private final AccessToken arg$2;

    private FriendsImportFragment$Legacy$$Lambda$6(FriendsImportFragment.Legacy legacy, AccessToken accessToken) {
        this.arg$1 = legacy;
        this.arg$2 = accessToken;
    }

    public static GraphRequest.GraphJSONArrayCallback lambdaFactory$(FriendsImportFragment.Legacy legacy, AccessToken accessToken) {
        return new FriendsImportFragment$Legacy$$Lambda$6(legacy, accessToken);
    }

    @Override // com.facebook.GraphRequest.GraphJSONArrayCallback
    @LambdaForm.Hidden
    public void onCompleted(JSONArray jSONArray, GraphResponse graphResponse) {
        this.arg$1.lambda$importFacebook$7(this.arg$2, jSONArray, graphResponse);
    }
}
