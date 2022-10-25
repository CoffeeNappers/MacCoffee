package com.my.target.core.async.commands;

import android.content.Context;
import com.my.target.Tracer;
import com.my.target.core.utils.m;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
/* compiled from: SendStatCommand.java */
/* loaded from: classes2.dex */
public final class i extends a<String> {
    private String e;
    private List<String> f;
    private int g;

    @Override // com.my.target.core.async.commands.a, com.my.target.core.async.commands.b
    public final /* bridge */ /* synthetic */ String a() {
        return super.a();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public i(String str, Context context) {
        super(context, (byte) 0);
        this.e = str;
        this.c = str;
    }

    @Override // com.my.target.core.async.commands.a
    protected final void c() {
        if (this.e != null) {
            Tracer.d("send stat: " + this.e);
            this.g = 0;
            a(this.e, this.b);
        } else if (this.f != null) {
            for (String str : this.f) {
                Tracer.d("send stat: " + str);
                this.g = 0;
                a(str, this.b);
            }
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: BlockProcessor
        jadx.core.utils.exceptions.JadxRuntimeException: Found unreachable blocks
        	at jadx.core.dex.visitors.blocks.DominatorTree.sortBlocks(DominatorTree.java:35)
        	at jadx.core.dex.visitors.blocks.DominatorTree.compute(DominatorTree.java:25)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.computeDominators(BlockProcessor.java:203)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.processBlocksTree(BlockProcessor.java:46)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.visit(BlockProcessor.java:40)
        */
    private void a(java.lang.String r7, android.content.Context r8) {
        /*
            r6 = this;
            r2 = 0
        L1:
            com.my.target.core.net.cookie.a r1 = com.my.target.core.net.cookie.a.a(r8)     // Catch: java.lang.Throwable -> L96
            java.net.URL r0 = new java.net.URL     // Catch: java.lang.Throwable -> L96
            r0.<init>(r7)     // Catch: java.lang.Throwable -> L96
            java.net.URLConnection r0 = r0.openConnection()     // Catch: java.lang.Throwable -> L96
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch: java.lang.Throwable -> L96
            r3 = 10000(0x2710, float:1.4013E-41)
            r0.setReadTimeout(r3)     // Catch: java.lang.Throwable -> Lc8
            r3 = 10000(0x2710, float:1.4013E-41)
            r0.setConnectTimeout(r3)     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r3 = "GET"
            r0.setRequestMethod(r3)     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r3 = "User-Agent"
            java.lang.String r4 = "http.agent"
            java.lang.String r4 = java.lang.System.getProperty(r4)     // Catch: java.lang.Throwable -> Lc8
            r0.addRequestProperty(r3, r4)     // Catch: java.lang.Throwable -> Lc8
            r3 = 0
            r0.setInstanceFollowRedirects(r3)     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r3 = "connection"
            java.lang.String r4 = "close"
            r0.setRequestProperty(r3, r4)     // Catch: java.lang.Throwable -> Lc8
            if (r1 == 0) goto L3f
            r1.b(r0)     // Catch: java.lang.Throwable -> Lc8
        L3f:
            int r3 = r0.getResponseCode()     // Catch: java.lang.Throwable -> Lc8
            r4 = 200(0xc8, float:2.8E-43)
            if (r3 == r4) goto L53
            r4 = 204(0xcc, float:2.86E-43)
            if (r3 == r4) goto L53
            r4 = 404(0x194, float:5.66E-43)
            if (r3 == r4) goto L53
            r4 = 403(0x193, float:5.65E-43)
            if (r3 != r4) goto L76
        L53:
            if (r1 == 0) goto L58
            r1.a(r0)     // Catch: java.lang.Throwable -> Lc8
        L58:
            r6.c = r7     // Catch: java.lang.Throwable -> Lc8
            r7 = r2
        L5b:
            if (r0 == 0) goto L60
            r0.disconnect()     // Catch: java.lang.Throwable -> L8d
        L60:
            if (r7 == 0) goto Lc0
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r1 = "redirected to: "
            r0.<init>(r1)
            java.lang.StringBuilder r0 = r0.append(r7)
            java.lang.String r0 = r0.toString()
            com.my.target.Tracer.d(r0)
            goto L1
        L76:
            r1 = 302(0x12e, float:4.23E-43)
            if (r3 == r1) goto L82
            r1 = 301(0x12d, float:4.22E-43)
            if (r3 == r1) goto L82
            r1 = 303(0x12f, float:4.25E-43)
            if (r3 != r1) goto Lcf
        L82:
            int r1 = r6.g     // Catch: java.lang.Throwable -> Lc8
            int r1 = r1 + 1
            r6.g = r1     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r7 = r6.a(r0)     // Catch: java.lang.Throwable -> Lc8
            goto L5b
        L8d:
            r0 = move-exception
            java.lang.String r0 = r0.getMessage()
            com.my.target.Tracer.d(r0)
            goto L60
        L96:
            r0 = move-exception
            r1 = r2
        L98:
            java.lang.String r0 = r0.getMessage()     // Catch: java.lang.Throwable -> Lc5
            com.my.target.Tracer.d(r0)     // Catch: java.lang.Throwable -> Lc5
            if (r1 == 0) goto Lcd
            r1.disconnect()     // Catch: java.lang.Throwable -> La6
            r7 = r2
            goto L60
        La6:
            r0 = move-exception
            java.lang.String r0 = r0.getMessage()
            com.my.target.Tracer.d(r0)
            r7 = r2
            goto L60
        Lb0:
            r0 = move-exception
        Lb1:
            if (r2 == 0) goto Lb6
            r2.disconnect()     // Catch: java.lang.Throwable -> Lb7
        Lb6:
            throw r0
        Lb7:
            r1 = move-exception
            java.lang.String r1 = r1.getMessage()
            com.my.target.Tracer.d(r1)
            goto Lb6
        Lc0:
            return
        Lc1:
            r1 = move-exception
            r2 = r0
            r0 = r1
            goto Lb1
        Lc5:
            r0 = move-exception
            r2 = r1
            goto Lb1
        Lc8:
            r1 = move-exception
            r5 = r1
            r1 = r0
            r0 = r5
            goto L98
        Lcd:
            r7 = r2
            goto L60
        Lcf:
            r7 = r2
            goto L5b
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.async.commands.i.a(java.lang.String, android.content.Context):void");
    }

    /* JADX WARN: Type inference failed for: r0v9, types: [T, java.lang.String] */
    private String a(HttpURLConnection httpURLConnection) {
        if (this.g <= 10) {
            try {
                ?? uri = httpURLConnection.getURL().toURI().resolve(new URI(httpURLConnection.getHeaderField(HttpRequest.HEADER_LOCATION))).toString();
                if (!m.a(uri)) {
                    return uri;
                }
                this.c = uri;
            } catch (URISyntaxException e) {
                return null;
            }
        }
        return null;
    }
}
