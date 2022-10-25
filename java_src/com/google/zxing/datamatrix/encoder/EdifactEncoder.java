package com.google.zxing.datamatrix.encoder;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class EdifactEncoder implements Encoder {
    @Override // com.google.zxing.datamatrix.encoder.Encoder
    public int getEncodingMode() {
        return 4;
    }

    @Override // com.google.zxing.datamatrix.encoder.Encoder
    public void encode(EncoderContext context) {
        StringBuilder buffer = new StringBuilder();
        while (true) {
            if (!context.hasMoreCharacters()) {
                break;
            }
            char c = context.getCurrentChar();
            encodeChar(c, buffer);
            context.pos++;
            int count = buffer.length();
            if (count >= 4) {
                context.writeCodewords(encodeToCodewords(buffer, 0));
                buffer.delete(0, 4);
                int newMode = HighLevelEncoder.lookAheadTest(context.getMessage(), context.pos, getEncodingMode());
                if (newMode != getEncodingMode()) {
                    context.signalEncoderChange(0);
                    break;
                }
            }
        }
        buffer.append((char) 31);
        handleEOD(context, buffer);
    }

    private static void handleEOD(EncoderContext context, CharSequence buffer) {
        boolean restInAscii = true;
        try {
            int count = buffer.length();
            if (count == 0) {
                return;
            }
            if (count == 1) {
                context.updateSymbolInfo();
                int available = context.getSymbolInfo().getDataCapacity() - context.getCodewordCount();
                int remaining = context.getRemainingCharacters();
                if (remaining == 0 && available <= 2) {
                    return;
                }
            }
            if (count > 4) {
                throw new IllegalStateException("Count must not exceed 4");
            }
            int restChars = count - 1;
            String encoded = encodeToCodewords(buffer, 0);
            boolean endOfSymbolReached = !context.hasMoreCharacters();
            if (!endOfSymbolReached || restChars > 2) {
                restInAscii = false;
            }
            if (restChars <= 2) {
                context.updateSymbolInfo(context.getCodewordCount() + restChars);
                int available2 = context.getSymbolInfo().getDataCapacity() - context.getCodewordCount();
                if (available2 >= 3) {
                    restInAscii = false;
                    context.updateSymbolInfo(context.getCodewordCount() + encoded.length());
                }
            }
            if (restInAscii) {
                context.resetSymbolInfo();
                context.pos -= restChars;
            } else {
                context.writeCodewords(encoded);
            }
        } finally {
            context.signalEncoderChange(0);
        }
    }

    private static void encodeChar(char c, StringBuilder sb) {
        if (c >= ' ' && c <= '?') {
            sb.append(c);
        } else if (c >= '@' && c <= '^') {
            sb.append((char) (c - '@'));
        } else {
            HighLevelEncoder.illegalCharacter(c);
        }
    }

    private static String encodeToCodewords(CharSequence sb, int startPos) {
        char c4 = 0;
        int len = sb.length() - startPos;
        if (len == 0) {
            throw new IllegalStateException("StringBuilder must not be empty");
        }
        char c1 = sb.charAt(startPos);
        char c2 = len >= 2 ? sb.charAt(startPos + 1) : (char) 0;
        char c3 = len >= 3 ? sb.charAt(startPos + 2) : (char) 0;
        if (len >= 4) {
            c4 = sb.charAt(startPos + 3);
        }
        int v = (c1 << 18) + (c2 << '\f') + (c3 << 6) + c4;
        char cw1 = (char) ((v >> 16) & 255);
        char cw2 = (char) ((v >> 8) & 255);
        char cw3 = (char) (v & 255);
        StringBuilder res = new StringBuilder(3);
        res.append(cw1);
        if (len >= 2) {
            res.append(cw2);
        }
        if (len >= 3) {
            res.append(cw3);
        }
        return res.toString();
    }
}
