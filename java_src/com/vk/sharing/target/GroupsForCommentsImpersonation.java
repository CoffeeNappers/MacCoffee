package com.vk.sharing.target;

import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountGetCommentGroups;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class GroupsForCommentsImpersonation {
    private static final long RESET_CACHE_AFTER = 43200000;
    private static GroupsForCommentsImpersonation instance;
    private long timestamp;
    private ArrayList<Group> groups = null;
    private int userId = 0;

    public static GroupsForCommentsImpersonation getInstance() {
        if (instance == null) {
            instance = new GroupsForCommentsImpersonation();
        }
        return instance;
    }

    public void resetCache() {
        this.groups = null;
    }

    public void load(final Callback<ArrayList<Group>> callback) {
        ensureCacheIsFresh();
        if (this.groups != null) {
            callback.success(this.groups);
        } else {
            new AccountGetCommentGroups().setCallback(new Callback<VKList<Group>>() { // from class: com.vk.sharing.target.GroupsForCommentsImpersonation.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Group> result) {
                    GroupsForCommentsImpersonation.this.groups = result;
                    GroupsForCommentsImpersonation.this.userId = VKAccountManager.getCurrent().getUid();
                    GroupsForCommentsImpersonation.this.timestamp = System.currentTimeMillis();
                    callback.success(GroupsForCommentsImpersonation.this.groups);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    callback.fail(error);
                }
            }).exec(VKApplication.context);
        }
    }

    private void ensureCacheIsFresh() {
        if (!VKAccountManager.isCurrentUser(this.userId) || System.currentTimeMillis() - this.timestamp > RESET_CACHE_AFTER) {
            resetCache();
        }
    }
}
