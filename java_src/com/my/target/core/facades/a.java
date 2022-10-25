package com.my.target.core.facades;

import android.content.Context;
import android.text.TextUtils;
import com.my.target.core.async.commands.b;
import com.vk.media.camera.CameraUtilsEffects;
/* compiled from: AbstractAd.java */
/* loaded from: classes2.dex */
public abstract class a implements g {
    protected com.my.target.core.models.c adData;
    protected Context context;
    private b.a<com.my.target.core.models.c> executeListener = new b.a<com.my.target.core.models.c>() { // from class: com.my.target.core.facades.a.1
        @Override // com.my.target.core.async.commands.b.a
        public final /* synthetic */ void onExecute(com.my.target.core.async.commands.b<com.my.target.core.models.c> bVar, com.my.target.core.models.c cVar) {
            com.my.target.core.models.c cVar2 = cVar;
            if (cVar2 != null) {
                a.this.adData = cVar2;
                a.this.onLoad(cVar2);
                return;
            }
            a.this.onLoadError(bVar.a());
        }
    };
    protected com.my.target.core.a params;

    protected abstract void onLoad(com.my.target.core.models.c cVar);

    protected abstract void onLoadError(String str);

    /* JADX INFO: Access modifiers changed from: protected */
    public void init(com.my.target.core.a aVar, Context context) {
        this.params = aVar;
        this.context = context;
    }

    @Override // com.my.target.core.facades.g
    public void load() {
        com.my.target.core.async.commands.b eVar;
        com.my.target.core.a aVar = this.params;
        Context context = this.context;
        String str = com.my.target.core.net.a.a(aVar.c()) + aVar.d() + CameraUtilsEffects.FILE_DELIM;
        if (!TextUtils.isEmpty(com.my.target.core.net.a.a)) {
            str = com.my.target.core.net.a.a;
        }
        com.my.target.core.models.d dVar = new com.my.target.core.models.d(str);
        if ("appwall".equals(aVar.c())) {
            eVar = new com.my.target.core.async.commands.d(dVar, aVar, context);
        } else if ("instreamads".equals(aVar.c()) || "instreamaudioads".equals(aVar.c())) {
            eVar = new com.my.target.core.async.commands.e(dVar, aVar, context);
        } else {
            eVar = new com.my.target.core.async.commands.c(dVar, aVar, context);
        }
        eVar.a(this.executeListener);
        eVar.b();
    }

    public void setTrackingEnvironmentEnabled(boolean z) {
        if (this.params != null) {
            this.params.a(z);
        }
    }
}
