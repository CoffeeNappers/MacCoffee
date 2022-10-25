package com.my.target.core.factories;

import com.google.android.exoplayer2.util.MimeTypes;
import com.my.target.core.models.banners.f;
import com.my.target.core.models.banners.g;
import com.my.target.core.models.banners.h;
import com.my.target.core.models.banners.j;
import com.my.target.core.models.banners.k;
import com.my.target.core.models.banners.l;
import com.my.target.core.models.banners.m;
import com.vkontakte.android.data.UserNotification;
/* compiled from: BannersFactory.java */
/* loaded from: classes2.dex */
public final class a {
    public static com.my.target.core.models.banners.d a(String str, String str2, String str3) {
        if ("nativeads".equals(str3)) {
            if ("promo".equals(str2) || UserNotification.LAYOUT_NEWSFEED_BANNER.equals(str2) || "teaser".equals(str2)) {
                return new h(str, str2);
            }
        } else if ("fullscreen".equals(str3)) {
            if ("fullscreen".equals(str2) || UserNotification.LAYOUT_NEWSFEED_BANNER.equals(str2)) {
                return new f(str, UserNotification.LAYOUT_NEWSFEED_BANNER);
            }
            if ("promo".equals(str2)) {
                return new g(str, str2);
            }
        } else if ("fullscreenslider".equals(str3)) {
            if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(str2)) {
                return new f(str, UserNotification.LAYOUT_NEWSFEED_BANNER);
            }
        } else if ("standard".equals(str3)) {
            if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(str2) || "teaser".equals(str2)) {
                return new j(str, str2);
            }
        } else if ("showcase".equals(str3) || "appwall".equals(str3)) {
            if ("showcase".equals(str2) || "teaser".equals(str2)) {
                return new com.my.target.core.models.banners.b(str, str2);
            }
        } else if ("video".equals(str3)) {
            if ("video".equals(str2)) {
                return a(str);
            }
            if ("statistics".equals(str2)) {
                return new l(str, str2);
            }
        } else if (MimeTypes.BASE_TYPE_AUDIO.equals(str3)) {
            if (MimeTypes.BASE_TYPE_AUDIO.equals(str2)) {
                return b(str);
            }
            if ("statistics".equals(str2)) {
                return new k(str, str2);
            }
        }
        return null;
    }

    public static m a(String str) {
        return new m(str, "video");
    }

    public static com.my.target.core.models.banners.c b(String str) {
        return new com.my.target.core.models.banners.c(str, MimeTypes.BASE_TYPE_AUDIO);
    }

    public static com.my.target.core.models.banners.e c(String str) {
        return new com.my.target.core.models.banners.e(str, "companion");
    }
}
