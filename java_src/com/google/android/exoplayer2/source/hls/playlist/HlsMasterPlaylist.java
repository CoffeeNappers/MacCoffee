package com.google.android.exoplayer2.source.hls.playlist;

import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.util.MimeTypes;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class HlsMasterPlaylist extends HlsPlaylist {
    public final List<HlsUrl> audios;
    public final Format muxedAudioFormat;
    public final Format muxedCaptionFormat;
    public final List<HlsUrl> subtitles;
    public final List<HlsUrl> variants;

    /* loaded from: classes.dex */
    public static final class HlsUrl {
        public final Format audioFormat;
        public final Format format;
        public final String name;
        public final Format[] textFormats;
        public final String url;
        public final Format videoFormat;

        public static HlsUrl createMediaPlaylistHlsUrl(String baseUri) {
            Format format = Format.createContainerFormat(AppEventsConstants.EVENT_PARAM_VALUE_NO, MimeTypes.APPLICATION_M3U8, null, null, -1, 0, null);
            return new HlsUrl(null, baseUri, format, null, null, null);
        }

        public HlsUrl(String name, String url, Format format, Format videoFormat, Format audioFormat, Format[] textFormats) {
            this.name = name;
            this.url = url;
            this.format = format;
            this.videoFormat = videoFormat;
            this.audioFormat = audioFormat;
            this.textFormats = textFormats;
        }
    }

    public HlsMasterPlaylist(String baseUri, List<HlsUrl> variants, List<HlsUrl> audios, List<HlsUrl> subtitles, Format muxedAudioFormat, Format muxedCaptionFormat) {
        super(baseUri, 0);
        this.variants = Collections.unmodifiableList(variants);
        this.audios = Collections.unmodifiableList(audios);
        this.subtitles = Collections.unmodifiableList(subtitles);
        this.muxedAudioFormat = muxedAudioFormat;
        this.muxedCaptionFormat = muxedCaptionFormat;
    }

    public static HlsMasterPlaylist createSingleVariantMasterPlaylist(String variantUri) {
        List<HlsUrl> variant = Collections.singletonList(HlsUrl.createMediaPlaylistHlsUrl(variantUri));
        List<HlsUrl> emptyList = Collections.emptyList();
        return new HlsMasterPlaylist(null, variant, emptyList, emptyList, null, null);
    }
}
