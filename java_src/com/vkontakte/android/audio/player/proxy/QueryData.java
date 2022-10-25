package com.vkontakte.android.audio.player.proxy;

import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class QueryData {
    public final Map<String, String> headers;
    public final String httpVersion;
    public final String method;
    public final Map<String, String> parameters;
    public final String path;

    public QueryData(String method, String path, Map<String, String> parameters, String httpVersion, Map<String, String> headers) {
        this.method = method;
        this.path = path;
        this.parameters = parameters;
        this.httpVersion = httpVersion;
        this.headers = headers;
    }

    public static QueryData read(SocketChannel socket, int client) throws IOException {
        String path;
        L.d("Reading query data", "client", Integer.valueOf(client));
        LineReader reader = new LineReader(socket);
        Map<String, String> parameters = new HashMap<>();
        String line = reader.readLine();
        L.v("Query line", "line", line);
        if (line == null) {
            throw new IOException("Empty first line");
        }
        String[] parts = line.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, -1);
        if (parts.length < 3) {
            throw new IOException("Malformed first line: " + line);
        }
        String method = parts[0];
        try {
            String str = URLDecoder.decode(parts[1], "UTF-8");
            int separator = str.indexOf(63);
            if (separator < 0) {
                path = str;
            } else {
                path = str.substring(0, separator);
                String params = str.substring(separator + 1);
                if (!params.isEmpty()) {
                    String[] namesAndValues = params.split("&");
                    for (String nameAndValue : namesAndValues) {
                        int delimiter = nameAndValue.indexOf(61);
                        if (delimiter < 0) {
                            throw new IOException("No '=' symbol in query parameter: " + nameAndValue);
                        }
                        String name = nameAndValue.substring(0, delimiter);
                        String value = nameAndValue.substring(delimiter + 1);
                        parameters.put(name, value);
                    }
                }
            }
            String httpVersion = parts[2];
            Map<String, String> headers = new HashMap<>();
            while (true) {
                String line2 = reader.readLine();
                if (!TextUtils.isEmpty(line2)) {
                    L.v("Header line", "line", line2);
                    int delimiter2 = line2.indexOf(58);
                    if (delimiter2 < 0) {
                        throw new IOException("No ':' symbol in header line: " + line2);
                    }
                    String name2 = line2.substring(0, delimiter2).trim();
                    String value2 = line2.substring(delimiter2 + 1).trim();
                    headers.put(name2, value2);
                } else {
                    return new QueryData(method, path, parameters, httpVersion, headers);
                }
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public Range getRange() {
        String rangeHeader = this.headers.get("Range");
        if (rangeHeader != null) {
            long from = -1;
            Long to = -1L;
            int indexOfSlash = rangeHeader.indexOf(47);
            if (indexOfSlash >= 0) {
                rangeHeader = rangeHeader.substring(0, indexOfSlash);
            }
            String[] parts = rangeHeader.split("=", -1);
            if (parts.length == 2 && "bytes".equals(parts[0])) {
                String[] ranges = parts[1].split("-", -1);
                if (ranges.length == 2) {
                    boolean fromEmpty = TextUtils.isEmpty(ranges[0]);
                    boolean toEmpty = TextUtils.isEmpty(ranges[1]);
                    if (!fromEmpty || !toEmpty) {
                        if (fromEmpty) {
                            from = 0;
                        } else {
                            try {
                                from = Long.parseLong(ranges[0]);
                            } catch (NumberFormatException e) {
                            }
                        }
                        if (toEmpty) {
                            to = null;
                        } else {
                            try {
                                to = Long.valueOf(Long.parseLong(ranges[1]));
                            } catch (NumberFormatException e2) {
                            }
                        }
                    }
                }
            }
            return new Range(from, to);
        }
        return null;
    }

    /* loaded from: classes2.dex */
    public static class Range {
        public final long from;
        public final Long to;

        public Range(long from, Long to) {
            this.from = from;
            this.to = to;
        }

        public boolean isValid() {
            return this.from >= 0 && (this.to == null || this.to.longValue() >= this.from);
        }

        public String toString() {
            return Utils.objectToString(this, ServerKeys.FROM, Long.valueOf(this.from), "to", this.to);
        }
    }

    /* loaded from: classes2.dex */
    private static class LineReader {
        private final SocketChannel mSocket;
        private final ByteBuffer mBuffer = ByteBuffer.allocate(1);
        private final ByteArrayOutputStream mStream = new ByteArrayOutputStream();

        public LineReader(SocketChannel socket) {
            this.mSocket = socket;
        }

        public String readLine() throws IOException {
            int b;
            this.mStream.reset();
            boolean firstByteRead = false;
            while (true) {
                this.mBuffer.rewind();
                this.mBuffer.limit(this.mBuffer.capacity());
                int len = this.mSocket.read(this.mBuffer);
                if (len >= 0 && (b = this.mBuffer.array()[0]) != 13) {
                    if (!firstByteRead) {
                        firstByteRead = true;
                        if (b != 10) {
                        }
                    }
                    this.mStream.write(b);
                }
            }
            return new String(this.mStream.toByteArray());
        }
    }
}
