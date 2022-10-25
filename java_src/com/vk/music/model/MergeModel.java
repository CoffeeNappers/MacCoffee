package com.vk.music.model;

import android.os.Bundle;
import android.support.annotation.NonNull;
import com.vk.core.util.CollectionUtils;
import java.util.List;
/* loaded from: classes.dex */
public class MergeModel implements ActiveModel {
    private final List<ActiveModel> models;

    public MergeModel(ActiveModel... models) {
        this.models = CollectionUtils.listOf(models);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final <T> T model(int i) {
        return (T) this.models.get(i);
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        int i = 0;
        for (ActiveModel model : this.models) {
            int i2 = i + 1;
            Bundle s = state.getBundle("s" + i);
            if (s != null) {
                model.restore(s);
            }
            i = i2;
        }
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        int i = 0;
        for (ActiveModel model : this.models) {
            state.putBundle("s" + i, model.save());
            i++;
        }
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void clearCallbacks() {
        for (ActiveModel model : this.models) {
            model.clearCallbacks();
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        for (ActiveModel model : this.models) {
            model.release();
        }
    }
}
