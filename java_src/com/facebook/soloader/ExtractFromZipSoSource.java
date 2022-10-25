package com.facebook.soloader;

import android.content.Context;
import com.facebook.soloader.UnpackingSoSource;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
/* loaded from: classes.dex */
public class ExtractFromZipSoSource extends UnpackingSoSource {
    protected final File mZipFileName;
    protected final String mZipSearchPattern;

    public ExtractFromZipSoSource(Context context, String name, File zipFileName, String zipSearchPattern) {
        super(context, name);
        this.mZipFileName = zipFileName;
        this.mZipSearchPattern = zipSearchPattern;
    }

    @Override // com.facebook.soloader.UnpackingSoSource
    protected UnpackingSoSource.Unpacker makeUnpacker() throws IOException {
        return new ZipUnpacker();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public class ZipUnpacker extends UnpackingSoSource.Unpacker {
        private ZipDso[] mDsos;
        private final ZipFile mZipFile;

        /* JADX INFO: Access modifiers changed from: package-private */
        public ZipUnpacker() throws IOException {
            this.mZipFile = new ZipFile(ExtractFromZipSoSource.this.mZipFileName);
        }

        final ZipDso[] ensureDsos() {
            ZipDso so;
            if (this.mDsos == null) {
                HashMap<String, ZipDso> providedLibraries = new HashMap<>();
                Pattern zipSearchPattern = Pattern.compile(ExtractFromZipSoSource.this.mZipSearchPattern);
                String[] supportedAbis = SysUtil.getSupportedAbis();
                Enumeration<? extends ZipEntry> entries = this.mZipFile.entries();
                while (entries.hasMoreElements()) {
                    ZipEntry entry = entries.nextElement();
                    Matcher m = zipSearchPattern.matcher(entry.getName());
                    if (m.matches()) {
                        String libraryAbi = m.group(1);
                        String soName = m.group(2);
                        int abiScore = SysUtil.findAbiScore(supportedAbis, libraryAbi);
                        if (abiScore >= 0 && ((so = providedLibraries.get(soName)) == null || abiScore < so.abiScore)) {
                            providedLibraries.put(soName, new ZipDso(soName, entry, abiScore));
                        }
                    }
                }
                ZipDso[] dsos = (ZipDso[]) providedLibraries.values().toArray(new ZipDso[providedLibraries.size()]);
                Arrays.sort(dsos);
                int nrFilteredDsos = 0;
                for (int i = 0; i < dsos.length; i++) {
                    ZipDso zd = dsos[i];
                    if (shouldExtract(zd.backingEntry, zd.name)) {
                        nrFilteredDsos++;
                    } else {
                        dsos[i] = null;
                    }
                }
                ZipDso[] filteredDsos = new ZipDso[nrFilteredDsos];
                int j = 0;
                for (ZipDso zd2 : dsos) {
                    if (zd2 != null) {
                        filteredDsos[j] = zd2;
                        j++;
                    }
                }
                this.mDsos = filteredDsos;
            }
            return this.mDsos;
        }

        protected boolean shouldExtract(ZipEntry ze, String soName) {
            return true;
        }

        @Override // com.facebook.soloader.UnpackingSoSource.Unpacker, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.mZipFile.close();
        }

        @Override // com.facebook.soloader.UnpackingSoSource.Unpacker
        protected final UnpackingSoSource.DsoManifest getDsoManifest() throws IOException {
            return new UnpackingSoSource.DsoManifest(ensureDsos());
        }

        @Override // com.facebook.soloader.UnpackingSoSource.Unpacker
        protected final UnpackingSoSource.InputDsoIterator openDsoIterator() throws IOException {
            return new ZipBackedInputDsoIterator();
        }

        /* loaded from: classes.dex */
        private final class ZipBackedInputDsoIterator extends UnpackingSoSource.InputDsoIterator {
            private int mCurrentDso;

            private ZipBackedInputDsoIterator() {
            }

            @Override // com.facebook.soloader.UnpackingSoSource.InputDsoIterator
            public boolean hasNext() {
                ZipUnpacker.this.ensureDsos();
                return this.mCurrentDso < ZipUnpacker.this.mDsos.length;
            }

            @Override // com.facebook.soloader.UnpackingSoSource.InputDsoIterator
            public UnpackingSoSource.InputDso next() throws IOException {
                ZipUnpacker.this.ensureDsos();
                ZipDso[] zipDsoArr = ZipUnpacker.this.mDsos;
                int i = this.mCurrentDso;
                this.mCurrentDso = i + 1;
                ZipDso zipDso = zipDsoArr[i];
                InputStream is = ZipUnpacker.this.mZipFile.getInputStream(zipDso.backingEntry);
                try {
                    UnpackingSoSource.InputDso ret = new UnpackingSoSource.InputDso(zipDso, is);
                    is = null;
                    return ret;
                } finally {
                    if (is != null) {
                        is.close();
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class ZipDso extends UnpackingSoSource.Dso implements Comparable {
        final int abiScore;
        final ZipEntry backingEntry;

        ZipDso(String name, ZipEntry backingEntry, int abiScore) {
            super(name, makePseudoHash(backingEntry));
            this.backingEntry = backingEntry;
            this.abiScore = abiScore;
        }

        private static String makePseudoHash(ZipEntry ze) {
            return String.format("pseudo-zip-hash-1-%s-%s-%s-%s", ze.getName(), Long.valueOf(ze.getSize()), Long.valueOf(ze.getCompressedSize()), Long.valueOf(ze.getCrc()));
        }

        @Override // java.lang.Comparable
        public int compareTo(Object other) {
            return this.name.compareTo(((ZipDso) other).name);
        }
    }
}
