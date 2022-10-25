package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.View;
import com.vk.music.model.ActiveModel;
/* loaded from: classes2.dex */
class FragmentDelegateActiveModel extends FragmentDelegate {
    @NonNull
    private final ActiveModel[] activeModels;
    @NonNull
    private final ViewCreator viewCreator;

    /* loaded from: classes2.dex */
    interface ViewCreator {
        View createView(FragmentDelegateActiveModel fragmentDelegateActiveModel);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FragmentDelegateActiveModel(@NonNull ViewCreator viewCreator, @NonNull ActiveModel... activeModels) {
        this.viewCreator = viewCreator;
        this.activeModels = activeModels;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public <T extends ActiveModel> T model(int i) {
        return (T) this.activeModels[i];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vk.music.fragment.FragmentDelegate
    @NonNull
    public View createView() {
        return this.viewCreator.createView(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vk.music.fragment.FragmentDelegate
    public void destroyView() {
        ActiveModel[] activeModelArr;
        for (ActiveModel model : this.activeModels) {
            model.clearCallbacks();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vk.music.fragment.FragmentDelegate
    public void destroy() {
        ActiveModel[] activeModelArr;
        for (ActiveModel model : this.activeModels) {
            model.release();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vk.music.fragment.FragmentDelegate
    @NonNull
    public Bundle saveInstanceState() {
        Bundle state = new Bundle();
        for (int i = 0; i < this.activeModels.length; i++) {
            state.putBundle("s" + i, this.activeModels[i].save());
        }
        return state;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vk.music.fragment.FragmentDelegate
    public void restoreInstanceState(@NonNull Bundle state) {
        for (int i = 0; i < this.activeModels.length; i++) {
            Bundle s = state.getBundle("s" + i);
            if (s != null) {
                this.activeModels[i].restore(s);
            }
        }
    }
}
