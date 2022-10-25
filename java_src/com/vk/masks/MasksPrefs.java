package com.vk.masks;

import android.text.TextUtils;
import com.vk.attachpicker.util.Prefs;
import com.vk.masks.model.MaskSection;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
/* loaded from: classes2.dex */
public class MasksPrefs extends Prefs {
    private static final String KEY_MASK_SECTIONS = "mask_sections";
    private static final String KEY_MODEL_FILES_COUNT = "engine_model_files_count";
    private static final String KEY_MODEL_VERSION = "engine_model_version";
    private static volatile MasksPrefs globalInstance;

    public static MasksPrefs instance() {
        if (globalInstance == null) {
            synchronized (Prefs.class) {
                if (globalInstance == null) {
                    globalInstance = new MasksPrefs();
                }
            }
        }
        return globalInstance;
    }

    private MasksPrefs() {
        super("masks");
    }

    public ArrayList<MaskSection> getSections() {
        String jsonString = getString(KEY_MASK_SECTIONS);
        if (TextUtils.isEmpty(jsonString)) {
            return new ArrayList<>();
        }
        try {
            JSONArray items = new JSONArray(jsonString);
            ArrayList<MaskSection> sections = new ArrayList<>(items.length());
            for (int i = 0; i < items.length(); i++) {
                sections.add(new MaskSection(items.getJSONObject(i)));
            }
            return sections;
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    public void setSections(ArrayList<MaskSection> sections) throws JSONException {
        if (sections == null) {
            edit().remove(KEY_MASK_SECTIONS);
            return;
        }
        JSONArray items = new JSONArray();
        for (int i = 0; i < sections.size(); i++) {
            items.put(sections.get(i).toJson());
        }
        edit().putString(KEY_MASK_SECTIONS, items.toString()).commit();
    }

    public int getEngineModelVersion() {
        return getInt(KEY_MODEL_VERSION);
    }

    public void setEngineModelVersion(int v) {
        edit().putInt(KEY_MODEL_VERSION, v).apply();
    }

    public int getEngineModelFilesCount() {
        return getInt(KEY_MODEL_FILES_COUNT);
    }

    public void setEngineModelFileCount(int count) {
        edit().putInt(KEY_MODEL_FILES_COUNT, count).apply();
    }
}
