package com.vk.masks;

import android.content.SharedPreferences;
import com.crashlytics.android.Crashlytics;
import com.vk.attachpicker.util.Prefs;
import com.vk.core.util.FileUtils;
import com.vk.masks.model.Mask;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.VKList;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksStorage {
    private static final String JSON_KEY_FILES_COUNT = "files_count";
    private static final String JSON_KEY_ID = "id";
    private static final String KEY_FILES_COUNT_LIST = "files_count_list";
    private static final String KEY_MASKS_LIST = "masks_list";
    private static final int LIMIT = 60;
    private static final ExecutorService diskExecutor = Executors.newSingleThreadExecutor();
    private static volatile MasksStorage instance;
    private final Prefs diskStorage = new Prefs("masks_storage");
    private final ArrayList<Mask> masksList = new ArrayList<>();
    private final HashMap<String, Integer> masksFilesCount = new HashMap<>();

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized MasksStorage getInstance() {
        MasksStorage masksStorage;
        synchronized (MasksStorage.class) {
            if (instance == null) {
                synchronized (MasksStorage.class) {
                    if (instance == null) {
                        instance = new MasksStorage();
                    }
                }
            }
            masksStorage = instance;
        }
        return masksStorage;
    }

    private MasksStorage() {
        String rawMasksList = this.diskStorage.getString(KEY_MASKS_LIST);
        String rawPathsList = this.diskStorage.getString(KEY_FILES_COUNT_LIST);
        if (rawMasksList != null && rawPathsList != null) {
            try {
                JSONArray jsonMasksList = new JSONArray(rawMasksList);
                for (int i = 0; i < jsonMasksList.length(); i++) {
                    this.masksList.add(new Mask(jsonMasksList.getJSONObject(i)));
                }
                JSONArray jsonPathsList = new JSONArray(rawPathsList);
                for (int i2 = 0; i2 < jsonPathsList.length(); i2++) {
                    JSONObject jo = jsonPathsList.getJSONObject(i2);
                    this.masksFilesCount.put(jo.getString("id"), Integer.valueOf(jo.getInt(JSON_KEY_FILES_COUNT)));
                }
                if (this.masksList.size() != this.masksFilesCount.size()) {
                }
            } catch (Exception e) {
                this.diskStorage.clear();
                Crashlytics.logException(e);
            }
        }
    }

    public boolean hasCachedMasks() {
        return this.masksList.size() > 0;
    }

    public boolean isDownloaded(Mask mask) {
        return this.masksFilesCount.containsKey(mask.getFullId());
    }

    public boolean isInList(Mask mask) {
        int position = -1;
        int i = 0;
        while (true) {
            if (i >= this.masksList.size()) {
                break;
            } else if (!this.masksList.get(i).equals(mask)) {
                i++;
            } else {
                position = i;
                break;
            }
        }
        return position >= 0;
    }

    public int getMaskFilesCount(Mask mask) {
        Integer count = this.masksFilesCount.get(mask.getFullId());
        if (count != null) {
            return count.intValue();
        }
        return -1;
    }

    public VKList<Mask> recentMasks() {
        VKList<Mask> masks = new VKList<>();
        masks.addAll(this.masksList);
        masks.setTotal(masks.size());
        return masks;
    }

    public synchronized void updateMask(Mask mask) {
        int position = -1;
        int i = 0;
        while (true) {
            if (i >= this.masksList.size()) {
                break;
            } else if (!this.masksList.get(i).equals(mask)) {
                i++;
            } else {
                position = i;
                break;
            }
        }
        if (position >= 0) {
            this.masksFilesCount.remove(mask.getFullId());
            this.masksList.set(position, mask);
            dumpToDisk();
        }
    }

    public synchronized void saveNewMask(Mask mask, int filesCount) {
        if (isInList(mask)) {
            this.masksFilesCount.put(mask.getFullId(), Integer.valueOf(filesCount));
        } else {
            this.masksList.add(0, mask);
            this.masksFilesCount.put(mask.getFullId(), Integer.valueOf(filesCount));
            if (this.masksList.size() > 60) {
                deleteMaskInternal(this.masksList.get(this.masksList.size() - 1));
            }
        }
        dumpToDisk();
    }

    public void raiseMask(Mask mask) {
        if (this.masksList.size() >= 2) {
            int position = -1;
            int i = 0;
            while (true) {
                if (i >= this.masksList.size()) {
                    break;
                } else if (!this.masksList.get(i).equals(mask)) {
                    i++;
                } else {
                    position = i;
                    break;
                }
            }
            if (position > 0) {
                Collections.swap(this.masksList, 0, position);
            }
            dumpToDisk();
        }
    }

    public void deleteMask(Mask mask) {
        deleteMaskInternal(mask);
        dumpToDisk();
    }

    public void clear() {
        this.masksList.clear();
        this.masksFilesCount.clear();
        this.diskStorage.clear();
        FileUtils.doubleTryDeleteFile(CameraUtilsEffects.engineDataDir(VKApplication.context));
        FileUtils.doubleTryDeleteFile(CameraUtilsEffects.allEffectsDir(VKApplication.context));
        MasksPrefs.instance().clear();
    }

    private void deleteMaskInternal(final Mask mask) {
        this.masksList.remove(mask);
        this.masksFilesCount.remove(mask.getFullId());
        diskExecutor.submit(new Runnable() { // from class: com.vk.masks.MasksStorage.1
            @Override // java.lang.Runnable
            public void run() {
                File file = CameraUtilsEffects.effectDir(VKApplication.context, mask.getFullId());
                FileUtils.doubleTryDeleteFile(file);
            }
        });
    }

    private void dumpToDisk() {
        if (this.masksList.size() != this.masksFilesCount.size()) {
        }
        final ArrayList<Mask> masksToSave = recentMasks();
        final HashMap<String, Integer> pathsToSave = new HashMap<>(masksToSave.size());
        pathsToSave.putAll(this.masksFilesCount);
        diskExecutor.submit(new Runnable() { // from class: com.vk.masks.MasksStorage.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    SharedPreferences.Editor editor = MasksStorage.this.diskStorage.edit();
                    editor.clear();
                    JSONArray masksJson = new JSONArray();
                    for (int i = 0; i < masksToSave.size(); i++) {
                        masksJson.put(((Mask) masksToSave.get(i)).toJson());
                    }
                    editor.putString(MasksStorage.KEY_MASKS_LIST, masksJson.toString());
                    JSONArray pathsJson = new JSONArray();
                    for (Map.Entry<String, Integer> e : pathsToSave.entrySet()) {
                        JSONObject jo = new JSONObject();
                        jo.put("id", e.getKey());
                        jo.put(MasksStorage.JSON_KEY_FILES_COUNT, e.getValue());
                        pathsJson.put(jo);
                    }
                    editor.putString(MasksStorage.KEY_FILES_COUNT_LIST, pathsJson.toString());
                    editor.commit();
                } catch (Exception e2) {
                    Crashlytics.logException(e2);
                }
            }
        });
    }
}
