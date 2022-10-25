package com.googlecode.mp4parser.authoring.tracks.ttml;

import com.coremedia.iso.boxes.SampleDescriptionBox;
import com.coremedia.iso.boxes.SubSampleInformationBox;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import com.mp4parser.iso14496.part30.XMLSubtitleSampleEntry;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
/* loaded from: classes2.dex */
public class TtmlTrackImpl extends AbstractTrack {
    SampleDescriptionBox sampleDescriptionBox;
    private long[] sampleDurations;
    List<Sample> samples;
    SubSampleInformationBox subSampleInformationBox;
    TrackMetaData trackMetaData;
    XMLSubtitleSampleEntry xmlSubtitleSampleEntry;

    public TtmlTrackImpl(String name, List<Document> ttmls) throws IOException, ParserConfigurationException, SAXException, XPathExpressionException, URISyntaxException {
        super(name);
        this.trackMetaData = new TrackMetaData();
        this.sampleDescriptionBox = new SampleDescriptionBox();
        this.xmlSubtitleSampleEntry = new XMLSubtitleSampleEntry();
        this.samples = new ArrayList();
        this.subSampleInformationBox = new SubSampleInformationBox();
        extractLanguage(ttmls);
        Set<String> mimeTypes = new HashSet<>();
        this.sampleDurations = new long[ttmls.size()];
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        xpath.setNamespaceContext(TtmlHelpers.NAMESPACE_CONTEXT);
        for (int sampleNo = 0; sampleNo < ttmls.size(); sampleNo++) {
            Document ttml = ttmls.get(sampleNo);
            SubSampleInformationBox.SubSampleEntry subSampleEntry = new SubSampleInformationBox.SubSampleEntry();
            this.subSampleInformationBox.getEntries().add(subSampleEntry);
            subSampleEntry.setSampleDelta(1L);
            this.sampleDurations[sampleNo] = extractDuration(ttml);
            List<byte[]> images = extractImages(ttml);
            mimeTypes.addAll(extractMimeTypes(ttml));
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            TtmlHelpers.pretty(ttml, baos, 4);
            SubSampleInformationBox.SubSampleEntry.SubsampleEntry xmlEntry = new SubSampleInformationBox.SubSampleEntry.SubsampleEntry();
            xmlEntry.setSubsampleSize(baos.size());
            subSampleEntry.getSubsampleEntries().add(xmlEntry);
            for (byte[] image : images) {
                baos.write(image);
                SubSampleInformationBox.SubSampleEntry.SubsampleEntry imageEntry = new SubSampleInformationBox.SubSampleEntry.SubsampleEntry();
                imageEntry.setSubsampleSize(image.length);
                subSampleEntry.getSubsampleEntries().add(imageEntry);
            }
            final byte[] finalSample = baos.toByteArray();
            this.samples.add(new Sample() { // from class: com.googlecode.mp4parser.authoring.tracks.ttml.TtmlTrackImpl.1
                @Override // com.googlecode.mp4parser.authoring.Sample
                public void writeTo(WritableByteChannel channel) throws IOException {
                    channel.write(ByteBuffer.wrap(finalSample));
                }

                @Override // com.googlecode.mp4parser.authoring.Sample
                public long getSize() {
                    return finalSample.length;
                }

                @Override // com.googlecode.mp4parser.authoring.Sample
                public ByteBuffer asByteBuffer() {
                    return ByteBuffer.wrap(finalSample);
                }
            });
        }
        this.xmlSubtitleSampleEntry.setNamespace(join(",", TtmlHelpers.getAllNamespaces(ttmls.get(0))));
        this.xmlSubtitleSampleEntry.setSchemaLocation("");
        this.xmlSubtitleSampleEntry.setAuxiliaryMimeTypes(join(",", (String[]) new ArrayList(mimeTypes).toArray(new String[mimeTypes.size()])));
        this.sampleDescriptionBox.addBox(this.xmlSubtitleSampleEntry);
        this.trackMetaData.setTimescale(30000L);
        this.trackMetaData.setLayer(65535);
    }

    public static String getLanguage(Document document) {
        return document.getDocumentElement().getAttribute("xml:lang");
    }

    protected static List<byte[]> extractImages(Document ttml) throws XPathExpressionException, URISyntaxException, IOException {
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        XPathExpression expr = xpath.compile("//*/@backgroundImage");
        NodeList nl = (NodeList) expr.evaluate(ttml, XPathConstants.NODESET);
        LinkedHashMap<String, String> internalNames2Original = new LinkedHashMap<>();
        int p = 1;
        for (int i = 0; i < nl.getLength(); i++) {
            Node bgImageNode = nl.item(i);
            String uri = bgImageNode.getNodeValue();
            String ext = uri.substring(uri.lastIndexOf("."));
            String internalName = internalNames2Original.get(uri);
            if (internalName == null) {
                internalName = "urn:mp4parser:" + p + ext;
                internalNames2Original.put(internalName, uri);
                p++;
            }
            bgImageNode.setNodeValue(internalName);
        }
        List<byte[]> images = new ArrayList<>();
        if (!internalNames2Original.isEmpty()) {
            for (Map.Entry<String, String> internalName2Original : internalNames2Original.entrySet()) {
                URI pic = new URI(ttml.getDocumentURI()).resolve(internalName2Original.getValue());
                images.add(streamToByteArray(pic.toURL().openStream()));
            }
        }
        return images;
    }

    private static String join(String joiner, String[] i) {
        int i2 = 0;
        StringBuilder result = new StringBuilder();
        for (String s : i) {
            result.append(s).append(joiner);
        }
        if (result.length() > 0) {
            i2 = result.length() - 1;
        }
        result.setLength(i2);
        return result.toString();
    }

    private static long latestTimestamp(Document document) {
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        xpath.setNamespaceContext(TtmlHelpers.NAMESPACE_CONTEXT);
        try {
            XPathExpression xp = xpath.compile("//*[name()='p']");
            NodeList timedNodes = (NodeList) xp.evaluate(document, XPathConstants.NODESET);
            long lastTimeStamp = 0;
            for (int i = 0; i < timedNodes.getLength(); i++) {
                lastTimeStamp = Math.max(TtmlHelpers.getEndTime(timedNodes.item(i)), lastTimeStamp);
            }
            return lastTimeStamp;
        } catch (XPathExpressionException e) {
            throw new RuntimeException(e);
        }
    }

    private static byte[] streamToByteArray(InputStream input) throws IOException {
        byte[] buffer = new byte[8096];
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        while (true) {
            int n = input.read(buffer);
            if (-1 != n) {
                output.write(buffer, 0, n);
            } else {
                return output.toByteArray();
            }
        }
    }

    protected long firstTimestamp(Document document) {
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        xpath.setNamespaceContext(TtmlHelpers.NAMESPACE_CONTEXT);
        try {
            XPathExpression xp = xpath.compile("//*[@begin]");
            NodeList timedNodes = (NodeList) xp.evaluate(document, XPathConstants.NODESET);
            long firstTimestamp = Long.MAX_VALUE;
            for (int i = 0; i < timedNodes.getLength(); i++) {
                firstTimestamp = Math.min(TtmlHelpers.getStartTime(timedNodes.item(i)), firstTimestamp);
            }
            return firstTimestamp;
        } catch (XPathExpressionException e) {
            throw new RuntimeException(e);
        }
    }

    protected long lastTimestamp(Document document) {
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        xpath.setNamespaceContext(TtmlHelpers.NAMESPACE_CONTEXT);
        try {
            XPathExpression xp = xpath.compile("//*[@end]");
            NodeList timedNodes = (NodeList) xp.evaluate(document, XPathConstants.NODESET);
            long lastTimeStamp = 0;
            for (int i = 0; i < timedNodes.getLength(); i++) {
                lastTimeStamp = Math.max(TtmlHelpers.getEndTime(timedNodes.item(i)), lastTimeStamp);
            }
            return lastTimeStamp;
        } catch (XPathExpressionException e) {
            throw new RuntimeException(e);
        }
    }

    protected void extractLanguage(List<Document> ttmls) {
        String firstLang = null;
        for (Document ttml : ttmls) {
            String lang = getLanguage(ttml);
            if (firstLang == null) {
                firstLang = lang;
                this.trackMetaData.setLanguage(Locale.forLanguageTag(lang).getISO3Language());
            } else if (!firstLang.equals(lang)) {
                throw new RuntimeException("Within one Track all sample documents need to have the same language");
            }
        }
    }

    protected List<String> extractMimeTypes(Document ttml) throws XPathExpressionException {
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        XPathExpression expr = xpath.compile("//*/@smpte:backgroundImage");
        NodeList nl = (NodeList) expr.evaluate(ttml, XPathConstants.NODESET);
        Set<String> mimeTypes = new LinkedHashSet<>();
        for (int i = 0; i < nl.getLength(); i++) {
            Node bgImageNode = nl.item(i);
            String uri = bgImageNode.getNodeValue();
            String ext = uri.substring(uri.lastIndexOf("."));
            if (ext.contains("jpg") || ext.contains("jpeg")) {
                mimeTypes.add("image/jpeg");
            } else if (ext.contains("png")) {
                mimeTypes.add("image/png");
            }
        }
        return new ArrayList(mimeTypes);
    }

    long extractDuration(Document ttml) {
        return lastTimestamp(ttml) - firstTimestamp(ttml);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public SampleDescriptionBox getSampleDescriptionBox() {
        return this.sampleDescriptionBox;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        long[] adoptedSampleDuration = new long[this.sampleDurations.length];
        for (int i = 0; i < adoptedSampleDuration.length; i++) {
            adoptedSampleDuration[i] = (this.sampleDurations[i] * this.trackMetaData.getTimescale()) / 1000;
        }
        return adoptedSampleDuration;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public TrackMetaData getTrackMetaData() {
        return this.trackMetaData;
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public String getHandler() {
        return "subt";
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public List<Sample> getSamples() {
        return this.samples;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public SubSampleInformationBox getSubsampleInformationBox() {
        return this.subSampleInformationBox;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }
}
