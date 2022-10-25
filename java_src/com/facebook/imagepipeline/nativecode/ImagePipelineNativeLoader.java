package com.facebook.imagepipeline.nativecode;

import com.facebook.common.soloader.SoLoaderShim;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class ImagePipelineNativeLoader {
    public static final List<String> DEPENDENCIES;
    public static final String DSO_NAME = "imagepipeline";

    static {
        List<String> dependencies = new ArrayList<>();
        DEPENDENCIES = Collections.unmodifiableList(dependencies);
    }

    public static void load() {
        SoLoaderShim.loadLibrary(DSO_NAME);
    }
}
