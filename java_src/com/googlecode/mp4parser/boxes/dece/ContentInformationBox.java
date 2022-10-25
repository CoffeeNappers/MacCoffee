package com.googlecode.mp4parser.boxes.dece;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.Utf8;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.imagepipeline.common.RotationOptions;
import com.googlecode.mp4parser.AbstractFullBox;
import com.googlecode.mp4parser.RequiresParseDetailAspect;
import java.nio.ByteBuffer;
import java.util.LinkedHashMap;
import java.util.Map;
import org.mp4parser.aspectj.lang.JoinPoint;
import org.mp4parser.aspectj.runtime.reflect.Factory;
/* loaded from: classes2.dex */
public class ContentInformationBox extends AbstractFullBox {
    public static final String TYPE = "cinf";
    private static final JoinPoint.StaticPart ajc$tjp_0 = null;
    private static final JoinPoint.StaticPart ajc$tjp_1 = null;
    private static final JoinPoint.StaticPart ajc$tjp_10 = null;
    private static final JoinPoint.StaticPart ajc$tjp_11 = null;
    private static final JoinPoint.StaticPart ajc$tjp_12 = null;
    private static final JoinPoint.StaticPart ajc$tjp_13 = null;
    private static final JoinPoint.StaticPart ajc$tjp_2 = null;
    private static final JoinPoint.StaticPart ajc$tjp_3 = null;
    private static final JoinPoint.StaticPart ajc$tjp_4 = null;
    private static final JoinPoint.StaticPart ajc$tjp_5 = null;
    private static final JoinPoint.StaticPart ajc$tjp_6 = null;
    private static final JoinPoint.StaticPart ajc$tjp_7 = null;
    private static final JoinPoint.StaticPart ajc$tjp_8 = null;
    private static final JoinPoint.StaticPart ajc$tjp_9 = null;
    Map<String, String> brandEntries;
    String codecs;
    Map<String, String> idEntries;
    String languages;
    String mimeSubtypeName;
    String profileLevelIdc;
    String protection;

    static {
        ajc$preClinit();
    }

    private static void ajc$preClinit() {
        Factory factory = new Factory("ContentInformationBox.java", ContentInformationBox.class);
        ajc$tjp_0 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getMimeSubtypeName", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.lang.String"), 144);
        ajc$tjp_1 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setMimeSubtypeName", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.lang.String", "mimeSubtypeName", "", "void"), 148);
        ajc$tjp_10 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getBrandEntries", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.util.Map"), 184);
        ajc$tjp_11 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setBrandEntries", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.util.Map", "brandEntries", "", "void"), 188);
        ajc$tjp_12 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getIdEntries", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.util.Map"), 192);
        ajc$tjp_13 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setIdEntries", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.util.Map", "idEntries", "", "void"), 196);
        ajc$tjp_2 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getProfileLevelIdc", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.lang.String"), 152);
        ajc$tjp_3 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setProfileLevelIdc", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.lang.String", "profileLevelIdc", "", "void"), 156);
        ajc$tjp_4 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getCodecs", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.lang.String"), 160);
        ajc$tjp_5 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setCodecs", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.lang.String", "codecs", "", "void"), 164);
        ajc$tjp_6 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getProtection", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.lang.String"), 168);
        ajc$tjp_7 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setProtection", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.lang.String", "protection", "", "void"), 172);
        ajc$tjp_8 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getLanguages", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "", "", "", "java.lang.String"), 176);
        ajc$tjp_9 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setLanguages", "com.googlecode.mp4parser.boxes.dece.ContentInformationBox", "java.lang.String", "languages", "", "void"), RotationOptions.ROTATE_180);
    }

    public ContentInformationBox() {
        super(TYPE);
        this.brandEntries = new LinkedHashMap();
        this.idEntries = new LinkedHashMap();
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected long getContentSize() {
        long size = 4 + Utf8.utf8StringLengthInBytes(this.mimeSubtypeName) + 1;
        long size2 = size + Utf8.utf8StringLengthInBytes(this.profileLevelIdc) + 1 + Utf8.utf8StringLengthInBytes(this.codecs) + 1 + Utf8.utf8StringLengthInBytes(this.protection) + 1 + Utf8.utf8StringLengthInBytes(this.languages) + 1 + 1;
        for (Map.Entry brandEntry : this.brandEntries.entrySet()) {
            size2 = size2 + Utf8.utf8StringLengthInBytes(brandEntry.getKey()) + 1 + Utf8.utf8StringLengthInBytes(brandEntry.getValue()) + 1;
        }
        long size3 = size2 + 1;
        for (Map.Entry idEntry : this.idEntries.entrySet()) {
            size3 = size3 + Utf8.utf8StringLengthInBytes(idEntry.getKey()) + 1 + Utf8.utf8StringLengthInBytes(idEntry.getValue()) + 1;
        }
        return size3;
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected void getContent(ByteBuffer byteBuffer) {
        writeVersionAndFlags(byteBuffer);
        IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, this.mimeSubtypeName);
        IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, this.profileLevelIdc);
        IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, this.codecs);
        IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, this.protection);
        IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, this.languages);
        IsoTypeWriter.writeUInt8(byteBuffer, this.brandEntries.size());
        for (Map.Entry brandEntry : this.brandEntries.entrySet()) {
            IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, brandEntry.getKey());
            IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, brandEntry.getValue());
        }
        IsoTypeWriter.writeUInt8(byteBuffer, this.idEntries.size());
        for (Map.Entry idEntry : this.idEntries.entrySet()) {
            IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, idEntry.getKey());
            IsoTypeWriter.writeZeroTermUtf8String(byteBuffer, idEntry.getValue());
        }
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected void _parseDetails(ByteBuffer content) {
        parseVersionAndFlags(content);
        this.mimeSubtypeName = IsoTypeReader.readString(content);
        this.profileLevelIdc = IsoTypeReader.readString(content);
        this.codecs = IsoTypeReader.readString(content);
        this.protection = IsoTypeReader.readString(content);
        this.languages = IsoTypeReader.readString(content);
        int brandEntryCount = IsoTypeReader.readUInt8(content);
        while (true) {
            int brandEntryCount2 = brandEntryCount;
            brandEntryCount = brandEntryCount2 - 1;
            if (brandEntryCount2 <= 0) {
                break;
            }
            this.brandEntries.put(IsoTypeReader.readString(content), IsoTypeReader.readString(content));
        }
        int idEntryCount = IsoTypeReader.readUInt8(content);
        while (true) {
            int idEntryCount2 = idEntryCount;
            idEntryCount = idEntryCount2 - 1;
            if (idEntryCount2 > 0) {
                this.idEntries.put(IsoTypeReader.readString(content), IsoTypeReader.readString(content));
            } else {
                return;
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class BrandEntry {
        String iso_brand;
        String version;

        public BrandEntry(String iso_brand, String version) {
            this.iso_brand = iso_brand;
            this.version = version;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            BrandEntry that = (BrandEntry) o;
            if (this.iso_brand == null ? that.iso_brand != null : !this.iso_brand.equals(that.iso_brand)) {
                return false;
            }
            if (this.version != null) {
                if (this.version.equals(that.version)) {
                    return true;
                }
            } else if (that.version == null) {
                return true;
            }
            return false;
        }

        public int hashCode() {
            int i = 0;
            int result = this.iso_brand != null ? this.iso_brand.hashCode() : 0;
            int i2 = result * 31;
            if (this.version != null) {
                i = this.version.hashCode();
            }
            int result2 = i2 + i;
            return result2;
        }
    }

    public String getMimeSubtypeName() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_0, this, this));
        return this.mimeSubtypeName;
    }

    public void setMimeSubtypeName(String mimeSubtypeName) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_1, this, this, mimeSubtypeName));
        this.mimeSubtypeName = mimeSubtypeName;
    }

    public String getProfileLevelIdc() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_2, this, this));
        return this.profileLevelIdc;
    }

    public void setProfileLevelIdc(String profileLevelIdc) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_3, this, this, profileLevelIdc));
        this.profileLevelIdc = profileLevelIdc;
    }

    public String getCodecs() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_4, this, this));
        return this.codecs;
    }

    public void setCodecs(String codecs) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_5, this, this, codecs));
        this.codecs = codecs;
    }

    public String getProtection() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_6, this, this));
        return this.protection;
    }

    public void setProtection(String protection) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_7, this, this, protection));
        this.protection = protection;
    }

    public String getLanguages() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_8, this, this));
        return this.languages;
    }

    public void setLanguages(String languages) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_9, this, this, languages));
        this.languages = languages;
    }

    public Map<String, String> getBrandEntries() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_10, this, this));
        return this.brandEntries;
    }

    public void setBrandEntries(Map<String, String> map) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_11, this, this, map));
        this.brandEntries = map;
    }

    public Map<String, String> getIdEntries() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_12, this, this));
        return this.idEntries;
    }

    public void setIdEntries(Map<String, String> map) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_13, this, this, map));
        this.idEntries = map;
    }
}
