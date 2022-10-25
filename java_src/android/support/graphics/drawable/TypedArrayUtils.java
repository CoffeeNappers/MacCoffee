package android.support.graphics.drawable;

import android.content.res.TypedArray;
import org.xmlpull.v1.XmlPullParser;
/* loaded from: classes.dex */
class TypedArrayUtils {
    private static final String NAMESPACE = "http://schemas.android.com/apk/res/android";

    TypedArrayUtils() {
    }

    public static boolean hasAttribute(XmlPullParser parser, String attrName) {
        return parser.getAttributeValue(NAMESPACE, attrName) != null;
    }

    public static float getNamedFloat(TypedArray a, XmlPullParser parser, String attrName, int resId, float defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        return !hasAttr ? defaultValue : a.getFloat(resId, defaultValue);
    }

    public static boolean getNamedBoolean(TypedArray a, XmlPullParser parser, String attrName, int resId, boolean defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        return !hasAttr ? defaultValue : a.getBoolean(resId, defaultValue);
    }

    public static int getNamedInt(TypedArray a, XmlPullParser parser, String attrName, int resId, int defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        return !hasAttr ? defaultValue : a.getInt(resId, defaultValue);
    }

    public static int getNamedColor(TypedArray a, XmlPullParser parser, String attrName, int resId, int defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        return !hasAttr ? defaultValue : a.getColor(resId, defaultValue);
    }
}
