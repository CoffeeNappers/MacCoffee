package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import java.io.IOException;
/* loaded from: classes.dex */
public class DefaultIndenter extends DefaultPrettyPrinter.NopIndenter {
    private static final int INDENT_LEVELS = 16;
    public static final DefaultIndenter SYSTEM_LINEFEED_INSTANCE;
    public static final String SYS_LF;
    private static final long serialVersionUID = 1;
    private final int charsPerLevel;
    private final String eol;
    private final char[] indents;

    static {
        String lf;
        try {
            lf = System.getProperty("line.separator");
        } catch (Throwable th) {
            lf = "\n";
        }
        SYS_LF = lf;
        SYSTEM_LINEFEED_INSTANCE = new DefaultIndenter("  ", SYS_LF);
    }

    public DefaultIndenter() {
        this("  ", SYS_LF);
    }

    public DefaultIndenter(String indent, String eol) {
        this.charsPerLevel = indent.length();
        this.indents = new char[indent.length() * 16];
        int offset = 0;
        for (int i = 0; i < 16; i++) {
            indent.getChars(0, indent.length(), this.indents, offset);
            offset += indent.length();
        }
        this.eol = eol;
    }

    public DefaultIndenter withLinefeed(String lf) {
        return lf.equals(this.eol) ? this : new DefaultIndenter(getIndent(), lf);
    }

    public DefaultIndenter withIndent(String indent) {
        return indent.equals(getIndent()) ? this : new DefaultIndenter(indent, this.eol);
    }

    @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
    public boolean isInline() {
        return false;
    }

    @Override // com.fasterxml.jackson.core.util.DefaultPrettyPrinter.NopIndenter, com.fasterxml.jackson.core.util.DefaultPrettyPrinter.Indenter
    public void writeIndentation(JsonGenerator jg, int level) throws IOException {
        jg.writeRaw(this.eol);
        if (level > 0) {
            int level2 = level * this.charsPerLevel;
            while (level2 > this.indents.length) {
                jg.writeRaw(this.indents, 0, this.indents.length);
                level2 -= this.indents.length;
            }
            jg.writeRaw(this.indents, 0, level2);
        }
    }

    public String getEol() {
        return this.eol;
    }

    public String getIndent() {
        return new String(this.indents, 0, this.charsPerLevel);
    }
}
