package com.vk.emoji;

import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
/* loaded from: classes2.dex */
public class TextViewInvalidator {
    private static Field editorField;
    private static Method invalidateTextDisplayListMethod;

    private static Object getEditor(TextView textView) throws Exception {
        if (editorField == null) {
            editorField = TextView.class.getDeclaredField("mEditor");
            editorField.setAccessible(true);
        }
        return editorField.get(textView);
    }

    private static void invokeInvalidate(Object editor) throws Exception {
        if (invalidateTextDisplayListMethod == null) {
            invalidateTextDisplayListMethod = editor.getClass().getDeclaredMethod("invalidateTextDisplayList", new Class[0]);
            invalidateTextDisplayListMethod.setAccessible(true);
        }
        invalidateTextDisplayListMethod.invoke(editor, new Object[0]);
    }

    public static void invalidate(TextView textView) {
        if (textView != null) {
            try {
                Object editor = getEditor(textView);
                if (editor == null) {
                    textView.invalidate();
                } else {
                    invokeInvalidate(editor);
                    textView.invalidate();
                }
            } catch (Exception e) {
                boolean enabled = textView.isEnabled();
                textView.setEnabled(!enabled);
                textView.setEnabled(enabled);
            }
        }
    }
}
