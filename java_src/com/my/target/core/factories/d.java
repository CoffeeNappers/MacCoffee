package com.my.target.core.factories;
/* compiled from: FSAdFactory.java */
/* loaded from: classes2.dex */
public final class d {
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0081, code lost:
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.my.target.core.facades.c a(com.my.target.core.models.c r4, android.content.Context r5) {
        /*
            java.util.ArrayList r0 = r4.f()
            java.util.Iterator r1 = r0.iterator()
        L8:
            boolean r0 = r1.hasNext()
            if (r0 == 0) goto L81
            java.lang.Object r0 = r1.next()
            com.my.target.core.models.sections.i r0 = (com.my.target.core.models.sections.i) r0
            java.lang.String r2 = r0.a()
            java.lang.String r3 = "fullscreen"
            boolean r2 = r2.equals(r3)
            if (r2 == 0) goto L67
            boolean r2 = r0 instanceof com.my.target.core.models.sections.d
            if (r2 == 0) goto L67
            com.my.target.core.models.sections.d r0 = (com.my.target.core.models.sections.d) r0
            java.util.ArrayList r0 = r0.g()
            java.util.Iterator r1 = r0.iterator()
        L2f:
            boolean r0 = r1.hasNext()
            if (r0 == 0) goto L81
            java.lang.Object r0 = r1.next()
            com.my.target.core.models.banners.a r0 = (com.my.target.core.models.banners.a) r0
            java.lang.String r2 = "banner"
            java.lang.String r3 = r0.getType()
            boolean r2 = r2.equals(r3)
            if (r2 == 0) goto L51
            com.my.target.core.facades.d r1 = new com.my.target.core.facades.d
            com.my.target.core.models.banners.f r0 = (com.my.target.core.models.banners.f) r0
            r1.<init>(r0, r4, r5)
            r0 = r1
        L50:
            return r0
        L51:
            java.lang.String r2 = "promo"
            java.lang.String r3 = r0.getType()
            boolean r2 = r2.equals(r3)
            if (r2 == 0) goto L2f
            com.my.target.core.facades.e r1 = new com.my.target.core.facades.e
            com.my.target.core.models.banners.g r0 = (com.my.target.core.models.banners.g) r0
            r1.<init>(r0, r4, r5)
            r0 = r1
            goto L50
        L67:
            java.lang.String r2 = r0.a()
            java.lang.String r3 = "fullscreenslider"
            boolean r2 = r2.equals(r3)
            if (r2 == 0) goto L8
            boolean r2 = r0 instanceof com.my.target.core.models.sections.e
            if (r2 == 0) goto L8
            com.my.target.core.models.sections.e r0 = (com.my.target.core.models.sections.e) r0
            com.my.target.core.facades.f r1 = new com.my.target.core.facades.f
            r1.<init>(r0, r4, r5)
            r0 = r1
            goto L50
        L81:
            r0 = 0
            goto L50
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.factories.d.a(com.my.target.core.models.c, android.content.Context):com.my.target.core.facades.c");
    }
}
