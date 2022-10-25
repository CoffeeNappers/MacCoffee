package com.vkontakte.android.stickers;

import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.StickersDictionaryItem;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class StickersAutoSuggestDictionary {
    private static final String FILE_NAME = "StickersSuggestDict.dat";
    public static final int MAX_TEXT_LENGTH = 40;
    private Map<String, StickersDictionaryItem> mStickersMap = new HashMap();
    private String mBaseUrl = "";

    public static StickersAutoSuggestDictionary createInstance() {
        String jsonStr = tryReadFromFile(FILE_NAME);
        StickersAutoSuggestDictionary instance = new StickersAutoSuggestDictionary();
        if (!TextUtils.isEmpty(jsonStr)) {
            try {
                instance.initializeWith(new JSONObject(jsonStr));
            } catch (Exception e) {
                Log.e("StickersAutoSuggestDictionary", "Failed to initialize with json" + e.toString());
            }
        }
        return instance;
    }

    private StickersAutoSuggestDictionary() {
    }

    public StickersDictionaryItem getAutoSuggestStickersFor(String enteredText) {
        String dictKey;
        StickersDictionaryItem item = null;
        if (enteredText != null && !enteredText.isEmpty() && enteredText.length() <= 40 && !enteredText.endsWith(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR) && !TextUtils.isEmpty(this.mBaseUrl) && (item = this.mStickersMap.get((dictKey = prepareTextForLookup(enteredText)))) != null) {
            item.base_url = this.mBaseUrl;
            item.dictionary_key = dictKey;
        }
        return item;
    }

    private void addItem(StickersDictionaryItem dictionaryItem) {
        String[] strArr;
        if (dictionaryItem != null && dictionaryItem.words != null) {
            for (String keyword : dictionaryItem.words) {
                if (keyword != null) {
                    this.mStickersMap.put(keyword, dictionaryItem);
                }
            }
        }
    }

    private String prepareTextForLookup(String enteredText) {
        String enteredText2 = enteredText.toLowerCase().replace((char) 1105, (char) 1077);
        while (enteredText2.contains("  ")) {
            enteredText2 = enteredText2.replace("  ", MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
        return enteredText2.replaceAll("^\\s+", "");
    }

    public void clearAndSave() throws Exception {
        this.mBaseUrl = "";
        this.mStickersMap.clear();
        initializeWithJsonAndSave(null);
    }

    public void initializeWithJsonAndSave(JSONObject source) throws Exception {
        initializeWith(source);
        writeToFile(FILE_NAME, source == null ? "" : source.toString());
    }

    private void initializeWith(JSONObject source) throws Exception {
        if (source != null) {
            JSONObject response = source.getJSONObject(ServerKeys.RESPONSE);
            this.mBaseUrl = response.getString("base_url");
            JSONArray jsonDict = response.getJSONArray("dictionary");
            for (int i = 0; i < jsonDict.length(); i++) {
                addItem(new StickersDictionaryItem(jsonDict.getJSONObject(i)));
            }
        }
    }

    private static void writeToFile(String fileName, String outputString) throws Exception {
        try {
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(VKApplication.context.openFileOutput(fileName, 0));
            outputStreamWriter.write(outputString);
            outputStreamWriter.close();
        } catch (Exception e) {
            Log.e("StickersAutoSuggestDictionary", "File write failed: " + e.toString());
        }
    }

    private static String tryReadFromFile(String fileName) {
        try {
            InputStream inputStream = VKApplication.context.openFileInput(fileName);
            if (inputStream == null) {
                return "";
            }
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            StringBuilder stringBuilder = new StringBuilder();
            while (true) {
                String receiveString = bufferedReader.readLine();
                if (receiveString != null) {
                    stringBuilder.append(receiveString);
                } else {
                    inputStream.close();
                    String ret = stringBuilder.toString();
                    return ret;
                }
            }
        } catch (Exception e) {
            Log.e("StickersAutoSuggestDictionary", "Can not read file: " + e.toString());
            return "";
        }
    }
}
