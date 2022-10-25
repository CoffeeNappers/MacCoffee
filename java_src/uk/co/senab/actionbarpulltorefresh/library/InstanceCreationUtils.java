package uk.co.senab.actionbarpulltorefresh.library;

import android.content.Context;
import android.util.Log;
import android.view.View;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.AbsListViewDelegate;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ScrollYDelegate;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.WebViewDelegate;
/* loaded from: classes3.dex */
class InstanceCreationUtils {
    private static final String LOG_TAG = "InstanceCreationUtils";
    private static final Class<?>[] VIEW_DELEGATE_CONSTRUCTOR_SIGNATURE = new Class[0];
    private static final Class<?>[] TRANSFORMER_CONSTRUCTOR_SIGNATURE = new Class[0];
    private static final HashMap<Class, Class> BUILT_IN_DELEGATES = new HashMap<>();

    InstanceCreationUtils() {
    }

    static {
        addBuiltinDelegates(AbsListViewDelegate.SUPPORTED_VIEW_CLASSES, AbsListViewDelegate.class);
        addBuiltinDelegates(ScrollYDelegate.SUPPORTED_VIEW_CLASSES, ScrollYDelegate.class);
        addBuiltinDelegates(WebViewDelegate.SUPPORTED_VIEW_CLASSES, WebViewDelegate.class);
    }

    private static void addBuiltinDelegates(Class[] supportedViews, Class<?> delegateClass) {
        for (Class cls : supportedViews) {
            BUILT_IN_DELEGATES.put(cls, delegateClass);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ViewDelegate getBuiltInViewDelegate(View view) {
        Set<Map.Entry<Class, Class>> entries = BUILT_IN_DELEGATES.entrySet();
        for (Map.Entry<Class, Class> entry : entries) {
            if (entry.getKey().isInstance(view)) {
                return (ViewDelegate) newInstance(view.getContext(), entry.getValue(), VIEW_DELEGATE_CONSTRUCTOR_SIGNATURE, new Object[0]);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static <T> T instantiateViewDelegate(Context context, String className) {
        try {
            Class<?> clazz = context.getClassLoader().loadClass(className);
            return (T) newInstance(context, clazz, VIEW_DELEGATE_CONSTRUCTOR_SIGNATURE, new Object[0]);
        } catch (Exception e) {
            Log.w(LOG_TAG, "Cannot instantiate class: " + className, e);
            return null;
        }
    }

    static <T> T instantiateTransformer(Context context, String className) {
        try {
            Class<?> clazz = context.getClassLoader().loadClass(className);
            return (T) newInstance(context, clazz, TRANSFORMER_CONSTRUCTOR_SIGNATURE, new Object[0]);
        } catch (Exception e) {
            Log.w(LOG_TAG, "Cannot instantiate class: " + className, e);
            return null;
        }
    }

    private static <T> T newInstance(Context context, Class clazz, Class[] constructorSig, Object... arguments) {
        try {
            Constructor<?> constructor = clazz.getConstructor(constructorSig);
            return constructor.newInstance(arguments);
        } catch (Exception e) {
            Log.w(LOG_TAG, "Cannot instantiate class: " + clazz.getName(), e);
            return null;
        }
    }
}
