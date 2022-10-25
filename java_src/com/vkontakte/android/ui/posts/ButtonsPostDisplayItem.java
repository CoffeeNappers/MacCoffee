package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.content.DialogInterface;
import android.view.View;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.news.NewPostFragment;
/* loaded from: classes3.dex */
public class ButtonsPostDisplayItem extends PostDisplayItem {
    private NewsEntry post;

    public ButtonsPostDisplayItem(NewsEntry e) {
        super(e);
        this.post = e;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 10;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    public static View createView(Context context) {
        return View.inflate(context, R.layout.card_buttons, null);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View v) {
        if (this.post.attachments.size() > 0 && ((this.post.attachments.get(this.post.attachments.size() - 1) instanceof ThumbAttachment) || (this.post.attachments.get(this.post.attachments.size() - 1) instanceof SnippetAttachment))) {
            v.findViewById(R.id.post_divider).setVisibility(4);
        } else {
            v.findViewById(R.id.post_divider).setVisibility(0);
        }
        v.findViewById(R.id.friend_req_btn_add).setOnClickListener(ButtonsPostDisplayItem$$Lambda$1.lambdaFactory$(this));
        v.findViewById(R.id.friend_req_btn_decline).setOnClickListener(ButtonsPostDisplayItem$$Lambda$2.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBindView$0(View v1) {
        Group g = Groups.getById(-this.post.ownerID);
        new NewPostFragment.Builder().attachPost(this.post).attachGroup(g).isPublic(true).go(v1.getContext());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBindView$2(View v1) {
        new VKAlertDialog.Builder(v1.getContext()).setTitle(R.string.confirm).setMessage(R.string.delete_confirm).setPositiveButton(R.string.yes, ButtonsPostDisplayItem$$Lambda$3.lambdaFactory$(this, v1)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$1(View v1, DialogInterface dialog, int which) {
        Posts.deletePost(this.post, v1.getContext());
    }
}
