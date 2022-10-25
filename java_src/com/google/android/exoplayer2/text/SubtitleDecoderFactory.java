package com.google.android.exoplayer2.text;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.util.MimeTypes;
/* loaded from: classes.dex */
public interface SubtitleDecoderFactory {
    public static final SubtitleDecoderFactory DEFAULT = new SubtitleDecoderFactory() { // from class: com.google.android.exoplayer2.text.SubtitleDecoderFactory.1
        @Override // com.google.android.exoplayer2.text.SubtitleDecoderFactory
        public boolean supportsFormat(Format format) {
            return getDecoderClass(format.sampleMimeType) != null;
        }

        @Override // com.google.android.exoplayer2.text.SubtitleDecoderFactory
        public SubtitleDecoder createDecoder(Format format) {
            try {
                Class<?> clazz = getDecoderClass(format.sampleMimeType);
                if (clazz == null) {
                    throw new IllegalArgumentException("Attempted to create decoder for unsupported format");
                }
                return (format.sampleMimeType.equals(MimeTypes.APPLICATION_CEA608) || format.sampleMimeType.equals(MimeTypes.APPLICATION_MP4CEA608)) ? (SubtitleDecoder) clazz.asSubclass(SubtitleDecoder.class).getConstructor(String.class, Integer.TYPE).newInstance(format.sampleMimeType, Integer.valueOf(format.accessibilityChannel)) : format.sampleMimeType.equals(MimeTypes.APPLICATION_CEA708) ? (SubtitleDecoder) clazz.asSubclass(SubtitleDecoder.class).getConstructor(Integer.TYPE).newInstance(Integer.valueOf(format.accessibilityChannel)) : (SubtitleDecoder) clazz.asSubclass(SubtitleDecoder.class).getConstructor(new Class[0]).newInstance(new Object[0]);
            } catch (Exception e) {
                throw new IllegalStateException("Unexpected error instantiating decoder", e);
            }
        }

        private Class<?> getDecoderClass(String mimeType) {
            if (mimeType == null) {
                return null;
            }
            char c = 65535;
            try {
                switch (mimeType.hashCode()) {
                    case -1026075066:
                        if (mimeType.equals(MimeTypes.APPLICATION_MP4VTT)) {
                            c = 2;
                            break;
                        }
                        break;
                    case -1004728940:
                        if (mimeType.equals(MimeTypes.TEXT_VTT)) {
                            c = 0;
                            break;
                        }
                        break;
                    case 691401887:
                        if (mimeType.equals(MimeTypes.APPLICATION_TX3G)) {
                            c = 4;
                            break;
                        }
                        break;
                    case 930165504:
                        if (mimeType.equals(MimeTypes.APPLICATION_MP4CEA608)) {
                            c = 6;
                            break;
                        }
                        break;
                    case 1566015601:
                        if (mimeType.equals(MimeTypes.APPLICATION_CEA608)) {
                            c = 5;
                            break;
                        }
                        break;
                    case 1566016562:
                        if (mimeType.equals(MimeTypes.APPLICATION_CEA708)) {
                            c = 7;
                            break;
                        }
                        break;
                    case 1668750253:
                        if (mimeType.equals(MimeTypes.APPLICATION_SUBRIP)) {
                            c = 3;
                            break;
                        }
                        break;
                    case 1693976202:
                        if (mimeType.equals(MimeTypes.APPLICATION_TTML)) {
                            c = 1;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        return Class.forName("com.google.android.exoplayer2.text.webvtt.WebvttDecoder");
                    case 1:
                        return Class.forName("com.google.android.exoplayer2.text.ttml.TtmlDecoder");
                    case 2:
                        return Class.forName("com.google.android.exoplayer2.text.webvtt.Mp4WebvttDecoder");
                    case 3:
                        return Class.forName("com.google.android.exoplayer2.text.subrip.SubripDecoder");
                    case 4:
                        return Class.forName("com.google.android.exoplayer2.text.tx3g.Tx3gDecoder");
                    case 5:
                    case 6:
                        return Class.forName("com.google.android.exoplayer2.text.cea.Cea608Decoder");
                    case 7:
                        return Class.forName("com.google.android.exoplayer2.text.cea.Cea708Decoder");
                    default:
                        return null;
                }
            } catch (ClassNotFoundException e) {
                return null;
            }
        }
    };

    SubtitleDecoder createDecoder(Format format);

    boolean supportsFormat(Format format);
}
