package com.mp4parser.streaming;

import com.coremedia.iso.BoxParser;
import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
/* loaded from: classes2.dex */
public abstract class WriteOnlyBox implements Box {
    private Container parent;
    private final String type;

    @Override // com.coremedia.iso.boxes.Box
    public Container getParent() {
        return this.parent;
    }

    @Override // com.coremedia.iso.boxes.Box
    public void setParent(Container parent) {
        this.parent = parent;
    }

    @Override // com.coremedia.iso.boxes.Box
    public long getOffset() {
        throw new RuntimeException("It's a´write only box");
    }

    @Override // com.coremedia.iso.boxes.Box
    public void parse(DataSource dataSource, ByteBuffer header, long contentSize, BoxParser boxParser) throws IOException {
        throw new RuntimeException("It's a´write only box");
    }

    public WriteOnlyBox(String type) {
        this.type = type;
    }

    @Override // com.coremedia.iso.boxes.Box
    public String getType() {
        return this.type;
    }
}
