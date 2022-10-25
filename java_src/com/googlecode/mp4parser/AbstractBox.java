package com.googlecode.mp4parser;

import com.coremedia.iso.BoxParser;
import com.coremedia.iso.Hex;
import com.coremedia.iso.IsoFile;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.Container;
import com.coremedia.iso.boxes.UserBox;
import com.googlecode.mp4parser.annotations.DoNotParseDetail;
import com.googlecode.mp4parser.util.CastUtils;
import com.googlecode.mp4parser.util.Logger;
import com.googlecode.mp4parser.util.Path;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
/* loaded from: classes.dex */
public abstract class AbstractBox implements Box {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static Logger LOG;
    private ByteBuffer content;
    DataSource dataSource;
    private ByteBuffer deadBytes = null;
    boolean isParsed = true;
    long offset;
    private Container parent;
    protected String type;
    private byte[] userType;

    protected abstract void _parseDetails(ByteBuffer byteBuffer);

    protected abstract void getContent(ByteBuffer byteBuffer);

    protected abstract long getContentSize();

    static {
        $assertionsDisabled = !AbstractBox.class.desiredAssertionStatus();
        LOG = Logger.getLogger(AbstractBox.class);
    }

    @Override // com.coremedia.iso.boxes.Box
    public long getOffset() {
        return this.offset;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractBox(String type) {
        this.type = type;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractBox(String type, byte[] userType) {
        this.type = type;
        this.userType = userType;
    }

    @Override // com.coremedia.iso.boxes.Box
    @DoNotParseDetail
    public void parse(DataSource dataSource, ByteBuffer header, long contentSize, BoxParser boxParser) throws IOException {
        this.offset = dataSource.position() - header.remaining();
        this.dataSource = dataSource;
        this.content = ByteBuffer.allocate(CastUtils.l2i(contentSize));
        while (this.content.remaining() > 0) {
            dataSource.read(this.content);
        }
        this.content.position(0);
        this.isParsed = false;
    }

    @Override // com.coremedia.iso.boxes.Box
    public void getBox(WritableByteChannel os) throws IOException {
        int i = 16;
        if (this.isParsed) {
            ByteBuffer bb = ByteBuffer.allocate(CastUtils.l2i(getSize()));
            getHeader(bb);
            getContent(bb);
            if (this.deadBytes != null) {
                this.deadBytes.rewind();
                while (this.deadBytes.remaining() > 0) {
                    bb.put(this.deadBytes);
                }
            }
            os.write((ByteBuffer) bb.rewind());
            return;
        }
        int i2 = isSmallBox() ? 8 : 16;
        if (!UserBox.TYPE.equals(getType())) {
            i = 0;
        }
        ByteBuffer header = ByteBuffer.allocate(i2 + i);
        getHeader(header);
        os.write((ByteBuffer) header.rewind());
        os.write((ByteBuffer) this.content.position(0));
    }

    public final synchronized void parseDetails() {
        LOG.logDebug("parsing details of " + getType());
        if (this.content != null) {
            ByteBuffer content = this.content;
            this.isParsed = true;
            content.rewind();
            _parseDetails(content);
            if (content.remaining() > 0) {
                this.deadBytes = content.slice();
            }
            this.content = null;
            if (!$assertionsDisabled && !verify(content)) {
                throw new AssertionError();
            }
        }
    }

    @Override // com.coremedia.iso.boxes.Box
    public long getSize() {
        long size;
        int i = 0;
        if (this.isParsed) {
            size = getContentSize();
        } else {
            size = this.content != null ? this.content.limit() : 0;
        }
        long size2 = size + (UserBox.TYPE.equals(getType()) ? 16 : 0) + (size >= 4294967288L ? 8 : 0) + 8;
        if (this.deadBytes != null) {
            i = this.deadBytes.limit();
        }
        return size2 + i;
    }

    @Override // com.coremedia.iso.boxes.Box
    @DoNotParseDetail
    public String getType() {
        return this.type;
    }

    @DoNotParseDetail
    public byte[] getUserType() {
        return this.userType;
    }

    @Override // com.coremedia.iso.boxes.Box
    @DoNotParseDetail
    public Container getParent() {
        return this.parent;
    }

    @Override // com.coremedia.iso.boxes.Box
    @DoNotParseDetail
    public void setParent(Container parent) {
        this.parent = parent;
    }

    public boolean isParsed() {
        return this.isParsed;
    }

    private boolean verify(ByteBuffer content) {
        ByteBuffer bb = ByteBuffer.allocate(CastUtils.l2i((this.deadBytes != null ? this.deadBytes.limit() : 0) + getContentSize()));
        getContent(bb);
        if (this.deadBytes != null) {
            this.deadBytes.rewind();
            while (this.deadBytes.remaining() > 0) {
                bb.put(this.deadBytes);
            }
        }
        content.rewind();
        bb.rewind();
        if (content.remaining() != bb.remaining()) {
            System.err.print(String.valueOf(getType()) + ": remaining differs " + content.remaining() + " vs. " + bb.remaining());
            LOG.logError(String.valueOf(getType()) + ": remaining differs " + content.remaining() + " vs. " + bb.remaining());
            return false;
        }
        int p = content.position();
        int i = content.limit() - 1;
        int j = bb.limit() - 1;
        while (i >= p) {
            byte v1 = content.get(i);
            byte v2 = bb.get(j);
            if (v1 == v2) {
                i--;
                j--;
            } else {
                LOG.logError(String.format("%s: buffers differ at %d: %2X/%2X", getType(), Integer.valueOf(i), Byte.valueOf(v1), Byte.valueOf(v2)));
                byte[] b1 = new byte[content.remaining()];
                byte[] b2 = new byte[bb.remaining()];
                content.get(b1);
                bb.get(b2);
                System.err.println("original      : " + Hex.encodeHex(b1, 4));
                System.err.println("reconstructed : " + Hex.encodeHex(b2, 4));
                return false;
            }
        }
        return true;
    }

    private boolean isSmallBox() {
        int baseSize = 8;
        if (UserBox.TYPE.equals(getType())) {
            baseSize = 8 + 16;
        }
        if (this.isParsed) {
            return (getContentSize() + ((long) (this.deadBytes != null ? this.deadBytes.limit() : 0))) + ((long) baseSize) < 4294967296L;
        }
        return ((long) (this.content.limit() + baseSize)) < 4294967296L;
    }

    private void getHeader(ByteBuffer byteBuffer) {
        if (isSmallBox()) {
            IsoTypeWriter.writeUInt32(byteBuffer, getSize());
            byteBuffer.put(IsoFile.fourCCtoBytes(getType()));
        } else {
            IsoTypeWriter.writeUInt32(byteBuffer, 1L);
            byteBuffer.put(IsoFile.fourCCtoBytes(getType()));
            IsoTypeWriter.writeUInt64(byteBuffer, getSize());
        }
        if (UserBox.TYPE.equals(getType())) {
            byteBuffer.put(getUserType());
        }
    }

    @DoNotParseDetail
    public String getPath() {
        return Path.createPath(this);
    }
}
