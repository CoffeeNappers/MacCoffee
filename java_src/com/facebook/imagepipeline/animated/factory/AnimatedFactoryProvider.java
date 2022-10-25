package com.facebook.imagepipeline.animated.factory;

import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
import com.facebook.imagepipeline.core.ExecutorSupplier;
import java.lang.reflect.Constructor;
/* loaded from: classes.dex */
public class AnimatedFactoryProvider {
    private static AnimatedFactory sImpl = null;
    private static boolean sImplLoaded;

    public static AnimatedFactory getAnimatedFactory(PlatformBitmapFactory platformBitmapFactory, ExecutorSupplier executorSupplier) {
        if (!sImplLoaded) {
            try {
                Class<?> clazz = Class.forName("com.facebook.imagepipeline.animated.factory.AnimatedFactoryImplSupport");
                Constructor<?> constructor = clazz.getConstructor(PlatformBitmapFactory.class, ExecutorSupplier.class);
                sImpl = (AnimatedFactory) constructor.newInstance(platformBitmapFactory, executorSupplier);
            } catch (Throwable th) {
            }
            if (sImpl != null) {
                sImplLoaded = true;
                return sImpl;
            }
            try {
                Class<?> clazz2 = Class.forName("com.facebook.imagepipeline.animated.factory.AnimatedFactoryImpl");
                Constructor<?> constructor2 = clazz2.getConstructor(PlatformBitmapFactory.class, ExecutorSupplier.class);
                sImpl = (AnimatedFactory) constructor2.newInstance(platformBitmapFactory, executorSupplier);
            } catch (Throwable th2) {
            }
            sImplLoaded = true;
        }
        return sImpl;
    }
}
