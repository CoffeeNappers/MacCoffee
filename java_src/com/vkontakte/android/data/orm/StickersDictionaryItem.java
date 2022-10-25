package com.vkontakte.android.data.orm;

import android.support.annotation.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StickersDictionaryItem {
    @Nullable
    public String base_url;
    public String dictionary_key;
    public int[] promoted_stickers;
    public int[] user_stickers;
    public String[] words;

    public StickersDictionaryItem() {
    }

    public StickersDictionaryItem(JSONObject jsonObject) {
        JSONArray jsonWordsArray = jsonObject.optJSONArray("words");
        if (jsonWordsArray != null) {
            this.words = new String[jsonWordsArray.length()];
            for (int i = 0; i < this.words.length; i++) {
                this.words[i] = jsonWordsArray.optString(i);
            }
        } else {
            this.words = new String[0];
        }
        JSONArray jsonUserStickersArray = jsonObject.optJSONArray("user_stickers");
        if (jsonUserStickersArray != null) {
            this.user_stickers = new int[jsonUserStickersArray.length()];
            for (int i2 = 0; i2 < this.user_stickers.length; i2++) {
                this.user_stickers[i2] = jsonUserStickersArray.optInt(i2);
            }
        } else {
            this.user_stickers = new int[0];
        }
        JSONArray jsonPromotedStickersArray = jsonObject.optJSONArray("promoted_stickers");
        if (jsonPromotedStickersArray != null) {
            this.promoted_stickers = new int[jsonPromotedStickersArray.length()];
            for (int i3 = 0; i3 < this.promoted_stickers.length; i3++) {
                this.promoted_stickers[i3] = jsonPromotedStickersArray.optInt(i3);
            }
            return;
        }
        this.promoted_stickers = new int[0];
    }
}
