package io.sentry.servlet;

import java.util.Set;
import javax.servlet.ServletContainerInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
/* loaded from: classes3.dex */
public class SentryServletContainerInitializer implements ServletContainerInitializer {
    public void onStartup(Set<Class<?>> c, ServletContext ctx) throws ServletException {
        ctx.addListener(SentryServletRequestListener.class);
    }
}
