package com.mp4parser.streaming;

import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.TrackHeaderBox;
import java.util.HashMap;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
/* loaded from: classes2.dex */
public abstract class AbstractStreamingTrack implements StreamingTrack {
    protected SampleDescriptionBox stsd;
    protected BlockingQueue<StreamingSample> samples = new ArrayBlockingQueue(1000);
    protected HashMap<Class<? extends TrackExtension>, TrackExtension> trackExtensions = new HashMap<>();
    protected TrackHeaderBox tkhd = new TrackHeaderBox();

    public AbstractStreamingTrack() {
        this.tkhd.setTrackId(1L);
    }

    @Override // com.mp4parser.streaming.StreamingTrack
    public BlockingQueue<StreamingSample> getSamples() {
        return this.samples;
    }

    @Override // com.mp4parser.streaming.StreamingTrack
    public boolean hasMoreSamples() {
        return false;
    }

    @Override // com.mp4parser.streaming.StreamingTrack
    public TrackHeaderBox getTrackHeaderBox() {
        return this.tkhd;
    }

    @Override // com.mp4parser.streaming.StreamingTrack
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.stsd;
    }

    @Override // com.mp4parser.streaming.StreamingTrack
    public <T extends TrackExtension> T getTrackExtension(Class<T> clazz) {
        return (T) this.trackExtensions.get(clazz);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mp4parser.streaming.StreamingTrack
    public void addTrackExtension(TrackExtension trackExtension) {
        this.trackExtensions.put(trackExtension.getClass(), trackExtension);
    }

    @Override // com.mp4parser.streaming.StreamingTrack
    public void removeTrackExtension(Class<? extends TrackExtension> clazz) {
        this.trackExtensions.remove(clazz);
    }
}
