package com.google.android.exoplayer2.extractor;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class DefaultExtractorsFactory implements ExtractorsFactory {
    private static List<Class<? extends Extractor>> defaultExtractorClasses;

    public DefaultExtractorsFactory() {
        synchronized (DefaultExtractorsFactory.class) {
            if (defaultExtractorClasses == null) {
                ArrayList arrayList = new ArrayList();
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.mkv.MatroskaExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.mp4.FragmentedMp4Extractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e2) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.mp4.Mp4Extractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e3) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.mp3.Mp3Extractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e4) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.ts.AdtsExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e5) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.ts.Ac3Extractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e6) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.ts.TsExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e7) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.flv.FlvExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e8) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.ogg.OggExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e9) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.ts.PsExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e10) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.extractor.wav.WavExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e11) {
                }
                try {
                    arrayList.add(Class.forName("com.google.android.exoplayer2.ext.flac.FlacExtractor").asSubclass(Extractor.class));
                } catch (ClassNotFoundException e12) {
                }
                defaultExtractorClasses = arrayList;
            }
        }
    }

    @Override // com.google.android.exoplayer2.extractor.ExtractorsFactory
    public Extractor[] createExtractors() {
        Extractor[] extractors = new Extractor[defaultExtractorClasses.size()];
        for (int i = 0; i < extractors.length; i++) {
            try {
                extractors[i] = defaultExtractorClasses.get(i).getConstructor(new Class[0]).newInstance(new Object[0]);
            } catch (Exception e) {
                throw new IllegalStateException("Unexpected error creating default extractor", e);
            }
        }
        return extractors;
    }
}
