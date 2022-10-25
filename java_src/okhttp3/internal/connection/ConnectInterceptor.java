package okhttp3.internal.connection;

import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.IOException;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.http.HttpCodec;
import okhttp3.internal.http.RealInterceptorChain;
/* loaded from: classes3.dex */
public final class ConnectInterceptor implements Interceptor {
    public final OkHttpClient client;

    public ConnectInterceptor(OkHttpClient client) {
        this.client = client;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        RealInterceptorChain realChain = (RealInterceptorChain) chain;
        Request request = realChain.request();
        StreamAllocation streamAllocation = realChain.streamAllocation();
        boolean doExtensiveHealthChecks = !request.method().equals(HttpRequest.METHOD_GET);
        HttpCodec httpCodec = streamAllocation.newStream(this.client, doExtensiveHealthChecks);
        RealConnection connection = streamAllocation.connection();
        return realChain.proceed(request, streamAllocation, httpCodec, connection);
    }
}
