package com.facebook.soloader;

import android.content.Context;
import com.facebook.soloader.UnpackingSoSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
/* loaded from: classes.dex */
public final class ExoSoSource extends UnpackingSoSource {
    public ExoSoSource(Context context, String name) {
        super(context, name);
    }

    @Override // com.facebook.soloader.UnpackingSoSource
    protected UnpackingSoSource.Unpacker makeUnpacker() throws IOException {
        return new ExoUnpacker(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public final class ExoUnpacker extends UnpackingSoSource.Unpacker {
        private final FileDso[] mDsos;
        final /* synthetic */ ExoSoSource this$0;

        /*  JADX ERROR: JadxRuntimeException in pass: BlockProcessor
            jadx.core.utils.exceptions.JadxRuntimeException: Found unreachable blocks
            	at jadx.core.dex.visitors.blocks.DominatorTree.sortBlocks(DominatorTree.java:35)
            	at jadx.core.dex.visitors.blocks.DominatorTree.compute(DominatorTree.java:25)
            	at jadx.core.dex.visitors.blocks.BlockProcessor.computeDominators(BlockProcessor.java:203)
            	at jadx.core.dex.visitors.blocks.BlockProcessor.processBlocksTree(BlockProcessor.java:46)
            	at jadx.core.dex.visitors.blocks.BlockProcessor.visit(BlockProcessor.java:40)
            */
        ExoUnpacker(com.facebook.soloader.ExoSoSource r29) throws java.io.IOException {
            /*
                Method dump skipped, instructions count: 437
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.facebook.soloader.ExoSoSource.ExoUnpacker.<init>(com.facebook.soloader.ExoSoSource):void");
        }

        @Override // com.facebook.soloader.UnpackingSoSource.Unpacker
        protected UnpackingSoSource.DsoManifest getDsoManifest() throws IOException {
            return new UnpackingSoSource.DsoManifest(this.mDsos);
        }

        @Override // com.facebook.soloader.UnpackingSoSource.Unpacker
        protected UnpackingSoSource.InputDsoIterator openDsoIterator() throws IOException {
            return new FileBackedInputDsoIterator();
        }

        /* loaded from: classes.dex */
        private final class FileBackedInputDsoIterator extends UnpackingSoSource.InputDsoIterator {
            private int mCurrentDso;

            private FileBackedInputDsoIterator() {
            }

            @Override // com.facebook.soloader.UnpackingSoSource.InputDsoIterator
            public boolean hasNext() {
                return this.mCurrentDso < ExoUnpacker.this.mDsos.length;
            }

            @Override // com.facebook.soloader.UnpackingSoSource.InputDsoIterator
            public UnpackingSoSource.InputDso next() throws IOException {
                FileDso[] fileDsoArr = ExoUnpacker.this.mDsos;
                int i = this.mCurrentDso;
                this.mCurrentDso = i + 1;
                FileDso fileDso = fileDsoArr[i];
                FileInputStream dsoFile = new FileInputStream(fileDso.backingFile);
                try {
                    UnpackingSoSource.InputDso ret = new UnpackingSoSource.InputDso(fileDso, dsoFile);
                    dsoFile = null;
                    return ret;
                } finally {
                    if (dsoFile != null) {
                        dsoFile.close();
                    }
                }
            }
        }
    }

    /* loaded from: classes.dex */
    private static final class FileDso extends UnpackingSoSource.Dso {
        final File backingFile;

        FileDso(String name, String hash, File backingFile) {
            super(name, hash);
            this.backingFile = backingFile;
        }
    }
}
