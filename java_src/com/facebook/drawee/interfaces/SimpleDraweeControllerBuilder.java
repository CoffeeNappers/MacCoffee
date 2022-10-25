package com.facebook.drawee.interfaces;

import android.net.Uri;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public interface SimpleDraweeControllerBuilder {
    /* renamed from: build */
    DraweeController mo208build();

    /* renamed from: setCallerContext */
    SimpleDraweeControllerBuilder mo209setCallerContext(Object obj);

    /* renamed from: setOldController */
    SimpleDraweeControllerBuilder mo210setOldController(@Nullable DraweeController draweeController);

    /* renamed from: setUri */
    SimpleDraweeControllerBuilder mo205setUri(Uri uri);

    /* renamed from: setUri */
    SimpleDraweeControllerBuilder mo206setUri(@Nullable String str);
}
