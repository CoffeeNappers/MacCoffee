package com.vkontakte.android.api.groups;

import android.os.Bundle;
import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.Set;
/* loaded from: classes2.dex */
public class GroupsEdit extends ResultlessAPIRequest {
    public GroupsEdit(int groupID, Bundle fields) {
        super("execute.editGroupWithPlace");
        param("group_id", groupID);
        Set<String> ks = fields.keySet();
        for (String k : ks) {
            Object o = fields.get(k);
            if (o != null) {
                param(k, o.toString());
            }
        }
    }
}
