package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class DigitalDocumentPermissionBuilder extends IndexableBuilder<DigitalDocumentPermissionBuilder> {
    public static final String COMMENT_PERMISSION = "CommentPermission";
    public static final String READ_PERMISSION = "ReadPermission";
    public static final String WRITE_PERMISSION = "WritePermission";

    /* JADX INFO: Access modifiers changed from: package-private */
    public DigitalDocumentPermissionBuilder() {
        super("DigitalDocumentPermission");
    }

    public DigitalDocumentPermissionBuilder setGrantee(@NonNull PersonBuilder... personBuilderArr) {
        return put("grantee", personBuilderArr);
    }

    public DigitalDocumentPermissionBuilder setPermissionType(@NonNull String str) {
        return put("permissionType", str);
    }
}
