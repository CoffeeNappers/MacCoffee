.class public Lcom/my/target/core/parsers/rb/b;
.super Ljava/lang/Object;
.source "RBBannerParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lorg/json/JSONObject;Lcom/my/target/core/models/sections/i;Ljava/util/ArrayList;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)Lcom/my/target/core/models/banners/d;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/my/target/core/models/sections/i;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/my/target/core/parsers/a$a;",
            "Ljava/lang/String;",
            ")",
            "Lcom/my/target/core/models/banners/d;"
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x1

    const/4 v1, 0x0

    const/4 v6, 0x0

    .line 66
    const-string/jumbo v0, "Parsing banner"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Banner_id = \""

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "bannerID"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    .line 69
    const-class v0, Lcom/my/target/core/parsers/rb/b;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->c:Ljava/lang/String;

    .line 71
    const-string/jumbo v0, "id"

    const-string/jumbo v2, ""

    invoke-static {p0, v0, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 75
    const-string/jumbo v0, "bannerID"

    const-string/jumbo v2, ""

    invoke-static {p0, v0, p3, v2, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 79
    :cond_0
    const-string/jumbo v2, "type"

    const-string/jumbo v3, ""

    invoke-static {p0, v2, p3, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v7, v1

    .line 184
    :goto_0
    return-object v7

    .line 87
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v7, v1

    .line 89
    goto :goto_0

    .line 92
    :cond_2
    invoke-interface {p1, v0}, Lcom/my/target/core/models/sections/i;->b(Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v3

    if-eqz v3, :cond_3

    move-object v7, v1

    goto :goto_0

    .line 94
    :cond_3
    invoke-interface {p1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/my/target/core/factories/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v7

    .line 96
    if-nez v7, :cond_4

    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "Mismatch for banner type <"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ">, banner id <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ">, section type <"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 99
    invoke-interface {p1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "MismatchBannerType"

    .line 98
    invoke-static {v0, p3, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    move-object v7, v1

    .line 101
    goto :goto_0

    .line 104
    :cond_4
    const-string/jumbo v0, "bundle_id"

    const-string/jumbo v2, ""

    invoke-static {p0, v0, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 108
    invoke-interface {v7, v0}, Lcom/my/target/core/models/banners/d;->setBundleId(Ljava/lang/String;)V

    .line 110
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 112
    invoke-interface {v7, v4}, Lcom/my/target/core/models/banners/d;->setAppInstalled(Z)V

    .line 116
    :cond_5
    invoke-static {v7, p0, p3, p1}, Lcom/my/target/core/parsers/rb/b;->e(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    .line 118
    instance-of v0, v7, Lcom/my/target/core/models/banners/j;

    if-eqz v0, :cond_7

    .line 1988
    const-string/jumbo v0, "Parsing standard banner"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    move-object v0, v7

    .line 1990
    check-cast v0, Lcom/my/target/core/models/banners/j;

    .line 1991
    const-string/jumbo v2, "title"

    const-string/jumbo v3, ""

    .line 1992
    invoke-static {p0, v2, p3, v3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 1991
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->e(Ljava/lang/String;)V

    .line 1994
    const-string/jumbo v2, "description"

    const-string/jumbo v3, ""

    .line 1995
    invoke-static {p0, v2, p3, v3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 1994
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->b(Ljava/lang/String;)V

    .line 1997
    const-string/jumbo v2, "disclaimer"

    const-string/jumbo v3, ""

    .line 1998
    invoke-static {p0, v2, p3, v3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 1997
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->c(Ljava/lang/String;)V

    .line 2000
    const-string/jumbo v2, "votes"

    .line 2001
    invoke-static {p0, v2, p3, v6, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v2

    .line 2000
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->a(I)V

    .line 2003
    const-string/jumbo v2, "category"

    const-string/jumbo v3, ""

    .line 2004
    invoke-static {p0, v2, p3, v3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 2003
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->a(Ljava/lang/String;)V

    .line 2006
    const-string/jumbo v2, "domain"

    const-string/jumbo v3, ""

    .line 2007
    invoke-static {p0, v2, p3, v3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 2006
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->d(Ljava/lang/String;)V

    .line 2010
    const-string/jumbo v2, "iconLink"

    const-string/jumbo v3, "iconHeight"

    const-string/jumbo v4, "iconWidth"

    invoke-static {p0, v2, v3, v4, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->b(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2015
    const-string/jumbo v2, "rating"

    .line 2016
    invoke-static {p0, v2, p3}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v2

    .line 2015
    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->a(F)V

    .line 2019
    const-string/jumbo v2, "imageLink"

    const-string/jumbo v3, "imageHeight"

    const-string/jumbo v4, "imageWidth"

    invoke-static {p0, v2, v3, v4, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->c(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2023
    const-string/jumbo v2, "mainImageLink"

    const-string/jumbo v3, "mainImageHeight"

    const-string/jumbo v4, "mainImageWidth"

    invoke-static {p0, v2, v3, v4, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/j;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2029
    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getTimeout()I

    move-result v0

    if-nez v0, :cond_6

    const-string/jumbo v0, "standard"

    invoke-interface {p1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2031
    check-cast p1, Lcom/my/target/core/models/sections/j;

    invoke-virtual {p1}, Lcom/my/target/core/models/sections/j;->k()I

    move-result v0

    invoke-interface {v7, v0}, Lcom/my/target/core/models/banners/d;->setTimeout(I)V

    .line 122
    :cond_6
    const-string/jumbo v0, "banner"

    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    move-object v0, v7

    check-cast v0, Lcom/my/target/core/models/banners/j;

    .line 123
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-nez v0, :cond_9

    .line 125
    const-string/jumbo v0, "Banner with type \'banner\' has no image"

    const-string/jumbo v2, "No image in banner"

    invoke-static {v0, p3, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    move-object v7, v1

    .line 128
    goto/16 :goto_0

    .line 132
    :cond_7
    instance-of v0, v7, Lcom/my/target/core/models/banners/b;

    if-eqz v0, :cond_a

    .line 2896
    const-string/jumbo v0, "Parsing appwall banner"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    move-object v0, v7

    .line 2898
    check-cast v0, Lcom/my/target/core/models/banners/b;

    .line 2899
    const-string/jumbo v1, "hasNotification"

    .line 2900
    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    .line 2899
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->a(Z)V

    .line 2902
    const-string/jumbo v1, "Banner"

    .line 2903
    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    .line 2902
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->e(Z)V

    .line 2905
    const-string/jumbo v1, "bubble_id"

    const-string/jumbo v2, ""

    .line 2906
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2905
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->c(Ljava/lang/String;)V

    .line 2908
    const-string/jumbo v1, "RequireCategoryHighlight"

    .line 2909
    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    .line 2908
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->c(Z)V

    .line 2911
    const-string/jumbo v1, "icon_hd"

    .line 2912
    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 2911
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->b(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2914
    const-string/jumbo v1, "ItemHighlight"

    .line 2915
    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    .line 2914
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->d(Z)V

    .line 2917
    const-string/jumbo v1, "Main"

    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->b(Z)V

    .line 2919
    const-string/jumbo v1, "mrgs_id"

    .line 2920
    invoke-static {p0, v1, p3, v6, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 2919
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->a(I)V

    .line 2922
    const-string/jumbo v1, "votes"

    .line 2923
    invoke-static {p0, v1, p3, v6, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 2922
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->b(I)V

    .line 2925
    const-string/jumbo v1, "rating"

    .line 2926
    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v1

    .line 2925
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->a(F)V

    .line 2927
    const-string/jumbo v1, "RequireWifi"

    .line 2928
    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    .line 2927
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->f(Z)V

    .line 2930
    const-string/jumbo v1, "title"

    const-string/jumbo v2, ""

    .line 2931
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2930
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->a(Ljava/lang/String;)V

    .line 2933
    const-string/jumbo v1, "description"

    const-string/jumbo v2, ""

    .line 2934
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2933
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->b(Ljava/lang/String;)V

    .line 2936
    const-string/jumbo v1, "labelType"

    const-string/jumbo v2, ""

    .line 2937
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2936
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->d(Ljava/lang/String;)V

    .line 2939
    const-string/jumbo v1, "status"

    const-string/jumbo v2, ""

    .line 2940
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2939
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->e(Ljava/lang/String;)V

    .line 2942
    const-string/jumbo v1, "paidType"

    const-string/jumbo v2, ""

    .line 2943
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2942
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->f(Ljava/lang/String;)V

    .line 2945
    const-string/jumbo v1, "subitem"

    .line 2946
    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    .line 2945
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->g(Z)V

    .line 2948
    const-string/jumbo v1, "coins"

    .line 2949
    invoke-static {p0, v1, p3, v6, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 2948
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->c(I)V

    .line 2951
    const-string/jumbo v1, "coins_icon_hd"

    .line 2952
    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 2951
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->c(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2954
    const-string/jumbo v1, "coins_icon_bgcolor"

    const v2, -0x86de2

    .line 2955
    invoke-static {p0, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    .line 2954
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->d(I)V

    .line 2957
    const-string/jumbo v1, "coins_icon_textcolor"

    .line 2958
    invoke-static {p0, v1, p3, v5}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    .line 2957
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->e(I)V

    .line 2960
    const-string/jumbo v1, "cross_notif_icon_hd"

    .line 2961
    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 2960
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->h(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2964
    const-string/jumbo v1, "appwall"

    invoke-interface {p1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 2966
    check-cast p1, Lcom/my/target/core/models/sections/b;

    .line 2967
    new-instance v1, Lcom/my/target/nativeads/models/ImageData;

    invoke-virtual {p1}, Lcom/my/target/core/models/sections/b;->i()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;)V

    .line 2968
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->f(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2970
    new-instance v1, Lcom/my/target/nativeads/models/ImageData;

    invoke-virtual {p1}, Lcom/my/target/core/models/sections/b;->k()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;)V

    .line 2971
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->e(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2973
    new-instance v1, Lcom/my/target/nativeads/models/ImageData;

    invoke-virtual {p1}, Lcom/my/target/core/models/sections/b;->j()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;)V

    .line 2974
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->d(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2976
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/b;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/my/target/core/models/sections/b;->o(Ljava/lang/String;)Lcom/my/target/core/models/g;

    move-result-object v1

    .line 2977
    if-eqz v1, :cond_8

    .line 2978
    new-instance v2, Lcom/my/target/nativeads/models/ImageData;

    invoke-virtual {v1}, Lcom/my/target/core/models/g;->b()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/my/target/core/models/banners/b;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 2980
    :cond_8
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/b;->isItemHighlight()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {p1}, Lcom/my/target/core/models/sections/b;->l()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 2981
    new-instance v1, Lcom/my/target/nativeads/models/ImageData;

    invoke-virtual {p1}, Lcom/my/target/core/models/sections/b;->l()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/b;->g(Lcom/my/target/nativeads/models/ImageData;)V

    .line 182
    :cond_9
    :goto_1
    invoke-static {v7, p0, p3}, Lcom/my/target/core/parsers/rb/b;->a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V

    goto/16 :goto_0

    .line 136
    :cond_a
    instance-of v0, v7, Lcom/my/target/core/models/banners/f;

    if-eqz v0, :cond_d

    .line 138
    invoke-static {v7, p0, p3, p1}, Lcom/my/target/core/parsers/rb/b;->d(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    move-object v0, v7

    .line 139
    check-cast v0, Lcom/my/target/core/models/banners/f;

    .line 140
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/f;->c()Ljava/util/List;

    move-result-object v2

    move-object v0, v7

    .line 141
    check-cast v0, Lcom/my/target/core/models/banners/f;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/f;->b()Ljava/util/List;

    move-result-object v0

    .line 143
    if-eqz v2, :cond_b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_b
    if-eqz v0, :cond_c

    .line 144
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 146
    :cond_c
    const-string/jumbo v0, "No images in FSImageBanner"

    const-string/jumbo v2, "Required field absence"

    invoke-static {v0, p3, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    move-object v7, v1

    .line 149
    goto/16 :goto_0

    .line 152
    :cond_d
    instance-of v0, v7, Lcom/my/target/core/models/banners/g;

    if-eqz v0, :cond_11

    const-string/jumbo v0, "fullscreen"

    invoke-interface {p1}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 3714
    const-string/jumbo v0, "Parsing fs promo banner"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    move-object v0, v7

    .line 3716
    check-cast v0, Lcom/my/target/core/models/banners/g;

    .line 3717
    const-string/jumbo v1, "title"

    const-string/jumbo v2, ""

    .line 3718
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 3717
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->f(Ljava/lang/String;)V

    .line 3720
    const-string/jumbo v1, "description"

    const-string/jumbo v2, ""

    .line 3721
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 3720
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->b(Ljava/lang/String;)V

    .line 3723
    const-string/jumbo v1, "disclaimer"

    const-string/jumbo v2, ""

    .line 3724
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 3723
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->c(Ljava/lang/String;)V

    .line 3726
    const-string/jumbo v1, "votes"

    .line 3727
    invoke-static {p0, v1, p3, v6, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 3726
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->f(I)V

    .line 3729
    const-string/jumbo v1, "category"

    const-string/jumbo v2, ""

    .line 3730
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 3729
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->a(Ljava/lang/String;)V

    .line 3732
    const-string/jumbo v1, "rating"

    .line 3733
    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v1

    .line 3732
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->b(F)V

    .line 3734
    const-string/jumbo v1, "domain"

    const-string/jumbo v2, ""

    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->d(Ljava/lang/String;)V

    .line 3736
    const-string/jumbo v1, "subcategory"

    const-string/jumbo v2, ""

    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->e(Ljava/lang/String;)V

    .line 3739
    const-string/jumbo v1, "iconLink"

    const-string/jumbo v2, "iconHeight"

    const-string/jumbo v3, "iconWidth"

    invoke-static {p0, v1, v2, v3, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->d(Lcom/my/target/nativeads/models/ImageData;)V

    .line 3747
    const-string/jumbo v1, "imageLink"

    const-string/jumbo v2, "imageHeight"

    const-string/jumbo v3, "imageWidth"

    invoke-static {p0, v1, v2, v3, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->e(Lcom/my/target/nativeads/models/ImageData;)V

    .line 3755
    const-string/jumbo v1, "finalLink"

    const-string/jumbo v2, ""

    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->setFinalLink(Ljava/lang/String;)V

    .line 3758
    const-string/jumbo v1, "footerColor"

    const v2, -0x999a

    .line 3759
    invoke-static {p0, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    .line 3758
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->a(I)V

    .line 3761
    const-string/jumbo v1, "ctaButtonColor"

    const v2, -0xff540e

    .line 3762
    invoke-static {p0, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    .line 3761
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->b(I)V

    .line 3764
    const-string/jumbo v1, "ctaButtonTouchColor"

    const v2, -0xff8957

    .line 3765
    invoke-static {p0, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    .line 3764
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->c(I)V

    .line 3767
    const-string/jumbo v1, "ctaButtonTextColor"

    .line 3768
    invoke-static {p0, v1, p3, v5}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    .line 3767
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->d(I)V

    move-object v8, p1

    .line 3771
    check-cast v8, Lcom/my/target/core/models/sections/d;

    .line 3773
    const-string/jumbo v1, "style"

    .line 3775
    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->o()I

    move-result v2

    .line 3774
    invoke-static {p0, v1, p3, v2, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 3773
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->e(I)V

    .line 3777
    const-string/jumbo v2, "allowCloseDelay"

    .line 3780
    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->i()F

    move-result v1

    float-to-double v4, v1

    move-object v1, p0

    move-object v3, p3

    .line 3777
    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v2

    double-to-float v1, v2

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->a(F)V

    .line 3783
    const-string/jumbo v1, "close_icon_hd"

    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 3785
    if-nez v1, :cond_e

    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->k()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 3786
    :cond_e
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 3788
    const-string/jumbo v1, "play_icon_hd"

    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 3790
    if-nez v1, :cond_f

    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->l()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 3791
    :cond_f
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->b(Lcom/my/target/nativeads/models/ImageData;)V

    .line 3793
    const-string/jumbo v1, "store_icon_hd"

    invoke-static {p0, v1, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 3796
    if-nez v1, :cond_10

    .line 3797
    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->n()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 3798
    :cond_10
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->c(Lcom/my/target/nativeads/models/ImageData;)V

    .line 3800
    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->u()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->a(Z)V

    .line 3801
    invoke-virtual {v8}, Lcom/my/target/core/models/sections/d;->t()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->b(Z)V

    .line 3803
    const-string/jumbo v1, "video"

    invoke-static {p0, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;

    move-result-object v2

    .line 3806
    const/16 v1, 0xe

    invoke-static {v1}, Lcom/my/target/core/utils/l;->c(I)Z

    move-result v1

    if-eqz v1, :cond_9

    if-eqz v2, :cond_9

    .line 3809
    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getId()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, "video"

    const-string/jumbo v4, "video"

    invoke-static {v1, v3, v4}, Lcom/my/target/core/factories/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v1

    .line 3811
    instance-of v3, v1, Lcom/my/target/core/models/banners/m;

    if-eqz v3, :cond_9

    .line 3813
    invoke-static {v1, v2, p3, p1}, Lcom/my/target/core/parsers/rb/b;->e(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    .line 3814
    invoke-static {v1, v2, p3, p1}, Lcom/my/target/core/parsers/rb/b;->b(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 3818
    invoke-static {v1, v2, p3}, Lcom/my/target/core/parsers/rb/b;->a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V

    .line 3819
    check-cast v1, Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/g;->a(Lcom/my/target/core/models/banners/m;)V

    goto/16 :goto_1

    .line 157
    :cond_11
    instance-of v0, v7, Lcom/my/target/core/models/banners/h;

    if-eqz v0, :cond_12

    .line 159
    invoke-static {v7, p0, p3, p1}, Lcom/my/target/core/parsers/rb/b;->c(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    goto/16 :goto_1

    .line 160
    :cond_12
    const-string/jumbo v0, "instreamads"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 162
    const-string/jumbo v0, "video"

    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    const-string/jumbo v0, "statistics"

    .line 163
    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    .line 162
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 165
    :cond_13
    invoke-static {v7, p0, p3, p1}, Lcom/my/target/core/parsers/rb/b;->b(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)Z

    move-result v0

    if-nez v0, :cond_9

    move-object v7, v1

    .line 167
    goto/16 :goto_0

    .line 170
    :cond_14
    const-string/jumbo v0, "instreamaudioads"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 172
    const-string/jumbo v0, "audio"

    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    const-string/jumbo v0, "statistics"

    .line 173
    invoke-interface {v7}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    .line 172
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 175
    :cond_15
    invoke-static {v7, p0, p3, p1}, Lcom/my/target/core/parsers/rb/b;->a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)Z

    move-result v0

    if-nez v0, :cond_9

    move-object v7, v1

    .line 177
    goto/16 :goto_0
.end method

.method private static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Lcom/my/target/core/parsers/a$a;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/e;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 377
    const-string/jumbo v0, "Parsing banner mediafiles"

    iput-object v0, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 379
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 381
    invoke-static {p0, p1, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v4

    .line 383
    if-nez v4, :cond_0

    move-object v0, v1

    .line 429
    :goto_0
    return-object v0

    .line 385
    :cond_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    .line 387
    if-nez v5, :cond_1

    .line 389
    const-string/jumbo v0, "Empty mediafiles array"

    const-string/jumbo v2, "Empty mediafiles array"

    invoke-static {v0, p2, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    move-object v0, v1

    .line 391
    goto :goto_0

    :cond_1
    move v2, v3

    .line 394
    :goto_1
    if-ge v2, v5, :cond_4

    .line 396
    invoke-static {v2, v4, p1, p2}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v6

    .line 398
    const-string/jumbo v0, "src"

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v6, v0, p2, v7, v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 402
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xc

    if-ge v7, v8, :cond_2

    if-eqz v0, :cond_2

    const-string/jumbo v7, "https"

    .line 404
    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 406
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 407
    const/4 v0, 0x4

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 410
    :cond_2
    const-string/jumbo v7, "bitrate"

    invoke-static {v6, v7, p2, v3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v6

    .line 414
    if-eqz v0, :cond_3

    .line 416
    new-instance v7, Lcom/my/target/core/models/e;

    invoke-direct {v7, v0}, Lcom/my/target/core/models/e;-><init>(Ljava/lang/String;)V

    .line 417
    invoke-virtual {v7, v6}, Lcom/my/target/core/models/e;->a(I)V

    .line 418
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    :goto_2
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    .line 421
    :cond_3
    const-string/jumbo v0, "Mediafile src is null"

    .line 422
    const-string/jumbo v6, "Wrong mediafile"

    invoke-static {v0, p2, v6}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    move-object v0, v1

    .line 429
    goto :goto_0
.end method

.method private static a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V
    .locals 2

    .prologue
    .line 434
    invoke-static {p1, p2}, Lcom/my/target/core/parsers/rb/f;->a(Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)Ljava/util/ArrayList;

    move-result-object v0

    .line 436
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->addStats(Ljava/util/ArrayList;)V

    .line 437
    :cond_0
    return-void
.end method

.method private static a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)Z
    .locals 11

    .prologue
    .line 192
    const-string/jumbo v0, "Parsing audio banner"

    iput-object v0, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    move-object v0, p0

    .line 194
    check-cast v0, Lcom/my/target/core/models/banners/c;

    .line 196
    const-string/jumbo v1, "statistics"

    invoke-interface {p0}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 198
    const-string/jumbo v2, "duration"

    const-wide/16 v4, 0x0

    const/4 v6, 0x1

    move-object v1, p1

    move-object v3, p2

    .line 199
    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v2

    double-to-float v1, v2

    .line 201
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_5

    .line 202
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->a(F)V

    .line 206
    :cond_0
    const-string/jumbo v2, "point"

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    const/4 v6, 0x0

    move-object v1, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v2

    double-to-float v7, v2

    .line 211
    const/4 v1, 0x0

    cmpl-float v1, v7, v1

    if-ltz v1, :cond_1

    invoke-virtual {v0, v7}, Lcom/my/target/core/models/banners/c;->b(F)V

    .line 212
    :cond_1
    const-string/jumbo v2, "pointP"

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    const/4 v6, 0x0

    move-object v1, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v2

    double-to-float v1, v2

    .line 217
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-ltz v2, :cond_2

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->c(F)V

    .line 218
    :cond_2
    const/4 v2, 0x0

    cmpg-float v2, v7, v2

    if-gez v2, :cond_3

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    const/high16 v1, 0x42480000    # 50.0f

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->c(F)V

    .line 220
    :cond_3
    const-string/jumbo v1, "adText"

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    .line 221
    invoke-static {p1, v1, p2, v2, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 220
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->a(Ljava/lang/String;)V

    .line 223
    const-string/jumbo v1, "allowSeek"

    const/4 v2, 0x1

    invoke-static {p1, v1, p2, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->a(Z)V

    .line 228
    const-string/jumbo v1, "allowSkip"

    const/4 v2, 0x0

    invoke-static {p1, v1, p2, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->b(Z)V

    .line 233
    const-string/jumbo v1, "allowTrackChange"

    const/4 v2, 0x1

    invoke-static {p1, v1, p2, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->c(Z)V

    .line 239
    const-string/jumbo v1, "companionAds"

    invoke-static {p1, v1, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v3

    .line 243
    if-eqz v3, :cond_8

    .line 245
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 246
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 247
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_7

    .line 249
    const-string/jumbo v1, "companionAds"

    invoke-static {v2, v3, v1, p2}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v6

    .line 253
    if-eqz v6, :cond_4

    .line 4293
    const-string/jumbo v1, "width"

    const/4 v7, -0x1

    const/4 v8, 0x1

    invoke-static {v6, v1, p2, v7, v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 4298
    const-string/jumbo v7, "height"

    const/4 v8, -0x1

    const/4 v9, 0x1

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v7

    .line 4303
    const-string/jumbo v8, "id"

    const-string/jumbo v9, ""

    const/4 v10, 0x1

    invoke-static {v6, v8, p2, v9, v10}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 4308
    if-ltz v1, :cond_6

    if-ltz v7, :cond_6

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 4310
    invoke-static {v8}, Lcom/my/target/core/factories/a;->c(Ljava/lang/String;)Lcom/my/target/core/models/banners/e;

    move-result-object v1

    .line 4316
    invoke-static {v1, v6, p2, p3}, Lcom/my/target/core/parsers/rb/b;->e(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    .line 4318
    const-string/jumbo v7, "staticResource"

    const-string/jumbo v8, ""

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setStaticResource(Ljava/lang/String;)V

    .line 4323
    const-string/jumbo v7, "iframeResource"

    const-string/jumbo v8, ""

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setIframeResource(Ljava/lang/String;)V

    .line 4328
    const-string/jumbo v7, "htmlResource"

    const-string/jumbo v8, ""

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setHtmlResource(Ljava/lang/String;)V

    .line 4333
    const-string/jumbo v7, "apiFramework"

    const-string/jumbo v8, ""

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setApiFramework(Ljava/lang/String;)V

    .line 4338
    const-string/jumbo v7, "adSlotID"

    const-string/jumbo v8, ""

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setAdSlotID(Ljava/lang/String;)V

    .line 4343
    const-string/jumbo v7, "required"

    const-string/jumbo v8, ""

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setRequired(Ljava/lang/String;)V

    .line 4349
    const-string/jumbo v7, "assetWidth"

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setAssetWidth(I)V

    .line 4354
    const-string/jumbo v7, "assetHeight"

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setAssetHeight(I)V

    .line 4359
    const-string/jumbo v7, "expandedWidth"

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v7

    invoke-virtual {v1, v7}, Lcom/my/target/core/models/banners/e;->setExpandedWidth(I)V

    .line 4364
    const-string/jumbo v7, "expandedHeight"

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v6, v7, p2, v8, v9}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/my/target/core/models/banners/e;->setExpandedHeight(I)V

    .line 257
    :goto_1
    if-eqz v1, :cond_4

    .line 259
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_4
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto/16 :goto_0

    .line 203
    :cond_5
    const/4 v0, 0x0

    .line 283
    :goto_2
    return v0

    .line 4313
    :cond_6
    const/4 v1, 0x0

    goto :goto_1

    .line 263
    :cond_7
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8

    .line 265
    invoke-virtual {v0, v5}, Lcom/my/target/core/models/banners/c;->a(Ljava/util/ArrayList;)V

    .line 269
    :cond_8
    const-string/jumbo v1, "statistics"

    invoke-interface {p0}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 272
    const-string/jumbo v1, "mediafiles"

    invoke-static {p1, v1, p2}, Lcom/my/target/core/parsers/rb/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Ljava/util/ArrayList;

    move-result-object v1

    .line 275
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 277
    const/4 v0, 0x0

    goto :goto_2

    .line 280
    :cond_9
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/my/target/core/models/e;

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/c;->a(Lcom/my/target/core/models/e;)V

    .line 283
    :cond_a
    const/4 v0, 0x1

    goto :goto_2
.end method

.method private static b(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)Z
    .locals 15

    .prologue
    .line 442
    const-string/jumbo v2, "Parsing video banner"

    move-object/from16 v0, p2

    iput-object v2, v0, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    move-object v2, p0

    .line 444
    check-cast v2, Lcom/my/target/core/models/banners/m;

    .line 445
    const/4 v3, 0x0

    .line 446
    move-object/from16 v0, p3

    instance-of v4, v0, Lcom/my/target/core/models/sections/k;

    if-eqz v4, :cond_8

    .line 448
    check-cast p3, Lcom/my/target/core/models/sections/k;

    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/k;->k()Lcom/my/target/core/models/l;

    move-result-object v3

    .line 492
    :cond_0
    :goto_0
    if-eqz v3, :cond_1

    .line 494
    const-string/jumbo v4, "allowClose"

    .line 495
    invoke-virtual {v3}, Lcom/my/target/core/models/l;->a()Z

    move-result v5

    .line 494
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->d(Z)V

    .line 496
    const-string/jumbo v4, "allowCloseDelay"

    .line 498
    invoke-virtual {v3}, Lcom/my/target/core/models/l;->b()F

    move-result v3

    float-to-double v6, v3

    const/4 v8, 0x0

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    .line 496
    invoke-static/range {v3 .. v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v4

    double-to-float v3, v4

    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->d(F)V

    .line 501
    :cond_1
    const-string/jumbo v3, "statistics"

    invoke-interface {p0}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 503
    const-string/jumbo v4, "duration"

    const-wide/16 v6, 0x0

    const/4 v8, 0x1

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    invoke-static/range {v3 .. v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v4

    double-to-float v3, v4

    .line 505
    const/4 v4, 0x0

    cmpl-float v4, v3, v4

    if-lez v4, :cond_a

    .line 506
    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->c(F)V

    .line 510
    :cond_2
    const-string/jumbo v3, "autoplay"

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v3, v1, v4}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->e(Z)V

    .line 512
    const-string/jumbo v3, "hasCtaButton"

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v3, v1, v4}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->f(Z)V

    .line 514
    const-string/jumbo v4, "point"

    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    const/4 v8, 0x0

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    invoke-static/range {v3 .. v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v4

    double-to-float v9, v4

    .line 519
    const/4 v3, 0x0

    cmpl-float v3, v9, v3

    if-ltz v3, :cond_3

    invoke-virtual {v2, v9}, Lcom/my/target/core/models/banners/m;->a(F)V

    .line 520
    :cond_3
    const-string/jumbo v4, "pointP"

    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    const/4 v8, 0x0

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    invoke-static/range {v3 .. v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v4

    double-to-float v3, v4

    .line 525
    const/4 v4, 0x0

    cmpl-float v4, v3, v4

    if-ltz v4, :cond_4

    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->b(F)V

    .line 526
    :cond_4
    const/4 v4, 0x0

    cmpg-float v4, v9, v4

    if-gez v4, :cond_5

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_5

    const/high16 v3, 0x42480000    # 50.0f

    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->b(F)V

    .line 527
    :cond_5
    const-string/jumbo v3, "previewLink"

    const-string/jumbo v4, "previewHeight"

    const-string/jumbo v5, "previewWidth"

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v3, v4, v5, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v3

    .line 531
    if-eqz v3, :cond_6

    .line 533
    invoke-virtual {v2, v3}, Lcom/my/target/core/models/banners/m;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 536
    :cond_6
    const-string/jumbo v3, "statistics"

    invoke-interface {p0}, Lcom/my/target/core/models/banners/d;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 538
    const-string/jumbo v5, "mediafiles"

    .line 5106
    const-string/jumbo v3, "Parsing banner mediafiles"

    move-object/from16 v0, p2

    iput-object v3, v0, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 5108
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 5110
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v5, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v7

    .line 5112
    if-eqz v7, :cond_7

    .line 5114
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    .line 5116
    if-nez v8, :cond_b

    .line 5118
    const-string/jumbo v3, "Empty mediafiles array"

    const-string/jumbo v4, "Empty mediafiles array"

    move-object/from16 v0, p2

    invoke-static {v3, v0, v4}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    .line 541
    :cond_7
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 543
    const/4 v2, 0x0

    .line 550
    :goto_1
    return v2

    .line 450
    :cond_8
    move-object/from16 v0, p3

    instance-of v4, v0, Lcom/my/target/core/models/sections/d;

    if-eqz v4, :cond_9

    move-object/from16 v3, p3

    .line 452
    check-cast v3, Lcom/my/target/core/models/sections/d;

    invoke-virtual {v3}, Lcom/my/target/core/models/sections/d;->p()Lcom/my/target/core/models/l;

    move-result-object v3

    .line 453
    check-cast p3, Lcom/my/target/core/models/sections/d;

    .line 454
    const-string/jumbo v4, "closeActionText"

    .line 456
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/d;->j()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 455
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 454
    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->a(Ljava/lang/String;)V

    .line 457
    const-string/jumbo v4, "replayActionText"

    .line 459
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/d;->m()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 458
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 457
    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->b(Ljava/lang/String;)V

    .line 460
    const-string/jumbo v4, "allowBackButton"

    .line 463
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/d;->q()Z

    move-result v5

    .line 460
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->a(Z)V

    .line 465
    const-string/jumbo v4, "allowReplay"

    .line 468
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/d;->r()Z

    move-result v5

    .line 465
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->b(Z)V

    .line 470
    const-string/jumbo v4, "automute"

    .line 473
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/d;->s()Z

    move-result v5

    .line 470
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->c(Z)V

    .line 475
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/d;->v()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->g(Z)V

    goto/16 :goto_0

    .line 476
    :cond_9
    move-object/from16 v0, p3

    instance-of v4, v0, Lcom/my/target/core/models/sections/h;

    if-eqz v4, :cond_0

    .line 478
    check-cast p3, Lcom/my/target/core/models/sections/h;

    .line 480
    const-string/jumbo v4, "closeActionText"

    .line 482
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/h;->k()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 481
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 480
    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->a(Ljava/lang/String;)V

    .line 483
    const-string/jumbo v4, "replayActionText"

    .line 485
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/h;->l()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 484
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 483
    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->b(Ljava/lang/String;)V

    .line 486
    const-string/jumbo v4, "automute"

    .line 488
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/h;->i()Z

    move-result v5

    .line 487
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v4, v1, v5}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v4

    .line 486
    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->c(Z)V

    .line 489
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/sections/h;->j()Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/my/target/core/models/banners/m;->g(Z)V

    goto/16 :goto_0

    .line 507
    :cond_a
    const/4 v2, 0x0

    goto/16 :goto_1

    .line 5123
    :cond_b
    const/4 v3, 0x0

    move v4, v3

    :goto_2
    if-ge v4, v8, :cond_7

    .line 5125
    move-object/from16 v0, p2

    invoke-static {v4, v7, v5, v0}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v9

    .line 5127
    const-string/jumbo v3, "src"

    const/4 v10, 0x0

    const/4 v11, 0x1

    move-object/from16 v0, p2

    invoke-static {v9, v3, v0, v10, v11}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 5131
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0xc

    if-ge v10, v11, :cond_c

    if-eqz v3, :cond_c

    const-string/jumbo v10, "https"

    .line 5133
    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 5135
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 5136
    const/4 v3, 0x4

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 5139
    :cond_c
    const-string/jumbo v10, "width"

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-static {v9, v10, v0, v11, v12}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v10

    .line 5141
    const-string/jumbo v11, "height"

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-static {v9, v11, v0, v12, v13}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v11

    .line 5143
    const-string/jumbo v12, "bitrate"

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-static {v9, v12, v0, v13, v14}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v9

    .line 5147
    if-eqz v3, :cond_d

    if-lez v10, :cond_d

    if-lez v11, :cond_d

    if-lez v9, :cond_d

    .line 5150
    new-instance v12, Lcom/my/target/nativeads/models/VideoData;

    invoke-direct {v12, v3}, Lcom/my/target/nativeads/models/VideoData;-><init>(Ljava/lang/String;)V

    .line 5151
    invoke-virtual {v12, v9}, Lcom/my/target/nativeads/models/VideoData;->setBitrate(I)V

    .line 5152
    invoke-virtual {v12, v10}, Lcom/my/target/nativeads/models/VideoData;->setWidth(I)V

    .line 5153
    invoke-virtual {v12, v11}, Lcom/my/target/nativeads/models/VideoData;->setHeight(I)V

    .line 5154
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 5123
    :goto_3
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_2

    .line 5158
    :cond_d
    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "Some of mediafile\'s params are invalid: src = "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v12, " width = "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v10, " height = "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v10, " bitrate = "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 5163
    const-string/jumbo v9, "Wrong mediafile"

    move-object/from16 v0, p2

    invoke-static {v3, v0, v9}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    goto :goto_3

    .line 547
    :cond_e
    invoke-virtual {v2, v6}, Lcom/my/target/core/models/banners/m;->a(Ljava/util/List;)V

    .line 550
    :cond_f
    const/4 v2, 0x1

    goto/16 :goto_1
.end method

.method private static c(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V
    .locals 11

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 556
    const-string/jumbo v0, "Parsing native banner"

    iput-object v0, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    move-object v0, p0

    .line 558
    check-cast v0, Lcom/my/target/core/models/banners/h;

    .line 559
    const-string/jumbo v1, "title"

    const-string/jumbo v3, ""

    .line 560
    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 559
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->f(Ljava/lang/String;)V

    .line 562
    const-string/jumbo v1, "description"

    const-string/jumbo v3, ""

    .line 563
    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 562
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->b(Ljava/lang/String;)V

    .line 565
    const-string/jumbo v1, "disclaimer"

    const-string/jumbo v3, ""

    .line 566
    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 565
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->c(Ljava/lang/String;)V

    .line 568
    const-string/jumbo v1, "votes"

    .line 569
    invoke-static {p1, v1, p2, v4, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    .line 568
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->f(I)V

    .line 571
    const-string/jumbo v1, "category"

    const-string/jumbo v3, ""

    .line 572
    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 571
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->a(Ljava/lang/String;)V

    .line 574
    const-string/jumbo v1, "rating"

    .line 575
    invoke-static {p1, v1, p2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v1

    .line 574
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->b(F)V

    .line 576
    const-string/jumbo v1, "domain"

    const-string/jumbo v3, ""

    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->d(Ljava/lang/String;)V

    .line 578
    const-string/jumbo v1, "subcategory"

    const-string/jumbo v3, ""

    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->e(Ljava/lang/String;)V

    .line 581
    const-string/jumbo v1, "iconLink"

    const-string/jumbo v3, "iconHeight"

    const-string/jumbo v5, "iconWidth"

    invoke-static {p1, v1, v3, v5, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->d(Lcom/my/target/nativeads/models/ImageData;)V

    .line 587
    const-string/jumbo v1, "imageLink"

    const-string/jumbo v3, "imageHeight"

    const-string/jumbo v5, "imageWidth"

    invoke-static {p1, v1, v3, v5, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->e(Lcom/my/target/nativeads/models/ImageData;)V

    .line 593
    const-string/jumbo v1, "finalLink"

    const-string/jumbo v3, ""

    invoke-static {p1, v1, p2, v3, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->setFinalLink(Ljava/lang/String;)V

    .line 596
    const-string/jumbo v1, "cards"

    invoke-static {p1, v1, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v5

    .line 598
    if-eqz v5, :cond_4

    .line 600
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    move v3, v4

    .line 601
    :goto_0
    if-ge v3, v6, :cond_4

    .line 603
    const-string/jumbo v1, "cards"

    invoke-static {v3, v5, v1, p2}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v7

    .line 5651
    const-string/jumbo v1, "cardID"

    const-string/jumbo v8, ""

    invoke-static {v7, v1, p2, v8, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 6077
    new-instance v1, Lcom/my/target/core/models/banners/i;

    const-string/jumbo v9, "promo"

    invoke-direct {v1, v8, v9}, Lcom/my/target/core/models/banners/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5659
    invoke-static {v1, v7, p2, p3}, Lcom/my/target/core/parsers/rb/b;->e(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    .line 5661
    invoke-virtual {v1}, Lcom/my/target/core/models/banners/i;->getTrackingLink()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 5663
    const-string/jumbo v1, "Native ad card parse error: no tracking link"

    const-string/jumbo v7, "Required field absence"

    invoke-static {v1, p2, v7}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    move-object v1, v2

    .line 610
    :goto_1
    if-eqz v1, :cond_0

    .line 612
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->m()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 601
    :cond_0
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_0

    .line 5669
    :cond_1
    const-string/jumbo v8, "ctaText"

    const-string/jumbo v9, ""

    invoke-static {v7, v8, p2, v9, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 5672
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 5674
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getCtaText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/my/target/core/models/banners/i;->setCtaText(Ljava/lang/String;)V

    .line 5680
    :goto_2
    const-string/jumbo v8, "imageLink"

    const-string/jumbo v9, "imageHeight"

    const-string/jumbo v10, "imageWidth"

    invoke-static {v7, v8, v9, v10, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v8

    .line 5684
    if-eqz v8, :cond_3

    .line 5685
    invoke-virtual {v1, v8}, Lcom/my/target/core/models/banners/i;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 5694
    const-string/jumbo v8, "title"

    const-string/jumbo v9, ""

    invoke-static {v7, v8, p2, v9, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/my/target/core/models/banners/i;->b(Ljava/lang/String;)V

    .line 5700
    const-string/jumbo v8, "description"

    const-string/jumbo v9, ""

    invoke-static {v7, v8, p2, v9, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/my/target/core/models/banners/i;->a(Ljava/lang/String;)V

    .line 5706
    invoke-static {v1, v7, p2}, Lcom/my/target/core/parsers/rb/b;->a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V

    goto :goto_1

    .line 5677
    :cond_2
    invoke-virtual {v1, v8}, Lcom/my/target/core/models/banners/i;->setCtaText(Ljava/lang/String;)V

    goto :goto_2

    .line 5688
    :cond_3
    const-string/jumbo v1, "Native ad card parse error: wrong image"

    const-string/jumbo v7, "No image in banner"

    invoke-static {v1, p2, v7}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    move-object v1, v2

    .line 5691
    goto :goto_1

    .line 617
    :cond_4
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->m()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 619
    const-string/jumbo v1, "video"

    .line 620
    invoke-static {p1, v1, p2, v4}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;

    move-result-object v2

    .line 623
    const/16 v1, 0xe

    invoke-static {v1}, Lcom/my/target/core/utils/l;->c(I)Z

    move-result v1

    if-eqz v1, :cond_5

    if-eqz v2, :cond_5

    .line 626
    invoke-interface {p0}, Lcom/my/target/core/models/banners/d;->getId()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, "video"

    const-string/jumbo v4, "video"

    invoke-static {v1, v3, v4}, Lcom/my/target/core/factories/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/my/target/core/models/banners/d;

    move-result-object v1

    .line 630
    instance-of v3, v1, Lcom/my/target/core/models/banners/m;

    if-nez v3, :cond_6

    .line 642
    :cond_5
    :goto_3
    return-void

    .line 632
    :cond_6
    invoke-static {v1, v2, p2, p3}, Lcom/my/target/core/parsers/rb/b;->e(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V

    .line 634
    invoke-static {v1, v2, p2, p3}, Lcom/my/target/core/parsers/rb/b;->b(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 638
    invoke-static {v1, v2, p2}, Lcom/my/target/core/parsers/rb/b;->a(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V

    .line 639
    check-cast v1, Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/banners/h;->a(Lcom/my/target/core/models/banners/m;)V

    goto :goto_3
.end method

.method private static d(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 826
    const-string/jumbo v0, "Parsing fs image banner"

    iput-object v0, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 828
    check-cast p0, Lcom/my/target/core/models/banners/f;

    .line 829
    const-string/jumbo v0, "allowClose"

    .line 830
    invoke-static {p1, v0, p2, v1}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 829
    invoke-virtual {p0, v0}, Lcom/my/target/core/models/banners/f;->a(Z)V

    .line 832
    const-string/jumbo v0, "close_icon_hd"

    invoke-static {p1, v0, p2}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    .line 834
    if-nez v0, :cond_0

    .line 835
    const-string/jumbo v0, "close_icon"

    invoke-static {p1, v0, p2}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    .line 837
    :cond_0
    if-nez v0, :cond_1

    .line 839
    instance-of v2, p3, Lcom/my/target/core/models/sections/d;

    if-eqz v2, :cond_1

    .line 840
    check-cast p3, Lcom/my/target/core/models/sections/d;

    invoke-virtual {p3}, Lcom/my/target/core/models/sections/d;->k()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    .line 843
    :cond_1
    invoke-virtual {p0, v0}, Lcom/my/target/core/models/banners/f;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 845
    const-string/jumbo v0, "portrait"

    invoke-static {p1, v0, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v2

    .line 847
    if-eqz v2, :cond_4

    .line 849
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 850
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v0, v1

    .line 851
    :goto_0
    if-ge v0, v4, :cond_3

    .line 853
    const-string/jumbo v5, "portrait"

    invoke-static {v0, v2, v5, p2}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v5

    .line 855
    if-eqz v5, :cond_2

    .line 856
    const-string/jumbo v6, "imageLink"

    const-string/jumbo v7, "height"

    const-string/jumbo v8, "width"

    invoke-static {v5, v6, v7, v8, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v5

    .line 861
    if-eqz v5, :cond_2

    .line 863
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 851
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 866
    :cond_3
    invoke-virtual {p0, v3}, Lcom/my/target/core/models/banners/f;->a(Ljava/util/List;)V

    .line 868
    :cond_4
    const-string/jumbo v0, "landscape"

    invoke-static {p1, v0, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v2

    .line 870
    if-eqz v2, :cond_7

    .line 872
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 873
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v0, v1

    .line 874
    :goto_1
    if-ge v0, v4, :cond_6

    .line 876
    const-string/jumbo v1, "landscape"

    invoke-static {v0, v2, v1, p2}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v1

    .line 878
    if-eqz v1, :cond_5

    .line 879
    const-string/jumbo v5, "imageLink"

    const-string/jumbo v6, "height"

    const-string/jumbo v7, "width"

    invoke-static {v1, v5, v6, v7, p2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v1

    .line 884
    if-eqz v1, :cond_5

    .line 886
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 874
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 889
    :cond_6
    invoke-virtual {p0, v3}, Lcom/my/target/core/models/banners/f;->b(Ljava/util/List;)V

    .line 891
    :cond_7
    return-void
.end method

.method private static e(Lcom/my/target/core/models/banners/d;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/sections/i;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1038
    const-string/jumbo v0, "Parsing common banner"

    iput-object v0, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 1040
    const-string/jumbo v0, "trackingLink"

    const-string/jumbo v1, ""

    .line 1041
    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1040
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setTrackingLink(Ljava/lang/String;)V

    .line 1044
    const-string/jumbo v0, "finalLink"

    const-string/jumbo v1, ""

    .line 1045
    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1044
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setFinalLink(Ljava/lang/String;)V

    .line 1048
    const-string/jumbo v0, "timeout"

    .line 1049
    invoke-static {p1, v0, p2, v3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v0

    .line 1048
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setTimeout(I)V

    .line 1052
    const-string/jumbo v0, "urlscheme"

    const-string/jumbo v1, ""

    .line 1053
    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1052
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setUrlScheme(Ljava/lang/String;)V

    .line 1056
    const-string/jumbo v0, "width"

    .line 1057
    invoke-static {p1, v0, p2, v3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v0

    .line 1056
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setWidth(I)V

    .line 1060
    const-string/jumbo v0, "height"

    .line 1061
    invoke-static {p1, v0, p2, v3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v0

    .line 1060
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setHeight(I)V

    .line 1064
    const-string/jumbo v0, "ageRestrictions"

    const-string/jumbo v1, ""

    .line 1065
    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1064
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setAgeRestrictions(Ljava/lang/String;)V

    .line 1068
    const-string/jumbo v0, "bundle_id"

    const-string/jumbo v1, ""

    .line 1069
    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1068
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setBundleId(Ljava/lang/String;)V

    .line 1072
    const-string/jumbo v0, "deeplink"

    const-string/jumbo v1, ""

    .line 1073
    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1072
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setDeepLink(Ljava/lang/String;)V

    .line 1076
    const-string/jumbo v0, "openInBrowser"

    .line 1077
    invoke-static {p1, v0, p2, v3}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1076
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setOpenInBrowser(Z)V

    .line 1080
    const-string/jumbo v0, "usePlayStoreAction"

    .line 1081
    invoke-static {p1, v0, p2, v3}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1080
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setUsePlayStoreAction(Z)V

    .line 1084
    const-string/jumbo v0, "navigationType"

    const-string/jumbo v1, "web"

    invoke-static {p1, v0, p2, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1086
    const-string/jumbo v1, "deeplink"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1087
    const-string/jumbo v0, "store"

    .line 1088
    :cond_0
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setNavigationType(Ljava/lang/String;)V

    .line 1090
    const-string/jumbo v1, "ctaText"

    const-string/jumbo v2, ""

    invoke-static {p1, v1, p2, v2, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 1093
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1095
    invoke-static {v0}, Lcom/my/target/core/models/banners/a;->getDefaultCtaText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1098
    :goto_0
    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setCtaText(Ljava/lang/String;)V

    .line 1100
    invoke-interface {p3}, Lcom/my/target/core/models/sections/i;->f()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Lcom/my/target/core/models/banners/d;->setAdvertisingLabel(Ljava/lang/String;)V

    .line 1101
    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method
