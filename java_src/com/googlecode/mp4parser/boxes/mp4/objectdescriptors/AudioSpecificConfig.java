package com.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import com.coremedia.iso.Hex;
import com.coremedia.iso.IsoTypeWriter;
import com.google.android.gms.safetynet.SafetyNetStatusCodes;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
@Descriptor(objectTypeIndication = 64, tags = {5})
/* loaded from: classes.dex */
public class AudioSpecificConfig extends BaseDescriptor {
    public boolean aacScalefactorDataResilienceFlag;
    public boolean aacSectionDataResilienceFlag;
    public boolean aacSpectralDataResilienceFlag;
    public int audioObjectType;
    public int channelConfiguration;
    byte[] configBytes;
    public int coreCoderDelay;
    public int dependsOnCoreCoder;
    public int directMapping;
    public ELDSpecificConfig eldSpecificConfig;
    public int epConfig;
    public int erHvxcExtensionFlag;
    public int extensionAudioObjectType;
    public int extensionChannelConfiguration;
    public int extensionFlag;
    public int extensionFlag3;
    public int extensionSamplingFrequency;
    public int fillBits;
    public int frameLengthFlag;
    public boolean gaSpecificConfig;
    public int hilnContMode;
    public int hilnEnhaLayer;
    public int hilnEnhaQuantMode;
    public int hilnFrameLength;
    public int hilnMaxNumLine;
    public int hilnQuantMode;
    public int hilnSampleRateCode;
    public int hvxcRateMode;
    public int hvxcVarMode;
    public int isBaseLayer;
    public int layerNr;
    public int layer_length;
    public int numOfSubFrame;
    public int origExtensionAudioObjectType;
    public int originalAudioObjectType;
    public int paraExtensionFlag;
    public int paraMode;
    public boolean parametricSpecificConfig;
    public boolean psPresentFlag;
    public int sacPayloadEmbedding;
    public int samplingFrequency;
    public int samplingFrequencyIndex;
    public boolean sbrPresentFlag;
    public int var_ScalableFlag;
    public static Map<Integer, Integer> samplingFrequencyIndexMap = new HashMap();
    public static Map<Integer, String> audioObjectTypeMap = new HashMap();
    public int extensionSamplingFrequencyIndex = -1;
    public int syncExtensionType = -1;
    public int innerSyncExtensionType = -1;
    public int outerSyncExtensionType = -1;
    boolean parsed = false;

    static {
        samplingFrequencyIndexMap.put(0, 96000);
        samplingFrequencyIndexMap.put(1, 88200);
        samplingFrequencyIndexMap.put(2, Integer.valueOf((int) SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT));
        samplingFrequencyIndexMap.put(3, 48000);
        samplingFrequencyIndexMap.put(4, 44100);
        samplingFrequencyIndexMap.put(5, 32000);
        samplingFrequencyIndexMap.put(6, 24000);
        samplingFrequencyIndexMap.put(7, 22050);
        samplingFrequencyIndexMap.put(8, 16000);
        samplingFrequencyIndexMap.put(9, Integer.valueOf((int) SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES));
        samplingFrequencyIndexMap.put(10, 11025);
        samplingFrequencyIndexMap.put(11, 8000);
        audioObjectTypeMap.put(1, "AAC main");
        audioObjectTypeMap.put(2, "AAC LC");
        audioObjectTypeMap.put(3, "AAC SSR");
        audioObjectTypeMap.put(4, "AAC LTP");
        audioObjectTypeMap.put(5, "SBR");
        audioObjectTypeMap.put(6, "AAC Scalable");
        audioObjectTypeMap.put(7, "TwinVQ");
        audioObjectTypeMap.put(8, "CELP");
        audioObjectTypeMap.put(9, "HVXC");
        audioObjectTypeMap.put(10, "(reserved)");
        audioObjectTypeMap.put(11, "(reserved)");
        audioObjectTypeMap.put(12, "TTSI");
        audioObjectTypeMap.put(13, "Main synthetic");
        audioObjectTypeMap.put(14, "Wavetable synthesis");
        audioObjectTypeMap.put(15, "General MIDI");
        audioObjectTypeMap.put(16, "Algorithmic Synthesis and Audio FX");
        audioObjectTypeMap.put(17, "ER AAC LC");
        audioObjectTypeMap.put(18, "(reserved)");
        audioObjectTypeMap.put(19, "ER AAC LTP");
        audioObjectTypeMap.put(20, "ER AAC Scalable");
        audioObjectTypeMap.put(21, "ER TwinVQ");
        audioObjectTypeMap.put(22, "ER BSAC");
        audioObjectTypeMap.put(23, "ER AAC LD");
        audioObjectTypeMap.put(24, "ER CELP");
        audioObjectTypeMap.put(25, "ER HVXC");
        audioObjectTypeMap.put(26, "ER HILN");
        audioObjectTypeMap.put(27, "ER Parametric");
        audioObjectTypeMap.put(28, "SSC");
        audioObjectTypeMap.put(29, "PS");
        audioObjectTypeMap.put(30, "MPEG Surround");
        audioObjectTypeMap.put(31, "(escape)");
        audioObjectTypeMap.put(32, "Layer-1");
        audioObjectTypeMap.put(33, "Layer-2");
        audioObjectTypeMap.put(34, "Layer-3");
        audioObjectTypeMap.put(35, "DST");
        audioObjectTypeMap.put(36, "ALS");
        audioObjectTypeMap.put(37, "SLS");
        audioObjectTypeMap.put(38, "SLS non-core");
        audioObjectTypeMap.put(39, "ER AAC ELD");
        audioObjectTypeMap.put(40, "SMR Simple");
        audioObjectTypeMap.put(41, "SMR Main");
    }

    public AudioSpecificConfig() {
        this.tag = 5;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public void parseDetail(ByteBuffer bb) throws IOException {
        this.parsed = true;
        ByteBuffer configBytes = bb.slice();
        configBytes.limit(this.sizeOfInstance);
        bb.position(bb.position() + this.sizeOfInstance);
        this.configBytes = new byte[this.sizeOfInstance];
        configBytes.get(this.configBytes);
        configBytes.rewind();
        BitReaderBuffer bitReaderBuffer = new BitReaderBuffer(configBytes);
        int audioObjectType = getAudioObjectType(bitReaderBuffer);
        this.audioObjectType = audioObjectType;
        this.originalAudioObjectType = audioObjectType;
        this.samplingFrequencyIndex = bitReaderBuffer.readBits(4);
        if (this.samplingFrequencyIndex == 15) {
            this.samplingFrequency = bitReaderBuffer.readBits(24);
        }
        this.channelConfiguration = bitReaderBuffer.readBits(4);
        if (this.audioObjectType == 5 || this.audioObjectType == 29) {
            this.extensionAudioObjectType = 5;
            this.sbrPresentFlag = true;
            if (this.audioObjectType == 29) {
                this.psPresentFlag = true;
            }
            this.extensionSamplingFrequencyIndex = bitReaderBuffer.readBits(4);
            if (this.extensionSamplingFrequencyIndex == 15) {
                this.extensionSamplingFrequency = bitReaderBuffer.readBits(24);
            }
            this.audioObjectType = getAudioObjectType(bitReaderBuffer);
            if (this.audioObjectType == 22) {
                this.extensionChannelConfiguration = bitReaderBuffer.readBits(4);
            }
        } else {
            this.extensionAudioObjectType = 0;
        }
        switch (this.audioObjectType) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 6:
            case 7:
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                parseGaSpecificConfig(this.samplingFrequencyIndex, this.channelConfiguration, this.audioObjectType, bitReaderBuffer);
                break;
            case 8:
                throw new UnsupportedOperationException("can't parse CelpSpecificConfig yet");
            case 9:
                throw new UnsupportedOperationException("can't parse HvxcSpecificConfig yet");
            case 12:
                throw new UnsupportedOperationException("can't parse TTSSpecificConfig yet");
            case 13:
            case 14:
            case 15:
            case 16:
                throw new UnsupportedOperationException("can't parse StructuredAudioSpecificConfig yet");
            case 24:
                throw new UnsupportedOperationException("can't parse ErrorResilientCelpSpecificConfig yet");
            case 25:
                throw new UnsupportedOperationException("can't parse ErrorResilientHvxcSpecificConfig yet");
            case 26:
            case 27:
                parseParametricSpecificConfig(this.samplingFrequencyIndex, this.channelConfiguration, this.audioObjectType, bitReaderBuffer);
                break;
            case 28:
                throw new UnsupportedOperationException("can't parse SSCSpecificConfig yet");
            case 30:
                this.sacPayloadEmbedding = bitReaderBuffer.readBits(1);
                throw new UnsupportedOperationException("can't parse SpatialSpecificConfig yet");
            case 32:
            case 33:
            case 34:
                throw new UnsupportedOperationException("can't parse MPEG_1_2_SpecificConfig yet");
            case 35:
                throw new UnsupportedOperationException("can't parse DSTSpecificConfig yet");
            case 36:
                this.fillBits = bitReaderBuffer.readBits(5);
                throw new UnsupportedOperationException("can't parse ALSSpecificConfig yet");
            case 37:
            case 38:
                throw new UnsupportedOperationException("can't parse SLSSpecificConfig yet");
            case 39:
                this.eldSpecificConfig = new ELDSpecificConfig(this.channelConfiguration, bitReaderBuffer);
                break;
            case 40:
            case 41:
                throw new UnsupportedOperationException("can't parse SymbolicMusicSpecificConfig yet");
        }
        switch (this.audioObjectType) {
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 39:
                this.epConfig = bitReaderBuffer.readBits(2);
                if (this.epConfig == 2 || this.epConfig == 3) {
                    throw new UnsupportedOperationException("can't parse ErrorProtectionSpecificConfig yet");
                }
                if (this.epConfig == 3) {
                    this.directMapping = bitReaderBuffer.readBits(1);
                    if (this.directMapping == 0) {
                        throw new RuntimeException("not implemented");
                    }
                }
                break;
        }
        if (this.extensionAudioObjectType != 5 && bitReaderBuffer.remainingBits() >= 16) {
            int readBits = bitReaderBuffer.readBits(11);
            this.syncExtensionType = readBits;
            this.outerSyncExtensionType = readBits;
            if (this.syncExtensionType == 695) {
                this.extensionAudioObjectType = getAudioObjectType(bitReaderBuffer);
                if (this.extensionAudioObjectType == 5) {
                    this.sbrPresentFlag = bitReaderBuffer.readBool();
                    if (this.sbrPresentFlag) {
                        this.extensionSamplingFrequencyIndex = bitReaderBuffer.readBits(4);
                        if (this.extensionSamplingFrequencyIndex == 15) {
                            this.extensionSamplingFrequency = bitReaderBuffer.readBits(24);
                        }
                        if (bitReaderBuffer.remainingBits() >= 12) {
                            int readBits2 = bitReaderBuffer.readBits(11);
                            this.syncExtensionType = readBits2;
                            this.innerSyncExtensionType = readBits2;
                            if (this.syncExtensionType == 1352) {
                                this.psPresentFlag = bitReaderBuffer.readBool();
                            }
                        }
                    }
                }
                if (this.extensionAudioObjectType == 22) {
                    this.sbrPresentFlag = bitReaderBuffer.readBool();
                    if (this.sbrPresentFlag) {
                        this.extensionSamplingFrequencyIndex = bitReaderBuffer.readBits(4);
                        if (this.extensionSamplingFrequencyIndex == 15) {
                            this.extensionSamplingFrequency = bitReaderBuffer.readBits(24);
                        }
                    }
                    this.extensionChannelConfiguration = bitReaderBuffer.readBits(4);
                }
            }
        }
    }

    private int gaSpecificConfigSize() {
        int n = 0 + 1 + 1;
        if (this.dependsOnCoreCoder == 1) {
            n += 14;
        }
        int n2 = n + 1;
        if (this.channelConfiguration == 0) {
            throw new UnsupportedOperationException("can't parse program_config_element yet");
        }
        if (this.audioObjectType == 6 || this.audioObjectType == 20) {
            n2 += 3;
        }
        if (this.extensionFlag == 1) {
            if (this.audioObjectType == 22) {
                n2 = n2 + 5 + 11;
            }
            if (this.audioObjectType == 17 || this.audioObjectType == 19 || this.audioObjectType == 20 || this.audioObjectType == 23) {
                n2 = n2 + 1 + 1 + 1;
            }
            n2++;
            if (this.extensionFlag3 == 1) {
                throw new RuntimeException("Not implemented");
            }
        }
        return n2;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    int getContentSize() {
        int sizeInBits = 5;
        if (this.originalAudioObjectType > 30) {
            sizeInBits = 5 + 6;
        }
        int sizeInBits2 = sizeInBits + 4;
        if (this.samplingFrequencyIndex == 15) {
            sizeInBits2 += 24;
        }
        int sizeInBits3 = sizeInBits2 + 4;
        if (this.audioObjectType == 5 || this.audioObjectType == 29) {
            sizeInBits3 += 4;
            if (this.extensionSamplingFrequencyIndex == 15) {
                sizeInBits3 += 24;
            }
        }
        if (this.audioObjectType == 22) {
            sizeInBits3 += 4;
        }
        if (this.gaSpecificConfig) {
            sizeInBits3 += gaSpecificConfigSize();
        }
        if (this.outerSyncExtensionType >= 0) {
            sizeInBits3 += 11;
            if (this.outerSyncExtensionType == 695) {
                sizeInBits3 += 5;
                if (this.extensionAudioObjectType > 30) {
                    sizeInBits3 += 6;
                }
                if (this.extensionAudioObjectType == 5) {
                    sizeInBits3++;
                    if (this.sbrPresentFlag) {
                        sizeInBits3 += 4;
                        if (this.extensionSamplingFrequencyIndex == 15) {
                            sizeInBits3 += 24;
                        }
                        if (this.innerSyncExtensionType >= 0) {
                            sizeInBits3 += 11;
                            if (this.innerSyncExtensionType == 1352) {
                                sizeInBits3++;
                            }
                        }
                    }
                }
                if (this.extensionAudioObjectType == 22) {
                    int sizeInBits4 = sizeInBits3 + 1;
                    if (this.sbrPresentFlag) {
                        sizeInBits4 += 4;
                        if (this.extensionSamplingFrequencyIndex == 15) {
                            sizeInBits4 += 24;
                        }
                    }
                    sizeInBits3 = sizeInBits4 + 4;
                }
            }
        }
        return (int) Math.ceil(sizeInBits3 / 8.0d);
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public ByteBuffer serialize() {
        ByteBuffer out = ByteBuffer.allocate(getSize());
        IsoTypeWriter.writeUInt8(out, this.tag);
        writeSize(out, getContentSize());
        out.put(serializeConfigBytes());
        return (ByteBuffer) out.rewind();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private ByteBuffer serializeConfigBytes() {
        ByteBuffer out = ByteBuffer.wrap(new byte[getContentSize()]);
        BitWriterBuffer bitWriterBuffer = new BitWriterBuffer(out);
        writeAudioObjectType(this.originalAudioObjectType, bitWriterBuffer);
        bitWriterBuffer.writeBits(this.samplingFrequencyIndex, 4);
        if (this.samplingFrequencyIndex == 15) {
            bitWriterBuffer.writeBits(this.samplingFrequency, 24);
        }
        bitWriterBuffer.writeBits(this.channelConfiguration, 4);
        if (this.audioObjectType == 5 || this.audioObjectType == 29) {
            this.extensionAudioObjectType = 5;
            this.sbrPresentFlag = true;
            if (this.audioObjectType == 29) {
                this.psPresentFlag = true;
            }
            bitWriterBuffer.writeBits(this.extensionSamplingFrequencyIndex, 4);
            if (this.extensionSamplingFrequencyIndex == 15) {
                bitWriterBuffer.writeBits(this.extensionSamplingFrequency, 24);
            }
            writeAudioObjectType(this.audioObjectType, bitWriterBuffer);
            if (this.audioObjectType == 22) {
                bitWriterBuffer.writeBits(this.extensionChannelConfiguration, 4);
            }
        }
        switch (this.audioObjectType) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 6:
            case 7:
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                writeGaSpecificConfig(bitWriterBuffer);
                break;
            case 8:
                throw new UnsupportedOperationException("can't write CelpSpecificConfig yet");
            case 9:
                throw new UnsupportedOperationException("can't write HvxcSpecificConfig yet");
            case 12:
                throw new UnsupportedOperationException("can't write TTSSpecificConfig yet");
            case 13:
            case 14:
            case 15:
            case 16:
                throw new UnsupportedOperationException("can't write StructuredAudioSpecificConfig yet");
            case 24:
                throw new UnsupportedOperationException("can't write ErrorResilientCelpSpecificConfig yet");
            case 25:
                throw new UnsupportedOperationException("can't write ErrorResilientHvxcSpecificConfig yet");
            case 26:
            case 27:
                throw new UnsupportedOperationException("can't write parseParametricSpecificConfig yet");
            case 28:
                throw new UnsupportedOperationException("can't write SSCSpecificConfig yet");
            case 30:
                bitWriterBuffer.writeBits(this.sacPayloadEmbedding, 1);
                throw new UnsupportedOperationException("can't write SpatialSpecificConfig yet");
            case 32:
            case 33:
            case 34:
                throw new UnsupportedOperationException("can't write MPEG_1_2_SpecificConfig yet");
            case 35:
                throw new UnsupportedOperationException("can't write DSTSpecificConfig yet");
            case 36:
                bitWriterBuffer.writeBits(this.fillBits, 5);
                throw new UnsupportedOperationException("can't write ALSSpecificConfig yet");
            case 37:
            case 38:
                throw new UnsupportedOperationException("can't write SLSSpecificConfig yet");
            case 39:
                throw new UnsupportedOperationException("can't write ELDSpecificConfig yet");
            case 40:
            case 41:
                throw new UnsupportedOperationException("can't parse SymbolicMusicSpecificConfig yet");
        }
        switch (this.audioObjectType) {
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 39:
                bitWriterBuffer.writeBits(this.epConfig, 2);
                if (this.epConfig == 2 || this.epConfig == 3) {
                    throw new UnsupportedOperationException("can't parse ErrorProtectionSpecificConfig yet");
                }
                if (this.epConfig == 3) {
                    bitWriterBuffer.writeBits(this.directMapping, 1);
                    if (this.directMapping == 0) {
                        throw new RuntimeException("not implemented");
                    }
                }
                break;
        }
        if (this.outerSyncExtensionType >= 0) {
            bitWriterBuffer.writeBits(this.outerSyncExtensionType, 11);
            if (this.outerSyncExtensionType == 695) {
                writeAudioObjectType(this.extensionAudioObjectType, bitWriterBuffer);
                if (this.extensionAudioObjectType == 5) {
                    bitWriterBuffer.writeBool(this.sbrPresentFlag);
                    if (this.sbrPresentFlag) {
                        bitWriterBuffer.writeBits(this.extensionSamplingFrequencyIndex, 4);
                        if (this.extensionSamplingFrequencyIndex == 15) {
                            bitWriterBuffer.writeBits(this.extensionSamplingFrequency, 24);
                        }
                        if (this.innerSyncExtensionType >= 0) {
                            bitWriterBuffer.writeBits(this.innerSyncExtensionType, 11);
                            if (this.syncExtensionType == 1352) {
                                bitWriterBuffer.writeBool(this.psPresentFlag);
                            }
                        }
                    }
                }
                if (this.extensionAudioObjectType == 22) {
                    bitWriterBuffer.writeBool(this.sbrPresentFlag);
                    if (this.sbrPresentFlag) {
                        bitWriterBuffer.writeBits(this.extensionSamplingFrequencyIndex, 4);
                        if (this.extensionSamplingFrequencyIndex == 15) {
                            bitWriterBuffer.writeBits(this.extensionSamplingFrequency, 24);
                        }
                    }
                    bitWriterBuffer.writeBits(this.extensionChannelConfiguration, 4);
                }
            }
        }
        return (ByteBuffer) out.rewind();
    }

    private void writeAudioObjectType(int audioObjectType, BitWriterBuffer bitWriterBuffer) {
        if (audioObjectType >= 32) {
            bitWriterBuffer.writeBits(31, 5);
            bitWriterBuffer.writeBits(audioObjectType - 32, 6);
            return;
        }
        bitWriterBuffer.writeBits(audioObjectType, 5);
    }

    private int getAudioObjectType(BitReaderBuffer in) throws IOException {
        int audioObjectType = in.readBits(5);
        if (audioObjectType == 31) {
            return in.readBits(6) + 32;
        }
        return audioObjectType;
    }

    private void parseGaSpecificConfig(int samplingFrequencyIndex, int channelConfiguration, int audioObjectType, BitReaderBuffer in) throws IOException {
        this.frameLengthFlag = in.readBits(1);
        this.dependsOnCoreCoder = in.readBits(1);
        if (this.dependsOnCoreCoder == 1) {
            this.coreCoderDelay = in.readBits(14);
        }
        this.extensionFlag = in.readBits(1);
        if (channelConfiguration == 0) {
            throw new UnsupportedOperationException("can't parse program_config_element yet");
        }
        if (audioObjectType == 6 || audioObjectType == 20) {
            this.layerNr = in.readBits(3);
        }
        if (this.extensionFlag == 1) {
            if (audioObjectType == 22) {
                this.numOfSubFrame = in.readBits(5);
                this.layer_length = in.readBits(11);
            }
            if (audioObjectType == 17 || audioObjectType == 19 || audioObjectType == 20 || audioObjectType == 23) {
                this.aacSectionDataResilienceFlag = in.readBool();
                this.aacScalefactorDataResilienceFlag = in.readBool();
                this.aacSpectralDataResilienceFlag = in.readBool();
            }
            this.extensionFlag3 = in.readBits(1);
            if (this.extensionFlag3 == 1) {
                throw new RuntimeException("not yet implemented");
            }
        }
        this.gaSpecificConfig = true;
    }

    private void writeGaSpecificConfig(BitWriterBuffer out) {
        out.writeBits(this.frameLengthFlag, 1);
        out.writeBits(this.dependsOnCoreCoder, 1);
        if (this.dependsOnCoreCoder == 1) {
            out.writeBits(this.coreCoderDelay, 14);
        }
        out.writeBits(this.extensionFlag, 1);
        if (this.channelConfiguration == 0) {
            throw new UnsupportedOperationException("can't parse program_config_element yet");
        }
        if (this.audioObjectType == 6 || this.audioObjectType == 20) {
            out.writeBits(this.layerNr, 3);
        }
        if (this.extensionFlag == 1) {
            if (this.audioObjectType == 22) {
                out.writeBits(this.numOfSubFrame, 5);
                out.writeBits(this.layer_length, 11);
            }
            if (this.audioObjectType == 17 || this.audioObjectType == 19 || this.audioObjectType == 20 || this.audioObjectType == 23) {
                out.writeBool(this.aacSectionDataResilienceFlag);
                out.writeBool(this.aacScalefactorDataResilienceFlag);
                out.writeBool(this.aacSpectralDataResilienceFlag);
            }
            out.writeBits(this.extensionFlag3, 1);
            if (this.extensionFlag3 == 1) {
                throw new RuntimeException("not yet implemented");
            }
        }
    }

    private void parseParametricSpecificConfig(int samplingFrequencyIndex, int channelConfiguration, int audioObjectType, BitReaderBuffer in) throws IOException {
        this.isBaseLayer = in.readBits(1);
        if (this.isBaseLayer == 1) {
            parseParaConfig(samplingFrequencyIndex, channelConfiguration, audioObjectType, in);
        } else {
            parseHilnEnexConfig(samplingFrequencyIndex, channelConfiguration, audioObjectType, in);
        }
    }

    private void parseParaConfig(int samplingFrequencyIndex, int channelConfiguration, int audioObjectType, BitReaderBuffer in) throws IOException {
        this.paraMode = in.readBits(2);
        if (this.paraMode != 1) {
            parseErHvxcConfig(samplingFrequencyIndex, channelConfiguration, audioObjectType, in);
        }
        if (this.paraMode != 0) {
            parseHilnConfig(samplingFrequencyIndex, channelConfiguration, audioObjectType, in);
        }
        this.paraExtensionFlag = in.readBits(1);
        this.parametricSpecificConfig = true;
    }

    private void parseErHvxcConfig(int samplingFrequencyIndex, int channelConfiguration, int audioObjectType, BitReaderBuffer in) throws IOException {
        this.hvxcVarMode = in.readBits(1);
        this.hvxcRateMode = in.readBits(2);
        this.erHvxcExtensionFlag = in.readBits(1);
        if (this.erHvxcExtensionFlag == 1) {
            this.var_ScalableFlag = in.readBits(1);
        }
    }

    private void parseHilnConfig(int samplingFrequencyIndex, int channelConfiguration, int audioObjectType, BitReaderBuffer in) throws IOException {
        this.hilnQuantMode = in.readBits(1);
        this.hilnMaxNumLine = in.readBits(8);
        this.hilnSampleRateCode = in.readBits(4);
        this.hilnFrameLength = in.readBits(12);
        this.hilnContMode = in.readBits(2);
    }

    private void parseHilnEnexConfig(int samplingFrequencyIndex, int channelConfiguration, int audioObjectType, BitReaderBuffer in) throws IOException {
        this.hilnEnhaLayer = in.readBits(1);
        if (this.hilnEnhaLayer == 1) {
            this.hilnEnhaQuantMode = in.readBits(2);
        }
    }

    public byte[] getConfigBytes() {
        return serializeConfigBytes().array();
    }

    public int getAudioObjectType() {
        return this.audioObjectType;
    }

    public void setAudioObjectType(int audioObjectType) {
        this.audioObjectType = audioObjectType;
    }

    public void setOriginalAudioObjectType(int originalAudioObjectType) {
        this.originalAudioObjectType = originalAudioObjectType;
    }

    public int getExtensionAudioObjectType() {
        return this.extensionAudioObjectType;
    }

    public void setSamplingFrequencyIndex(int samplingFrequencyIndex) {
        this.samplingFrequencyIndex = samplingFrequencyIndex;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AudioSpecificConfig");
        sb.append("{configBytes=").append(Hex.encodeHex(this.configBytes));
        sb.append(", audioObjectType=").append(this.audioObjectType).append(" (").append(audioObjectTypeMap.get(Integer.valueOf(this.audioObjectType))).append(")");
        sb.append(", samplingFrequencyIndex=").append(this.samplingFrequencyIndex).append(" (").append(samplingFrequencyIndexMap.get(Integer.valueOf(this.samplingFrequencyIndex))).append(")");
        sb.append(", samplingFrequency=").append(this.samplingFrequency);
        sb.append(", channelConfiguration=").append(this.channelConfiguration);
        if (this.extensionAudioObjectType > 0) {
            sb.append(", extensionAudioObjectType=").append(this.extensionAudioObjectType).append(" (").append(audioObjectTypeMap.get(Integer.valueOf(this.extensionAudioObjectType))).append(")");
            sb.append(", sbrPresentFlag=").append(this.sbrPresentFlag);
            sb.append(", psPresentFlag=").append(this.psPresentFlag);
            sb.append(", extensionSamplingFrequencyIndex=").append(this.extensionSamplingFrequencyIndex).append(" (").append(samplingFrequencyIndexMap.get(Integer.valueOf(this.extensionSamplingFrequencyIndex))).append(")");
            sb.append(", extensionSamplingFrequency=").append(this.extensionSamplingFrequency);
            sb.append(", extensionChannelConfiguration=").append(this.extensionChannelConfiguration);
        }
        sb.append(", syncExtensionType=").append(this.syncExtensionType);
        if (this.gaSpecificConfig) {
            sb.append(", frameLengthFlag=").append(this.frameLengthFlag);
            sb.append(", dependsOnCoreCoder=").append(this.dependsOnCoreCoder);
            sb.append(", coreCoderDelay=").append(this.coreCoderDelay);
            sb.append(", extensionFlag=").append(this.extensionFlag);
            sb.append(", layerNr=").append(this.layerNr);
            sb.append(", numOfSubFrame=").append(this.numOfSubFrame);
            sb.append(", layer_length=").append(this.layer_length);
            sb.append(", aacSectionDataResilienceFlag=").append(this.aacSectionDataResilienceFlag);
            sb.append(", aacScalefactorDataResilienceFlag=").append(this.aacScalefactorDataResilienceFlag);
            sb.append(", aacSpectralDataResilienceFlag=").append(this.aacSpectralDataResilienceFlag);
            sb.append(", extensionFlag3=").append(this.extensionFlag3);
        }
        if (this.parametricSpecificConfig) {
            sb.append(", isBaseLayer=").append(this.isBaseLayer);
            sb.append(", paraMode=").append(this.paraMode);
            sb.append(", paraExtensionFlag=").append(this.paraExtensionFlag);
            sb.append(", hvxcVarMode=").append(this.hvxcVarMode);
            sb.append(", hvxcRateMode=").append(this.hvxcRateMode);
            sb.append(", erHvxcExtensionFlag=").append(this.erHvxcExtensionFlag);
            sb.append(", var_ScalableFlag=").append(this.var_ScalableFlag);
            sb.append(", hilnQuantMode=").append(this.hilnQuantMode);
            sb.append(", hilnMaxNumLine=").append(this.hilnMaxNumLine);
            sb.append(", hilnSampleRateCode=").append(this.hilnSampleRateCode);
            sb.append(", hilnFrameLength=").append(this.hilnFrameLength);
            sb.append(", hilnContMode=").append(this.hilnContMode);
            sb.append(", hilnEnhaLayer=").append(this.hilnEnhaLayer);
            sb.append(", hilnEnhaQuantMode=").append(this.hilnEnhaQuantMode);
        }
        sb.append('}');
        return sb.toString();
    }

    public int getSamplingFrequency() {
        return this.samplingFrequencyIndex == 15 ? this.samplingFrequency : samplingFrequencyIndexMap.get(Integer.valueOf(this.samplingFrequencyIndex)).intValue();
    }

    public int getExtensionSamplingFrequency() {
        return this.extensionSamplingFrequencyIndex == 15 ? this.extensionSamplingFrequency : samplingFrequencyIndexMap.get(Integer.valueOf(this.extensionSamplingFrequencyIndex)).intValue();
    }

    public void setSamplingFrequency(int samplingFrequency) {
        this.samplingFrequency = samplingFrequency;
    }

    public int getChannelConfiguration() {
        return this.channelConfiguration;
    }

    public void setChannelConfiguration(int channelConfiguration) {
        this.channelConfiguration = channelConfiguration;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AudioSpecificConfig that = (AudioSpecificConfig) o;
        return this.aacScalefactorDataResilienceFlag == that.aacScalefactorDataResilienceFlag && this.aacSectionDataResilienceFlag == that.aacSectionDataResilienceFlag && this.aacSpectralDataResilienceFlag == that.aacSpectralDataResilienceFlag && this.audioObjectType == that.audioObjectType && this.channelConfiguration == that.channelConfiguration && this.coreCoderDelay == that.coreCoderDelay && this.dependsOnCoreCoder == that.dependsOnCoreCoder && this.directMapping == that.directMapping && this.epConfig == that.epConfig && this.erHvxcExtensionFlag == that.erHvxcExtensionFlag && this.extensionAudioObjectType == that.extensionAudioObjectType && this.extensionChannelConfiguration == that.extensionChannelConfiguration && this.extensionFlag == that.extensionFlag && this.extensionFlag3 == that.extensionFlag3 && this.extensionSamplingFrequency == that.extensionSamplingFrequency && this.extensionSamplingFrequencyIndex == that.extensionSamplingFrequencyIndex && this.fillBits == that.fillBits && this.frameLengthFlag == that.frameLengthFlag && this.gaSpecificConfig == that.gaSpecificConfig && this.hilnContMode == that.hilnContMode && this.hilnEnhaLayer == that.hilnEnhaLayer && this.hilnEnhaQuantMode == that.hilnEnhaQuantMode && this.hilnFrameLength == that.hilnFrameLength && this.hilnMaxNumLine == that.hilnMaxNumLine && this.hilnQuantMode == that.hilnQuantMode && this.hilnSampleRateCode == that.hilnSampleRateCode && this.hvxcRateMode == that.hvxcRateMode && this.hvxcVarMode == that.hvxcVarMode && this.isBaseLayer == that.isBaseLayer && this.layerNr == that.layerNr && this.layer_length == that.layer_length && this.numOfSubFrame == that.numOfSubFrame && this.paraExtensionFlag == that.paraExtensionFlag && this.paraMode == that.paraMode && this.parametricSpecificConfig == that.parametricSpecificConfig && this.psPresentFlag == that.psPresentFlag && this.sacPayloadEmbedding == that.sacPayloadEmbedding && this.samplingFrequency == that.samplingFrequency && this.samplingFrequencyIndex == that.samplingFrequencyIndex && this.sbrPresentFlag == that.sbrPresentFlag && this.syncExtensionType == that.syncExtensionType && this.var_ScalableFlag == that.var_ScalableFlag && Arrays.equals(this.configBytes, that.configBytes);
    }

    public int hashCode() {
        int i = 1;
        int result = this.configBytes != null ? Arrays.hashCode(this.configBytes) : 0;
        int i2 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((result * 31) + this.audioObjectType) * 31) + this.samplingFrequencyIndex) * 31) + this.samplingFrequency) * 31) + this.channelConfiguration) * 31) + this.extensionAudioObjectType) * 31) + (this.sbrPresentFlag ? 1 : 0)) * 31) + (this.psPresentFlag ? 1 : 0)) * 31) + this.extensionSamplingFrequencyIndex) * 31) + this.extensionSamplingFrequency) * 31) + this.extensionChannelConfiguration) * 31) + this.sacPayloadEmbedding) * 31) + this.fillBits) * 31) + this.epConfig) * 31) + this.directMapping) * 31) + this.syncExtensionType) * 31) + this.frameLengthFlag) * 31) + this.dependsOnCoreCoder) * 31) + this.coreCoderDelay) * 31) + this.extensionFlag) * 31) + this.layerNr) * 31) + this.numOfSubFrame) * 31) + this.layer_length) * 31) + (this.aacSectionDataResilienceFlag ? 1 : 0)) * 31) + (this.aacScalefactorDataResilienceFlag ? 1 : 0)) * 31) + (this.aacSpectralDataResilienceFlag ? 1 : 0)) * 31) + this.extensionFlag3) * 31) + (this.gaSpecificConfig ? 1 : 0)) * 31) + this.isBaseLayer) * 31) + this.paraMode) * 31) + this.paraExtensionFlag) * 31) + this.hvxcVarMode) * 31) + this.hvxcRateMode) * 31) + this.erHvxcExtensionFlag) * 31) + this.var_ScalableFlag) * 31) + this.hilnQuantMode) * 31) + this.hilnMaxNumLine) * 31) + this.hilnSampleRateCode) * 31) + this.hilnFrameLength) * 31) + this.hilnContMode) * 31) + this.hilnEnhaLayer) * 31) + this.hilnEnhaQuantMode) * 31;
        if (!this.parametricSpecificConfig) {
            i = 0;
        }
        int result2 = i2 + i;
        return result2;
    }

    /* loaded from: classes2.dex */
    public class ELDSpecificConfig {
        private static final int ELDEXT_TERM = 0;
        public boolean aacScalefactorDataResilienceFlag;
        public boolean aacSectionDataResilienceFlag;
        public boolean aacSpectralDataResilienceFlag;
        public boolean frameLengthFlag;
        public boolean ldSbrCrcFlag;
        public boolean ldSbrPresentFlag;
        public boolean ldSbrSamplingRate;

        /* JADX WARN: Incorrect condition in loop: B:6:0x003d */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public ELDSpecificConfig(int r11, com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer r12) {
            /*
                r9 = this;
                r8 = 8
                r7 = 4
                com.googlecode.mp4parser.boxes.mp4.objectdescriptors.AudioSpecificConfig.this = r10
                r9.<init>()
                boolean r6 = r12.readBool()
                r9.frameLengthFlag = r6
                boolean r6 = r12.readBool()
                r9.aacSectionDataResilienceFlag = r6
                boolean r6 = r12.readBool()
                r9.aacScalefactorDataResilienceFlag = r6
                boolean r6 = r12.readBool()
                r9.aacSpectralDataResilienceFlag = r6
                boolean r6 = r12.readBool()
                r9.ldSbrPresentFlag = r6
                boolean r6 = r9.ldSbrPresentFlag
                if (r6 == 0) goto L39
                boolean r6 = r12.readBool()
                r9.ldSbrSamplingRate = r6
                boolean r6 = r12.readBool()
                r9.ldSbrCrcFlag = r6
                r9.ld_sbr_header(r11, r12)
            L39:
                int r4 = r12.readBits(r7)
                if (r4 != 0) goto L40
                return
            L40:
                int r1 = r12.readBits(r7)
                r5 = r1
                r2 = 0
                r6 = 15
                if (r1 != r6) goto L4f
                int r2 = r12.readBits(r8)
                int r5 = r5 + r2
            L4f:
                r6 = 255(0xff, float:3.57E-43)
                if (r2 != r6) goto L5a
                r6 = 16
                int r3 = r12.readBits(r6)
                int r5 = r5 + r3
            L5a:
                r0 = 0
            L5b:
                if (r0 >= r5) goto L39
                r12.readBits(r8)
                int r0 = r0 + 1
                goto L5b
            */
            throw new UnsupportedOperationException("Method not decompiled: com.googlecode.mp4parser.boxes.mp4.objectdescriptors.AudioSpecificConfig.ELDSpecificConfig.<init>(com.googlecode.mp4parser.boxes.mp4.objectdescriptors.AudioSpecificConfig, int, com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer):void");
        }

        public void ld_sbr_header(int channelConfiguration, BitReaderBuffer bitReaderBuffer) {
            int numSbrHeader;
            switch (channelConfiguration) {
                case 1:
                case 2:
                    numSbrHeader = 1;
                    break;
                case 3:
                    numSbrHeader = 2;
                    break;
                case 4:
                case 5:
                case 6:
                    numSbrHeader = 3;
                    break;
                case 7:
                    numSbrHeader = 4;
                    break;
                default:
                    numSbrHeader = 0;
                    break;
            }
            for (int el = 0; el < numSbrHeader; el++) {
                new sbr_header(bitReaderBuffer);
            }
        }
    }

    /* loaded from: classes2.dex */
    public class sbr_header {
        public boolean bs_alter_scale;
        public boolean bs_amp_res;
        public int bs_freq_scale;
        public boolean bs_header_extra_1;
        public boolean bs_header_extra_2;
        public boolean bs_interpol_freq;
        public int bs_limiter_bands;
        public int bs_limiter_gains;
        public int bs_noise_bands;
        public int bs_reserved;
        public boolean bs_smoothing_mode;
        public int bs_start_freq;
        public int bs_stop_freq;
        public int bs_xover_band;

        public sbr_header(BitReaderBuffer b) {
            this.bs_amp_res = b.readBool();
            this.bs_start_freq = b.readBits(4);
            this.bs_stop_freq = b.readBits(4);
            this.bs_xover_band = b.readBits(3);
            this.bs_reserved = b.readBits(2);
            this.bs_header_extra_1 = b.readBool();
            this.bs_header_extra_2 = b.readBool();
            if (this.bs_header_extra_1) {
                this.bs_freq_scale = b.readBits(2);
                this.bs_alter_scale = b.readBool();
                this.bs_noise_bands = b.readBits(2);
            }
            if (this.bs_header_extra_2) {
                this.bs_limiter_bands = b.readBits(2);
                this.bs_limiter_gains = b.readBits(2);
                this.bs_interpol_freq = b.readBool();
            }
            this.bs_smoothing_mode = b.readBool();
        }
    }
}
