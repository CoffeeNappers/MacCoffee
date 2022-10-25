package io.sentry.event.helper;

import io.sentry.util.Util;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
/* loaded from: classes3.dex */
public class ForwardedAddressResolver implements RemoteAddressResolver {
    private BasicRemoteAddressResolver basicRemoteAddressResolver = new BasicRemoteAddressResolver();

    private static String firstAddress(String csvAddrs) {
        List<String> ips = Arrays.asList(csvAddrs.split(","));
        return ips.get(0).trim();
    }

    @Override // io.sentry.event.helper.RemoteAddressResolver
    public String getRemoteAddress(HttpServletRequest request) {
        String forwarded = request.getHeader("X-FORWARDED-FOR");
        return !Util.isNullOrEmpty(forwarded) ? firstAddress(forwarded) : this.basicRemoteAddressResolver.getRemoteAddress(request);
    }
}
