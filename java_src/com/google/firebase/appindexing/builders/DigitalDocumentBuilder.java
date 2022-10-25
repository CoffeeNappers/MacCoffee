package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
import java.util.Date;
/* loaded from: classes2.dex */
public final class DigitalDocumentBuilder extends IndexableBuilder<DigitalDocumentBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public DigitalDocumentBuilder() {
        super("DigitalDocument");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DigitalDocumentBuilder(String str) {
        super(str);
    }

    public DigitalDocumentBuilder setAuthor(@NonNull PersonBuilder... personBuilderArr) {
        return put("author", personBuilderArr);
    }

    public DigitalDocumentBuilder setDateCreated(@NonNull Date date) {
        return put("dateCreated", date.getTime());
    }

    public DigitalDocumentBuilder setDateModified(@NonNull Date date) {
        return put("dateModified", date.getTime());
    }

    public DigitalDocumentBuilder setHasDigitalDocumentPermission(@NonNull DigitalDocumentPermissionBuilder... digitalDocumentPermissionBuilderArr) {
        return put("hasDigitalDocumentPermission", digitalDocumentPermissionBuilderArr);
    }

    public DigitalDocumentBuilder setText(@NonNull String str) {
        return put("text", str);
    }
}
