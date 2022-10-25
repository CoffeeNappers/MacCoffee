package com.googlecode.mp4parser.authoring.tracks;

import com.googlecode.mp4parser.authoring.Track;
import com.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import java.util.List;
import java.util.UUID;
/* loaded from: classes2.dex */
public interface CencEncryptedTrack extends Track {
    UUID getDefaultKeyId();

    List<CencSampleAuxiliaryDataFormat> getSampleEncryptionEntries();

    boolean hasSubSampleEncryption();
}
