package com.vkontakte.android.fragments.documents;

import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public class DocumentsFragmentBuilder extends Navigator {
    public DocumentsFragmentBuilder(boolean select) {
        super(select ? DocumentsChooserFragment.class : DocumentsViewFragment.class);
        this.args.putBoolean(ArgKeys.SELECT, select);
    }

    public DocumentsFragmentBuilder() {
        super(DocumentsViewFragment.class);
    }

    public DocumentsFragmentBuilder setOwnerId(int ownerId) {
        if (ownerId != 0) {
            this.args.putInt("owner_id", ownerId);
        }
        return this;
    }

    public DocumentsFragmentBuilder setLimit(int limit) {
        this.args.putInt(ArgKeys.LIMIT, limit);
        return this;
    }
}
