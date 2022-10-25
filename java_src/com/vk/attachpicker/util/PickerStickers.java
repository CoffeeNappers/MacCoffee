package com.vk.attachpicker.util;

import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PickerStickers extends VKAPIRequest<PickerStickersResult> {
    private static final String BASE_URL_KEY = "baseUrl";
    private static final String STICKER_IDS_KEY = "stickerIds";

    public static PickerStickersResult getCached() {
        PickerStickersResult res = new PickerStickersResult();
        res.baseUrl = Prefs.pickerPrefs().getString(BASE_URL_KEY);
        try {
            res.stickerIds = parseIntArray(new JSONArray(Prefs.pickerPrefs().getString(STICKER_IDS_KEY)));
        } catch (Exception e) {
            res.stickerIds = new int[0];
        }
        return res;
    }

    public static void loadFromServer() {
        new PickerStickers().setCallback(new Callback<PickerStickersResult>() { // from class: com.vk.attachpicker.util.PickerStickers.1
            @Override // com.vkontakte.android.api.Callback
            public void success(PickerStickersResult result) {
                if (result != null) {
                    try {
                        result.saveToCache();
                    } catch (JSONException e) {
                    }
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
            }
        }).exec();
    }

    public PickerStickers() {
        super("photos.getEditorStickers");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PickerStickersResult mo1093parse(JSONObject o) {
        try {
            JSONObject p = o.getJSONObject(ServerKeys.RESPONSE);
            PickerStickersResult r = new PickerStickersResult();
            r.baseUrl = p.getString("base_url");
            r.stickerIds = parseIntArray(p.getJSONArray("sticker_ids"));
            return r;
        } catch (Exception e) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public static class PickerStickersResult {
        public String baseUrl;
        public int[] stickerIds;

        public void saveToCache() throws JSONException {
            Prefs.pickerPrefs().edit().putString(PickerStickers.BASE_URL_KEY, this.baseUrl).putString(PickerStickers.STICKER_IDS_KEY, PickerStickers.intArray(this.stickerIds).toString()).commit();
        }
    }

    private static int[] parseIntArray(JSONArray jsonArray) {
        int[] arr = new int[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++) {
            arr[i] = jsonArray.optInt(i);
        }
        return arr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static JSONArray intArray(int[] array) {
        JSONArray jsonArray = new JSONArray();
        for (int i : array) {
            jsonArray.put(i);
        }
        return jsonArray;
    }
}
