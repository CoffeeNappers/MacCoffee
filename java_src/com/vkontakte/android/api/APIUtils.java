package com.vkontakte.android.api;

import android.content.Context;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class APIUtils {
    @Nullable
    public static JSONArrayWithCount unwrapArray(JSONObject parent, String name) throws JSONException {
        if (!parent.has(name) || parent.optJSONObject(name) == null) {
            return null;
        }
        JSONArrayWithCount r = new JSONArrayWithCount();
        r.array = parent.getJSONObject(name).optJSONArray(ServerKeys.ITEMS);
        if (r.array == null) {
            return null;
        }
        r.count = parent.getJSONObject(name).getInt(ServerKeys.COUNT);
        return r;
    }

    public static String getLocalizedError(Context context, int code, String msg) {
        if (code <= 0 || (1073741824 & code) <= 0) {
            switch (code) {
                case -2:
                case -1:
                    String msg2 = context.getString(R.string.err_text);
                    return msg2;
                case 10:
                    String msg3 = context.getString(R.string.err_internal);
                    return msg3;
                case 15:
                case 200:
                case VKAPIRequest.ERROR_AUDIO_ACCESS /* 201 */:
                case VKAPIRequest.ERROR_GROUP_ACCESS /* 203 */:
                    String msg4 = context.getString(R.string.err_access);
                    return msg4;
                case 300:
                    String msg5 = context.getString(R.string.err_album_full);
                    return msg5;
                case VKAPIRequest.ERROR_VIDEO_ALREADY_ADDED /* 800 */:
                    String msg6 = context.getString(R.string.video_already_added);
                    return msg6;
                default:
                    String msg7 = context.getString(R.string.error);
                    return msg7;
            }
        }
        return msg;
    }

    public static void showErrorToast(@Nullable Context context, int code, String msg) {
        int codeValue;
        if (context != null && (codeValue = VKAPIRequest.getValueFromErrorCode(code)) != 17 && codeValue != 14 && codeValue != 24) {
            String text = getLocalizedError(context, code, msg);
            if (Looper.getMainLooper() == Looper.myLooper()) {
                showErrorToastInner(context, text);
            } else {
                ViewUtils.post(APIUtils$$Lambda$1.lambdaFactory$(context, text));
            }
        }
    }

    public static void showErrorToastInner(@NonNull Context context, String text) {
        Toast.makeText(context, text, 0).show();
    }
}
