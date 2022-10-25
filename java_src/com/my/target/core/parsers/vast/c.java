package com.my.target.core.parsers.vast;

import android.text.TextUtils;
import android.util.Pair;
import android.util.Xml;
import com.my.target.Tracer;
import com.my.target.core.models.banners.e;
import com.my.target.core.models.d;
import com.my.target.core.models.k;
import com.my.target.core.parsers.a;
import com.my.target.core.parsers.vast.b;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.statistics.Statistic;
import io.reactivex.annotations.SchedulerSupport;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
/* compiled from: VASTParser.java */
/* loaded from: classes2.dex */
public class c {
    private static final String[] e = {"linkTxt"};
    final ArrayList<String> a = new ArrayList<>();
    final ArrayList<b> b = new ArrayList<>();
    public ArrayList<e> c = new ArrayList<>();
    String d;
    private final a.C0235a f;
    private final String g;
    private String h;

    /* compiled from: VASTParser.java */
    /* loaded from: classes2.dex */
    public class a extends Exception {
    }

    public static boolean a(String str) {
        String trim = str.trim();
        return trim.startsWith("<VAST") || trim.startsWith("<?xml");
    }

    public static void a(String str, com.my.target.core.models.c cVar, com.my.target.core.a aVar, d dVar, a.C0235a c0235a) throws a, IOException, XmlPullParserException {
        c cVar2 = new c(c0235a, aVar.c());
        XmlPullParser newPullParser = Xml.newPullParser();
        newPullParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", false);
        newPullParser.setInput(new StringReader(str));
        newPullParser.nextTag();
        if (2 != newPullParser.getEventType() || !"VAST".equals(newPullParser.getName())) {
            Tracer.d("Server responded with non-VAST XML");
        } else {
            newPullParser.require(2, null, "VAST");
            while (newPullParser.nextTag() == 2) {
                if (newPullParser.getEventType() == 2 && newPullParser.getName().equals("Ad")) {
                    cVar2.a(newPullParser);
                }
            }
            newPullParser.require(3, null, "VAST");
        }
        if (TextUtils.isEmpty(cVar2.h)) {
            String i = dVar.i();
            if (TextUtils.isEmpty(i)) {
                i = "preroll";
            }
            if (!cVar2.b.isEmpty()) {
                com.my.target.core.parsers.vast.a.a(cVar, cVar2, aVar, dVar, i, c0235a);
            }
        } else if (dVar.h() >= 5) {
            Tracer.d("Max redirect limit reached, redirect was dropped: " + dVar.m());
        } else {
            d dVar2 = new d(cVar2.h);
            Tracer.d("Additional section name vast = " + dVar.i());
            dVar2.b(dVar.i());
            dVar2.a(cVar2.d);
            if (cVar2.c != null) {
                dVar2.a(cVar2.c);
            }
            Iterator<b> it = cVar2.b.iterator();
            while (it.hasNext()) {
                Iterator<Pair<String, String>> it2 = it.next().f.iterator();
                while (it2.hasNext()) {
                    Pair<String, String> next = it2.next();
                    k a2 = com.my.target.core.parsers.vast.a.a((String) next.first, (String) next.second, 0.0f);
                    if (a2 != null) {
                        dVar2.a(a2);
                    }
                }
            }
            Iterator<k> it3 = dVar.a().iterator();
            while (it3.hasNext()) {
                dVar2.a(it3.next());
            }
            Iterator<k> it4 = dVar.j().iterator();
            while (it4.hasNext()) {
                dVar2.b(it4.next());
            }
            Iterator<String> it5 = cVar2.a.iterator();
            while (it5.hasNext()) {
                dVar2.b(new k(Statistic.TYPE_IMPRESSION, it5.next()));
            }
            dVar2.a(dVar.f());
            dVar2.b(dVar.g());
            dVar2.a(dVar.p());
            if (dVar.b() != null) {
                dVar2.a(dVar.b());
            }
            dVar.b(dVar2);
        }
    }

    private c(a.C0235a c0235a, String str) {
        this.f = c0235a;
        this.g = str;
    }

    private void a(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException, a {
        xmlPullParser.require(2, null, "Ad");
        while (xmlPullParser.nextTag() == 2) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (name != null) {
                    if (name.equals("Wrapper")) {
                        Tracer.d("VAST file contains wrapped ad information. []");
                        xmlPullParser.require(2, null, "Wrapper");
                        while (xmlPullParser.nextTag() == 2) {
                            if (xmlPullParser.getEventType() == 2) {
                                String name2 = xmlPullParser.getName();
                                if (name2 != null && name2.equals("Impression")) {
                                    xmlPullParser.require(2, null, "Impression");
                                    String c = c(xmlPullParser);
                                    if (!TextUtils.isEmpty(c)) {
                                        this.a.add(c);
                                        Tracer.d("Impression tracker url for wrapper: " + c);
                                    }
                                    xmlPullParser.require(3, null, "Impression");
                                } else if (name2 != null && name2.equals("Creatives")) {
                                    d(xmlPullParser);
                                } else if (name2 != null && name2.equals("Extensions")) {
                                    e(xmlPullParser);
                                } else if (name2 == null || !name2.equals("VASTAdTagURI")) {
                                    f(xmlPullParser);
                                } else {
                                    xmlPullParser.require(2, null, "VASTAdTagURI");
                                    this.h = c(xmlPullParser);
                                }
                            }
                        }
                        xmlPullParser.require(3, null, "Wrapper");
                    } else if (name.equals("InLine")) {
                        Tracer.d("VAST file contains inline ad information.");
                        b(xmlPullParser);
                    }
                }
                f(xmlPullParser);
            }
        }
        xmlPullParser.require(3, null, "Ad");
    }

    private void b(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException, a {
        xmlPullParser.require(2, null, "InLine");
        while (xmlPullParser.nextTag() == 2) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (name != null && name.equals("Impression")) {
                    xmlPullParser.require(2, null, "Impression");
                    String c = c(xmlPullParser);
                    if (!TextUtils.isEmpty(c)) {
                        this.a.add(c);
                        Tracer.d("Impression tracker url for inline: " + c);
                    }
                    xmlPullParser.require(3, null, "Impression");
                } else if (name != null && name.equals("Creatives")) {
                    d(xmlPullParser);
                } else if (name != null && name.equals("Extensions")) {
                    e(xmlPullParser);
                } else {
                    f(xmlPullParser);
                }
            }
        }
        xmlPullParser.require(3, null, "InLine");
    }

    private static String c(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        String str = "";
        if (xmlPullParser.next() == 4) {
            str = xmlPullParser.getText();
            xmlPullParser.nextTag();
        } else {
            Tracer.d("No text: " + xmlPullParser.getName());
        }
        return str.trim();
    }

    private void d(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException, a {
        xmlPullParser.require(2, null, "Creatives");
        while (xmlPullParser.nextTag() == 2) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (name != null && name.equals("Creative")) {
                    String attributeValue = xmlPullParser.getAttributeValue(null, "id");
                    xmlPullParser.require(2, null, "Creative");
                    while (xmlPullParser.nextTag() == 2) {
                        if (xmlPullParser.getEventType() == 2) {
                            String name2 = xmlPullParser.getName();
                            if (name2 != null && name2.equals("Linear")) {
                                b bVar = new b();
                                bVar.a = attributeValue;
                                this.f.e = "Creative id = " + attributeValue;
                                bVar.b = xmlPullParser.getAttributeValue(null, "skipoffset");
                                a(xmlPullParser, bVar);
                                this.b.add(bVar);
                            } else if (name2 != null && name2.equals("CompanionAds")) {
                                this.f.e = "Creative id = " + attributeValue;
                                String attributeValue2 = xmlPullParser.getAttributeValue(null, "required");
                                if (attributeValue2 != null && !"all".equals(attributeValue2) && !"any".equals(attributeValue2) && !SchedulerSupport.NONE.equals(attributeValue2)) {
                                    com.my.target.core.parsers.a.b("Wrong companion required attribute: " + attributeValue2, this.f, "Wrong attribute: ");
                                    attributeValue2 = null;
                                }
                                a(xmlPullParser, attributeValue2);
                            } else {
                                f(xmlPullParser);
                            }
                        }
                    }
                    xmlPullParser.require(3, null, "Creative");
                } else {
                    f(xmlPullParser);
                }
            }
        }
        xmlPullParser.require(3, null, "Creatives");
    }

    private void e(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException, a {
        xmlPullParser.require(2, null, "Extensions");
        while (xmlPullParser.nextTag() == 2) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (name != null && name.equals("Extension")) {
                    String attributeValue = xmlPullParser.getAttributeValue(null, ServerKeys.TYPE);
                    for (String str : e) {
                        if (!str.equals(attributeValue)) {
                            f(xmlPullParser);
                        } else {
                            xmlPullParser.require(2, null, "Extension");
                            if ("linkTxt".equals(attributeValue)) {
                                String c = c(xmlPullParser);
                                try {
                                    this.d = URLDecoder.decode(c, "utf-8");
                                    Tracer.d("VAST linkTxt decoded text = " + this.d);
                                } catch (UnsupportedEncodingException e2) {
                                    com.my.target.core.parsers.a.b("Unable to decode linkTxt extention: '" + c + "'", this.f, "Decoding exception");
                                }
                                Tracer.d("VAST linkTxt raw text: " + c);
                            }
                            xmlPullParser.require(3, null, "Extension");
                        }
                    }
                } else {
                    f(xmlPullParser);
                }
            }
        }
        xmlPullParser.require(3, null, "Extensions");
    }

    private void a(XmlPullParser xmlPullParser, String str) throws IOException, XmlPullParserException {
        xmlPullParser.require(2, null, "CompanionAds");
        while (xmlPullParser.nextTag() == 2) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (name != null && name.equals("Companion")) {
                    String attributeValue = xmlPullParser.getAttributeValue(null, "width");
                    String attributeValue2 = xmlPullParser.getAttributeValue(null, "height");
                    if (TextUtils.isEmpty(attributeValue) || TextUtils.isEmpty(attributeValue2)) {
                        com.my.target.core.parsers.a.b("No required companion attributes, width = " + attributeValue + " height = " + attributeValue2, this.f, "Wrong attribute: ");
                        f(xmlPullParser);
                    } else {
                        e c = com.my.target.core.factories.a.c(xmlPullParser.getAttributeValue(null, "id"));
                        try {
                            c.setWidth(Integer.parseInt(attributeValue));
                            c.setHeight(Integer.parseInt(attributeValue2));
                            c.setRequired(str);
                            String attributeValue3 = xmlPullParser.getAttributeValue(null, "assetWidth");
                            String attributeValue4 = xmlPullParser.getAttributeValue(null, "assetHeight");
                            if (!TextUtils.isEmpty(attributeValue3) && !TextUtils.isEmpty(attributeValue4)) {
                                try {
                                    c.setAssetHeight(Integer.parseInt(attributeValue4));
                                    c.setAssetWidth(Integer.parseInt(attributeValue3));
                                } catch (NumberFormatException e2) {
                                    Tracer.d("wrong VAST asset dimensions: " + e2.getMessage());
                                }
                            }
                            String attributeValue5 = xmlPullParser.getAttributeValue(null, "expandedWidth");
                            String attributeValue6 = xmlPullParser.getAttributeValue(null, "expandedHeight");
                            if (!TextUtils.isEmpty(attributeValue5) && !TextUtils.isEmpty(attributeValue6)) {
                                try {
                                    c.setExpandedHeight(Integer.parseInt(attributeValue6));
                                    c.setExpandedWidth(Integer.parseInt(attributeValue5));
                                } catch (NumberFormatException e3) {
                                    Tracer.d("wrong VAST expanded dimensions " + e3.getMessage());
                                }
                            }
                            c.setAdSlotID(xmlPullParser.getAttributeValue(null, "adSlotID"));
                            c.setApiFramework(xmlPullParser.getAttributeValue(null, "apiFramework"));
                            this.c.add(c);
                            while (xmlPullParser.nextTag() == 2) {
                                String name2 = xmlPullParser.getName();
                                if (name2 != null) {
                                    if (name2.equals("StaticResource")) {
                                        c.setStaticResource(c(xmlPullParser));
                                    } else if (name2.equals("HTMLResource")) {
                                        c.setHtmlResource(c(xmlPullParser));
                                    } else if (name2.equals("IFrameResource")) {
                                        c.setIframeResource(c(xmlPullParser));
                                    }
                                }
                                f(xmlPullParser);
                            }
                        } catch (NumberFormatException e4) {
                            com.my.target.core.parsers.a.b("Unable  to convert required companion attributes, width = " + attributeValue + " height = " + attributeValue2, this.f, "Wrong attribute: ");
                            f(xmlPullParser);
                        }
                    }
                } else {
                    f(xmlPullParser);
                }
            }
        }
        xmlPullParser.require(3, null, "CompanionAds");
    }

    private void a(XmlPullParser xmlPullParser, b bVar) throws IOException, XmlPullParserException, a {
        xmlPullParser.require(2, null, "Linear");
        while (xmlPullParser.nextTag() == 2) {
            String name = xmlPullParser.getName();
            if (xmlPullParser.getEventType() == 2) {
                if (name != null && name.equals("Duration")) {
                    xmlPullParser.require(2, null, "Duration");
                    bVar.c = c(xmlPullParser);
                    xmlPullParser.require(3, null, "Duration");
                } else if (name == null || !name.equals("TrackingEvents")) {
                    if (name != null && name.equals("MediaFiles")) {
                        ArrayList<b.a> arrayList = new ArrayList<>();
                        a(xmlPullParser, arrayList);
                        if (!arrayList.isEmpty()) {
                            bVar.d = arrayList;
                        } else {
                            com.my.target.core.parsers.a.b("Mediafiles array is empty!", this.f, "Empty mediafiles");
                        }
                    } else if (name != null && name.equals("VideoClicks")) {
                        b(xmlPullParser, bVar);
                    } else {
                        f(xmlPullParser);
                    }
                } else {
                    xmlPullParser.require(2, null, "TrackingEvents");
                    while (xmlPullParser.nextTag() == 2) {
                        if (xmlPullParser.getEventType() == 2) {
                            String name2 = xmlPullParser.getName();
                            if (name2 != null && name2.equals("Tracking")) {
                                String attributeValue = xmlPullParser.getAttributeValue(null, "event");
                                String attributeValue2 = xmlPullParser.getAttributeValue(null, "offset");
                                xmlPullParser.require(2, null, "Tracking");
                                if (attributeValue.equals("progress") && !TextUtils.isEmpty(attributeValue2)) {
                                    bVar.e.add(new Pair<>(attributeValue2, c(xmlPullParser)));
                                } else {
                                    bVar.f.add(new Pair<>(attributeValue, c(xmlPullParser)));
                                }
                                Tracer.d("Added VAST tracking \"" + attributeValue + "\"");
                                xmlPullParser.require(3, null, "Tracking");
                            } else {
                                f(xmlPullParser);
                            }
                        }
                    }
                    xmlPullParser.require(3, null, "TrackingEvents");
                }
            }
        }
        xmlPullParser.require(3, null, "Linear");
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void a(org.xmlpull.v1.XmlPullParser r13, java.util.ArrayList<com.my.target.core.parsers.vast.b.a> r14) throws com.my.target.core.parsers.vast.c.a, java.io.IOException, org.xmlpull.v1.XmlPullParserException {
        /*
            r12 = this;
            r11 = 3
            r2 = 1
            r10 = 2
            r1 = 0
            r9 = 0
            java.lang.String r0 = "MediaFiles"
            r13.require(r10, r9, r0)
        Lb:
            int r0 = r13.nextTag()
            if (r0 != r10) goto Lcf
            int r0 = r13.getEventType()
            if (r0 != r10) goto Lb
            java.lang.String r0 = r13.getName()
            if (r0 == 0) goto Lca
            java.lang.String r3 = "MediaFile"
            boolean r0 = r0.equals(r3)
            if (r0 == 0) goto Lca
            java.lang.String r0 = "MediaFile"
            r13.require(r10, r9, r0)
            java.lang.String r0 = "type"
            java.lang.String r3 = r13.getAttributeValue(r9, r0)
            java.lang.String r0 = "bitrate"
            java.lang.String r4 = r13.getAttributeValue(r9, r0)
            java.lang.String r0 = "width"
            java.lang.String r5 = r13.getAttributeValue(r9, r0)
            java.lang.String r0 = "height"
            java.lang.String r6 = r13.getAttributeValue(r9, r0)
            java.lang.String r0 = c(r13)
            java.lang.String r7 = com.my.target.core.parsers.vast.a.a(r0)
            java.lang.String r0 = r12.g
            boolean r8 = android.text.TextUtils.isEmpty(r3)
            if (r8 != 0) goto Lc1
            java.lang.String r8 = "video/mp4"
            boolean r8 = r8.equals(r3)
            if (r8 == 0) goto Lad
            java.lang.String r8 = "instreamads"
            boolean r8 = r0.equals(r8)
            if (r8 == 0) goto Lad
            r0 = r2
        L6b:
            if (r0 == 0) goto La5
            boolean r0 = android.text.TextUtils.isEmpty(r7)
            if (r0 != 0) goto La5
            com.my.target.core.parsers.vast.b$a r8 = new com.my.target.core.parsers.vast.b$a
            r8.<init>(r7, r3)
            if (r5 == 0) goto Lc3
            java.lang.Integer r0 = java.lang.Integer.valueOf(r5)
            int r0 = r0.intValue()
        L82:
            r8.c = r0
            if (r6 == 0) goto Lc5
            java.lang.Integer r0 = java.lang.Integer.valueOf(r6)
            int r0 = r0.intValue()
        L8e:
            r8.d = r0
            if (r4 == 0) goto Lc7
            boolean r0 = android.text.TextUtils.isDigitsOnly(r4)
            if (r0 == 0) goto Lc7
            java.lang.Integer r0 = java.lang.Integer.valueOf(r4)
            int r0 = r0.intValue()
            r8.e = r0
        La2:
            r14.add(r8)
        La5:
            java.lang.String r0 = "MediaFile"
            r13.require(r11, r9, r0)
            goto Lb
        Lad:
            java.lang.String r8 = "audio"
            boolean r8 = r3.startsWith(r8)
            if (r8 == 0) goto Lc1
            java.lang.String r8 = "instreamaudioads"
            boolean r0 = r0.equals(r8)
            if (r0 == 0) goto Lc1
            r0 = r2
            goto L6b
        Lc1:
            r0 = r1
            goto L6b
        Lc3:
            r0 = r1
            goto L82
        Lc5:
            r0 = r1
            goto L8e
        Lc7:
            r8.e = r1
            goto La2
        Lca:
            f(r13)
            goto Lb
        Lcf:
            java.lang.String r0 = "MediaFiles"
            r13.require(r11, r9, r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.parsers.vast.c.a(org.xmlpull.v1.XmlPullParser, java.util.ArrayList):void");
    }

    private static void b(XmlPullParser xmlPullParser, b bVar) throws IOException, XmlPullParserException {
        xmlPullParser.require(2, null, "VideoClicks");
        while (xmlPullParser.nextTag() == 2) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (name != null && name.equals("ClickThrough")) {
                    xmlPullParser.require(2, null, "ClickThrough");
                    bVar.g = c(xmlPullParser);
                    xmlPullParser.require(3, null, "ClickThrough");
                } else if (name != null && name.equals("ClickTracking")) {
                    xmlPullParser.require(2, null, "ClickTracking");
                    bVar.f.add(new Pair<>("ClickTracking", c(xmlPullParser)));
                    xmlPullParser.require(3, null, "ClickTracking");
                } else {
                    f(xmlPullParser);
                }
            }
        }
        xmlPullParser.require(3, null, "VideoClicks");
    }

    private static void f(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        if (xmlPullParser.getEventType() != 2) {
            throw new IllegalStateException();
        }
        int i = 1;
        while (i != 0) {
            switch (xmlPullParser.next()) {
                case 2:
                    i++;
                    break;
                case 3:
                    i--;
                    break;
            }
        }
    }
}
