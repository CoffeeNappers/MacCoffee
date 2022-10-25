package com.vk.attachpicker;

import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class EditorAnalytics {
    private static final String TYPE_CROP = "crop";
    private static final String TYPE_DRAW = "draw";
    private static final String TYPE_EMOJI = "emoji";
    private static final String TYPE_ENHANCE = "enhance";
    private static final String TYPE_FILTER = "filter";
    private static final String TYPE_STICKER = "sticker";
    private static final String TYPE_TEXT = "text";
    private final HashMap<String, Action> actionsMap = new HashMap<>();
    private final String eventName;
    private Integer length;
    private String type;

    public static EditorAnalytics imageEditorAnalytics() {
        return new EditorAnalytics("photoeditor");
    }

    public static EditorAnalytics storiesAnalytics() {
        return new EditorAnalytics("stories_creation");
    }

    private EditorAnalytics(String eventName) {
        this.eventName = eventName;
    }

    public void clear() {
        this.actionsMap.clear();
        this.type = null;
        this.length = null;
    }

    public void type(String type) {
        this.type = type;
    }

    public void length(int length) {
        this.length = Integer.valueOf(length);
    }

    public void logStickers(Collection<String> ids, boolean isFinal) {
        StickerAction stickerAction = (StickerAction) this.actionsMap.get(TYPE_STICKER);
        if (stickerAction == null) {
            stickerAction = new StickerAction(TYPE_STICKER);
            this.actionsMap.put(TYPE_STICKER, stickerAction);
        }
        stickerAction.ids.clear();
        if (ids != null) {
            stickerAction.ids.addAll(ids);
        }
        stickerAction.isFinal = isFinal;
    }

    private void logAction(String type, boolean isFinal) {
        Action action = this.actionsMap.get(type);
        if (action == null) {
            action = new Action(type);
            this.actionsMap.put(type, action);
        }
        action.isFinal = isFinal;
    }

    public void logEmoji(boolean isFinal) {
        logAction(TYPE_EMOJI, isFinal);
    }

    public void logText(boolean isFinal) {
        logAction("text", isFinal);
    }

    public void logCrop(boolean isFinal) {
        logAction(TYPE_CROP, isFinal);
    }

    public void logEnhance(boolean isFinal) {
        logAction(TYPE_ENHANCE, isFinal);
    }

    public void logFilter(boolean isFinal) {
        logAction("filter", isFinal);
    }

    public void logDraw(boolean isFinal) {
        logAction(TYPE_DRAW, isFinal);
    }

    public void flush() {
        Picker.runDelayed(EditorAnalytics$$Lambda$1.lambdaFactory$(this), 1000L);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$flush$0() {
        if (this.actionsMap.size() != 0 || this.type != null || this.length != null) {
            JSONObject jo = new JSONObject();
            try {
                jo.put("e", this.eventName);
                if (this.type != null) {
                    jo.put(ServerKeys.TYPE, this.type);
                }
                if (this.length != null) {
                    jo.put("length", this.length);
                }
                JSONArray actions = new JSONArray();
                for (Map.Entry<String, Action> e : this.actionsMap.entrySet()) {
                    JSONObject a = new JSONObject();
                    a.put(NativeProtocol.WEB_DIALOG_ACTION, e.getValue().title);
                    if (e.getValue().isFinal) {
                        a.put("final", 1);
                    }
                    if (e.getValue() instanceof StickerAction) {
                        StickerAction stickerAction = (StickerAction) e.getValue();
                        if (stickerAction.ids.size() > 0) {
                            JSONArray ja = new JSONArray();
                            Iterator<String> it = stickerAction.ids.iterator();
                            while (it.hasNext()) {
                                String i = it.next();
                                ja.put(i);
                            }
                            a.put("sticker_ids", ja);
                        }
                    }
                    actions.put(a);
                }
                jo.put("actions", actions);
            } catch (Exception e2) {
            }
            new VKAPIRequest("stats.trackEvents").param("events", "[" + jo.toString() + "]").exec();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Action {
        public boolean isFinal;
        public final String title;

        public Action(String title) {
            this.title = title;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class StickerAction extends Action {
        public final ArrayList<String> ids;

        public StickerAction(String title) {
            super(title);
            this.ids = new ArrayList<>();
        }
    }
}
