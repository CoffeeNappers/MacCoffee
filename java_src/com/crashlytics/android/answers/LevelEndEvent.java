package com.crashlytics.android.answers;
/* loaded from: classes.dex */
public class LevelEndEvent extends PredefinedEvent<LevelEndEvent> {
    static final String LEVEL_NAME_ATTRIBUTE = "levelName";
    static final String SCORE_ATTRIBUTE = "score";
    static final String SUCCESS_ATTRIBUTE = "success";
    static final String TYPE = "levelEnd";

    public LevelEndEvent putLevelName(String levelName) {
        this.predefinedAttributes.put(LEVEL_NAME_ATTRIBUTE, levelName);
        return this;
    }

    public LevelEndEvent putScore(Number score) {
        this.predefinedAttributes.put("score", score);
        return this;
    }

    public LevelEndEvent putSuccess(boolean success) {
        this.predefinedAttributes.put("success", success ? "true" : "false");
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.crashlytics.android.answers.PredefinedEvent
    public String getPredefinedType() {
        return TYPE;
    }
}
