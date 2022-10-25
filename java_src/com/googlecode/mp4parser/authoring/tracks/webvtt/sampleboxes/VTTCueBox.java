package com.googlecode.mp4parser.authoring.tracks.webvtt.sampleboxes;

import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeWriter;
import com.mp4parser.streaming.WriteOnlyBox;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
/* loaded from: classes2.dex */
public class VTTCueBox extends WriteOnlyBox {
    CueIDBox cueIDBox;
    CuePayloadBox cuePayloadBox;
    CueSettingsBox cueSettingsBox;
    CueSourceIDBox cueSourceIDBox;
    CueTimeBox cueTimeBox;

    public VTTCueBox() {
        super("vtcc");
    }

    @Override // com.coremedia.iso.boxes.Box
    public long getSize() {
        long j = 0;
        long size = (this.cueSettingsBox != null ? this.cueSettingsBox.getSize() : 0L) + 8 + (this.cueSourceIDBox != null ? this.cueSourceIDBox.getSize() : 0L) + (this.cueIDBox != null ? this.cueIDBox.getSize() : 0L) + (this.cueTimeBox != null ? this.cueTimeBox.getSize() : 0L);
        if (this.cuePayloadBox != null) {
            j = this.cuePayloadBox.getSize();
        }
        return size + j;
    }

    @Override // com.coremedia.iso.boxes.Box
    public void getBox(WritableByteChannel writableByteChannel) throws IOException {
        ByteBuffer header = ByteBuffer.allocate(8);
        IsoTypeWriter.writeUInt32(header, getSize());
        header.put(IsoFile.fourCCtoBytes(getType()));
        writableByteChannel.write((ByteBuffer) header.rewind());
        if (this.cueSourceIDBox != null) {
            this.cueSourceIDBox.getBox(writableByteChannel);
        }
        if (this.cueIDBox != null) {
            this.cueIDBox.getBox(writableByteChannel);
        }
        if (this.cueTimeBox != null) {
            this.cueTimeBox.getBox(writableByteChannel);
        }
        if (this.cueSettingsBox != null) {
            this.cueSettingsBox.getBox(writableByteChannel);
        }
        if (this.cuePayloadBox != null) {
            this.cuePayloadBox.getBox(writableByteChannel);
        }
    }

    public CueSourceIDBox getCueSourceIDBox() {
        return this.cueSourceIDBox;
    }

    public void setCueSourceIDBox(CueSourceIDBox cueSourceIDBox) {
        this.cueSourceIDBox = cueSourceIDBox;
    }

    public CueIDBox getCueIDBox() {
        return this.cueIDBox;
    }

    public void setCueIDBox(CueIDBox cueIDBox) {
        this.cueIDBox = cueIDBox;
    }

    public CueTimeBox getCueTimeBox() {
        return this.cueTimeBox;
    }

    public void setCueTimeBox(CueTimeBox cueTimeBox) {
        this.cueTimeBox = cueTimeBox;
    }

    public CueSettingsBox getCueSettingsBox() {
        return this.cueSettingsBox;
    }

    public void setCueSettingsBox(CueSettingsBox cueSettingsBox) {
        this.cueSettingsBox = cueSettingsBox;
    }

    public CuePayloadBox getCuePayloadBox() {
        return this.cuePayloadBox;
    }

    public void setCuePayloadBox(CuePayloadBox cuePayloadBox) {
        this.cuePayloadBox = cuePayloadBox;
    }
}
