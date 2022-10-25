package net.ypresto.androidtranscoder.format;
/* loaded from: classes.dex */
public class MediaFormatStrategyPresets {
    public static final int AUDIO_BITRATE_AS_IS = -1;
    public static final int AUDIO_CHANNELS_AS_IS = -1;
    @Deprecated
    public static final MediaFormatStrategy EXPORT_PRESET_960x540 = new ExportPreset960x540Strategy();

    public static MediaFormatStrategy createAndroid720pStrategy() {
        return new Android720pFormatStrategy();
    }

    public static MediaFormatStrategy createAndroid720pStrategy(int bitrate) {
        return new Android720pFormatStrategy(bitrate);
    }

    public static MediaFormatStrategy createAndroid720pStrategy(int bitrate, int audioBitrate, int audioChannels) {
        return new Android720pFormatStrategy(bitrate, audioBitrate, audioChannels);
    }

    public static MediaFormatStrategy createExportPreset960x540Strategy() {
        return new ExportPreset960x540Strategy();
    }

    private MediaFormatStrategyPresets() {
    }
}
