package com.google.android.exoplayer2.metadata;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.util.MimeTypes;
/* loaded from: classes.dex */
public interface MetadataDecoderFactory {
    public static final MetadataDecoderFactory DEFAULT = new MetadataDecoderFactory() { // from class: com.google.android.exoplayer2.metadata.MetadataDecoderFactory.1
        @Override // com.google.android.exoplayer2.metadata.MetadataDecoderFactory
        public boolean supportsFormat(Format format) {
            return getDecoderClass(format.sampleMimeType) != null;
        }

        @Override // com.google.android.exoplayer2.metadata.MetadataDecoderFactory
        public MetadataDecoder createDecoder(Format format) {
            try {
                Class<?> clazz = getDecoderClass(format.sampleMimeType);
                if (clazz == null) {
                    throw new IllegalArgumentException("Attempted to create decoder for unsupported format");
                }
                return (MetadataDecoder) clazz.asSubclass(MetadataDecoder.class).getConstructor(new Class[0]).newInstance(new Object[0]);
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
                    case -1248341703:
                        if (mimeType.equals(MimeTypes.APPLICATION_ID3)) {
                            c = 0;
                            break;
                        }
                        break;
                    case 1154383568:
                        if (mimeType.equals(MimeTypes.APPLICATION_EMSG)) {
                            c = 1;
                            break;
                        }
                        break;
                    case 1652648887:
                        if (mimeType.equals(MimeTypes.APPLICATION_SCTE35)) {
                            c = 2;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        return Class.forName("com.google.android.exoplayer2.metadata.id3.Id3Decoder");
                    case 1:
                        return Class.forName("com.google.android.exoplayer2.metadata.emsg.EventMessageDecoder");
                    case 2:
                        return Class.forName("com.google.android.exoplayer2.metadata.scte35.SpliceInfoDecoder");
                    default:
                        return null;
                }
            } catch (ClassNotFoundException e) {
                return null;
            }
        }
    };

    MetadataDecoder createDecoder(Format format);

    boolean supportsFormat(Format format);
}
