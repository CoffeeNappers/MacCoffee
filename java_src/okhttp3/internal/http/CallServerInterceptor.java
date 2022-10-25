package okhttp3.internal.http;

import java.io.IOException;
import java.net.ProtocolException;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.Util;
import okhttp3.internal.connection.StreamAllocation;
import okio.BufferedSink;
import okio.Okio;
import okio.Sink;
/* loaded from: classes3.dex */
public final class CallServerInterceptor implements Interceptor {
    private final boolean forWebSocket;

    public CallServerInterceptor(boolean forWebSocket) {
        this.forWebSocket = forWebSocket;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        Response response;
        HttpCodec httpCodec = ((RealInterceptorChain) chain).httpStream();
        StreamAllocation streamAllocation = ((RealInterceptorChain) chain).streamAllocation();
        Request request = chain.request();
        long sentRequestMillis = System.currentTimeMillis();
        httpCodec.writeRequestHeaders(request);
        if (HttpMethod.permitsRequestBody(request.method()) && request.body() != null) {
            Sink requestBodyOut = httpCodec.createRequestBody(request, request.body().contentLength());
            BufferedSink bufferedRequestBody = Okio.buffer(requestBodyOut);
            request.body().writeTo(bufferedRequestBody);
            bufferedRequestBody.close();
        }
        httpCodec.finishRequest();
        Response response2 = httpCodec.readResponseHeaders().request(request).handshake(streamAllocation.connection().handshake()).sentRequestAtMillis(sentRequestMillis).receivedResponseAtMillis(System.currentTimeMillis()).build();
        int code = response2.code();
        if (this.forWebSocket && code == 101) {
            response = response2.newBuilder().body(Util.EMPTY_RESPONSE).build();
        } else {
            response = response2.newBuilder().body(httpCodec.openResponseBody(response2)).build();
        }
        if ("close".equalsIgnoreCase(response.request().header("Connection")) || "close".equalsIgnoreCase(response.header("Connection"))) {
            streamAllocation.noNewStreams();
        }
        if ((code == 204 || code == 205) && response.body().contentLength() > 0) {
            throw new ProtocolException("HTTP " + code + " had non-zero Content-Length: " + response.body().contentLength());
        }
        return response;
    }
}
