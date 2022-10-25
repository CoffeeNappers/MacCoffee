package com.googlecode.mp4parser.authoring.tracks;

import com.coremedia.iso.Hex;
import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.boxes.Container;
import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.FileDataSourceImpl;
import com.googlecode.mp4parser.MultiFileDataSourceImpl;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.SampleImpl;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import com.googlecode.mp4parser.authoring.tracks.AbstractH26XTrack;
import com.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderConfigDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderSpecificInfo;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import com.googlecode.mp4parser.boxes.mp4.objectdescriptors.SLConfigDescriptor;
import com.googlecode.mp4parser.util.CastUtils;
import com.googlecode.mp4parser.util.Mp4Arrays;
import com.googlecode.mp4parser.util.Path;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;
/* loaded from: classes2.dex */
public class H263TrackImpl extends AbstractH26XTrack {
    private static Logger LOG = Logger.getLogger(ESDescriptor.class.getName());
    int BINARY;
    int BINARY_ONLY;
    int GRAYSCALE;
    int RECTANGULAR;
    boolean esdsComplete;
    List<ByteBuffer> esdsStuff;
    int fixed_vop_time_increment;
    List<Sample> samples;
    SampleDescriptionBox stsd;
    int vop_time_increment_resolution;

    public H263TrackImpl(DataSource dataSource) throws IOException {
        super(dataSource, false);
        this.RECTANGULAR = 0;
        this.BINARY = 1;
        this.BINARY_ONLY = 2;
        this.GRAYSCALE = 3;
        this.samples = new ArrayList();
        this.esdsStuff = new ArrayList();
        this.esdsComplete = false;
        this.fixed_vop_time_increment = -1;
        this.vop_time_increment_resolution = 0;
        AbstractH26XTrack.LookAhead la = new AbstractH26XTrack.LookAhead(dataSource);
        List<ByteBuffer> nalsInSample = new ArrayList<>();
        int visual_object_verid = 0;
        VisualSampleEntry mp4v = new VisualSampleEntry(VisualSampleEntry.TYPE1);
        this.stsd = new SampleDescriptionBox();
        this.stsd.addBox(mp4v);
        long last_sync_point = 0;
        long last_time_code = -1;
        while (true) {
            ByteBuffer nal = findNextNal(la);
            if (nal != null) {
                ByteBuffer origNal = nal.duplicate();
                int type = IsoTypeReader.readUInt8(nal);
                if (type == 176 || type == 181 || type == 0 || type == 32 || type == 178) {
                    if (!this.esdsComplete) {
                        this.esdsStuff.add(origNal);
                        if (type == 32) {
                            parse0x20Unit(nal, visual_object_verid, mp4v);
                        } else if (type == 181) {
                            visual_object_verid = parse0x05Unit(nal);
                        }
                    }
                } else if (type == 179) {
                    this.esdsComplete = true;
                    BitReaderBuffer bitReaderBuffer = new BitReaderBuffer(nal);
                    int time_code = bitReaderBuffer.readBits(18);
                    last_sync_point = (time_code & 63) + (((time_code >>> 7) & 63) * 60) + (((time_code >>> 13) & 31) * 60 * 60);
                    this.stss.add(Integer.valueOf(this.samples.size() + 1));
                    nalsInSample.add(origNal);
                } else if (type == 182) {
                    BitReaderBuffer brb = new BitReaderBuffer(nal);
                    brb.readBits(2);
                    while (brb.readBool()) {
                        last_sync_point++;
                    }
                    brb.readBool();
                    int i = 0;
                    while (this.vop_time_increment_resolution >= (1 << i)) {
                        i++;
                    }
                    int vop_time_increment = brb.readBits(i);
                    long time_code2 = (this.vop_time_increment_resolution * last_sync_point) + (vop_time_increment % this.vop_time_increment_resolution);
                    if (last_time_code != -1) {
                        this.decodingTimes = Mp4Arrays.copyOfAndAppend(this.decodingTimes, time_code2 - last_time_code);
                    }
                    System.err.println("Frame increment: " + (time_code2 - last_time_code) + " vop time increment: " + vop_time_increment + " last_sync_point: " + last_sync_point + " time_code: " + time_code2);
                    last_time_code = time_code2;
                    nalsInSample.add(origNal);
                    this.samples.add(createSampleObject(nalsInSample));
                    nalsInSample.clear();
                } else {
                    throw new RuntimeException("Got start code I don't know. Ask Sebastian via mp4parser mailing list what to do");
                }
            } else {
                this.decodingTimes = Mp4Arrays.copyOfAndAppend(this.decodingTimes, this.decodingTimes[this.decodingTimes.length - 1]);
                ESDescriptor esDescriptor = new ESDescriptor();
                esDescriptor.setEsId(1);
                DecoderConfigDescriptor decoderConfigDescriptor = new DecoderConfigDescriptor();
                decoderConfigDescriptor.setObjectTypeIndication(32);
                decoderConfigDescriptor.setStreamType(4);
                DecoderSpecificInfo decoderSpecificInfo = new DecoderSpecificInfo();
                Sample s = createSampleObject(this.esdsStuff);
                byte[] data = new byte[CastUtils.l2i(s.getSize())];
                s.asByteBuffer().get(data);
                decoderSpecificInfo.setData(data);
                decoderConfigDescriptor.setDecoderSpecificInfo(decoderSpecificInfo);
                esDescriptor.setDecoderConfigDescriptor(decoderConfigDescriptor);
                SLConfigDescriptor slConfigDescriptor = new SLConfigDescriptor();
                slConfigDescriptor.setPredefined(2);
                esDescriptor.setSlConfigDescriptor(slConfigDescriptor);
                ESDescriptorBox esds = new ESDescriptorBox();
                esds.setEsDescriptor(esDescriptor);
                mp4v.addBox(esds);
                this.trackMetaData.setTimescale(this.vop_time_increment_resolution);
                return;
            }
        }
    }

    private int parse0x05Unit(ByteBuffer nal) {
        BitReaderBuffer brb = new BitReaderBuffer(nal);
        boolean is_visual_object_identifier = brb.readBool();
        if (!is_visual_object_identifier) {
            return 0;
        }
        int visual_object_verid = brb.readBits(4);
        brb.readBits(3);
        return visual_object_verid;
    }

    private void parse0x20Unit(ByteBuffer nal, int visual_object_verid, VisualSampleEntry mp4v) {
        BitReaderBuffer brb = new BitReaderBuffer(nal);
        brb.readBool();
        brb.readBits(8);
        boolean is_object_layer_identifier = brb.readBool();
        int video_object_layer_verid = visual_object_verid;
        if (is_object_layer_identifier) {
            video_object_layer_verid = brb.readBits(4);
            brb.readBits(3);
        }
        int aspect_ratio_info = brb.readBits(4);
        if (aspect_ratio_info == 15) {
            brb.readBits(8);
            brb.readBits(8);
        }
        boolean vol_control_parameters = brb.readBool();
        if (vol_control_parameters) {
            brb.readBits(2);
            brb.readBool();
            boolean vbv_parameters = brb.readBool();
            if (vbv_parameters) {
                throw new RuntimeException("Implemented when needed");
            }
        }
        int video_object_layer_shape = brb.readBits(2);
        if (video_object_layer_shape == this.GRAYSCALE && video_object_layer_verid != 1) {
            brb.readBits(4);
        }
        brb.readBool();
        this.vop_time_increment_resolution = brb.readBits(16);
        brb.readBool();
        boolean fixed_vop_rate = brb.readBool();
        if (fixed_vop_rate) {
            LOG.info("Fixed Frame Rate");
            int i = 0;
            while (this.vop_time_increment_resolution >= (1 << i)) {
                i++;
            }
            this.fixed_vop_time_increment = brb.readBits(i);
        }
        if (video_object_layer_shape != this.BINARY_ONLY) {
            if (video_object_layer_shape == this.RECTANGULAR) {
                brb.readBool();
                int video_object_layer_width = brb.readBits(13);
                mp4v.setWidth(video_object_layer_width);
                brb.readBool();
                int video_object_layer_height = brb.readBits(13);
                mp4v.setHeight(video_object_layer_height);
                brb.readBool();
                return;
            }
            return;
        }
        throw new RuntimeException("Please implmenet me");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.googlecode.mp4parser.authoring.tracks.AbstractH26XTrack
    public Sample createSampleObject(List<? extends ByteBuffer> nals) {
        ByteBuffer startcode = ByteBuffer.wrap(new byte[]{0, 0, 1});
        ByteBuffer[] data = new ByteBuffer[nals.size() * 2];
        for (int i = 0; i < nals.size(); i++) {
            data[i * 2] = startcode;
            data[(i * 2) + 1] = nals.get(i);
        }
        return new SampleImpl(data);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.stsd;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getHandler() {
        return "vide";
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return this.samples;
    }

    public static void main1(String[] args) throws IOException {
        File[] files = new File("C:\\dev\\mp4parser\\frames").listFiles();
        Arrays.sort(files);
        Movie m = new Movie();
        Track track = new H263TrackImpl(new MultiFileDataSourceImpl(files));
        m.addTrack(track);
        DefaultMp4Builder builder = new DefaultMp4Builder();
        Container c = builder.build(m);
        FileOutputStream fos = new FileOutputStream("output.mp4");
        c.writeContainer(Channels.newChannel(fos));
    }

    public static void main(String[] args) throws IOException {
        DataSource ds = new FileDataSourceImpl("C:\\content\\bbb.h263");
        Movie m = new Movie();
        Track track = new H263TrackImpl(ds);
        m.addTrack(track);
        DefaultMp4Builder builder = new DefaultMp4Builder();
        Container c = builder.build(m);
        FileOutputStream fos = new FileOutputStream("output.mp4");
        c.writeContainer(Channels.newChannel(fos));
    }

    public static void main2(String[] args) throws IOException {
        ESDescriptorBox esds = (ESDescriptorBox) Path.getPath(new IsoFile("C:\\content\\bbb.mp4"), "/moov[0]/trak[0]/mdia[0]/minf[0]/stbl[0]/stsd[0]/mp4v[0]/esds[0]");
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        esds.getBox(Channels.newChannel(baos));
        System.err.println(Hex.encodeHex(baos.toByteArray()));
        System.err.println(esds.getEsDescriptor());
        ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
        esds.getBox(Channels.newChannel(baos2));
        System.err.println(Hex.encodeHex(baos2.toByteArray()));
    }
}
