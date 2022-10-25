.class public final Lcom/my/target/core/engines/i;
.super Lcom/my/target/core/engines/a;
.source "StandardAdEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/engines/i$a;
    }
.end annotation


# instance fields
.field private c:Lcom/my/target/core/facades/h;

.field private d:Lcom/my/target/core/facades/h;

.field private e:Lcom/my/target/ads/MyTargetView;

.field private f:Lcom/my/target/core/ui/views/AdView;

.field private g:Landroid/webkit/WebView;

.field private h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

.field private i:Z

.field private j:Z

.field private k:Lcom/my/target/core/communication/js/c;

.field private l:Lcom/my/target/core/engines/i$a;

.field private m:Landroid/webkit/WebChromeClient;

.field private n:Landroid/webkit/WebViewClient;

.field private o:Lcom/my/target/core/communication/js/b;

.field private p:Lcom/my/target/core/communication/js/b;

.field private q:Lcom/my/target/core/communication/js/b;

.field private r:Lcom/my/target/core/communication/js/b;

.field private s:Lcom/my/target/core/communication/js/b;

.field private t:Lcom/my/target/core/communication/js/b;

.field private u:Lcom/my/target/core/communication/js/b;

.field private v:Lcom/my/target/core/communication/js/b;

.field private w:Lcom/my/target/core/facades/h$a;


# direct methods
.method public constructor <init>(Lcom/my/target/ads/MyTargetView;Ljava/lang/String;Landroid/content/Context;)V
    .locals 5

    .prologue
    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 77
    invoke-direct {p0, p1, p3}, Lcom/my/target/core/engines/a;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;)V

    .line 67
    new-instance v0, Lcom/my/target/core/communication/js/c;

    invoke-direct {v0}, Lcom/my/target/core/communication/js/c;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    .line 68
    new-instance v0, Lcom/my/target/core/engines/i$a;

    invoke-direct {v0}, Lcom/my/target/core/engines/i$a;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    .line 300
    new-instance v0, Lcom/my/target/core/engines/i$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$1;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->m:Landroid/webkit/WebChromeClient;

    .line 320
    new-instance v0, Lcom/my/target/core/engines/i$4;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$4;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->n:Landroid/webkit/WebViewClient;

    .line 380
    new-instance v0, Lcom/my/target/core/engines/i$5;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$5;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->o:Lcom/my/target/core/communication/js/b;

    .line 390
    new-instance v0, Lcom/my/target/core/engines/i$6;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$6;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->p:Lcom/my/target/core/communication/js/b;

    .line 415
    new-instance v0, Lcom/my/target/core/engines/i$7;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$7;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->q:Lcom/my/target/core/communication/js/b;

    .line 427
    new-instance v0, Lcom/my/target/core/engines/i$8;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$8;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->r:Lcom/my/target/core/communication/js/b;

    .line 446
    new-instance v0, Lcom/my/target/core/engines/i$9;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$9;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->s:Lcom/my/target/core/communication/js/b;

    .line 456
    new-instance v0, Lcom/my/target/core/engines/i$10;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$10;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->t:Lcom/my/target/core/communication/js/b;

    .line 468
    new-instance v0, Lcom/my/target/core/engines/i$11;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$11;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->u:Lcom/my/target/core/communication/js/b;

    .line 478
    new-instance v0, Lcom/my/target/core/engines/i$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$2;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->v:Lcom/my/target/core/communication/js/b;

    .line 492
    new-instance v0, Lcom/my/target/core/engines/i$3;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/i$3;-><init>(Lcom/my/target/core/engines/i;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->w:Lcom/my/target/core/facades/h$a;

    .line 78
    iput-object p1, p0, Lcom/my/target/core/engines/i;->e:Lcom/my/target/ads/MyTargetView;

    .line 1241
    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    .line 1242
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 1243
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 1244
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 1245
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 1247
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->n:Landroid/webkit/WebViewClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 1248
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->m:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 1251
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1253
    iget-object v1, p0, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 1255
    new-instance v2, Lcom/my/target/core/ui/views/AdView;

    iget-object v3, p0, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/my/target/core/ui/views/AdView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    .line 1256
    iget-object v2, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    iget-object v3, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v2, v3, v0}, Lcom/my/target/core/ui/views/AdView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1257
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lcom/my/target/core/ui/views/AdView;->setVisibility(I)V

    .line 1262
    const-string/jumbo v0, "standard_300x250"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1264
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x43960000    # 300.0f

    mul-float/2addr v2, v1

    float-to-int v2, v2

    const/high16 v3, 0x437a0000    # 250.0f

    mul-float/2addr v1, v3

    float-to-int v1, v1

    invoke-direct {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1275
    :goto_0
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 1276
    iget-object v1, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v1, v0}, Lcom/my/target/core/ui/views/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1277
    iget-object v0, p0, Lcom/my/target/core/engines/i;->a:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onReady"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->o:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 82
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onError"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->p:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 83
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onAdError"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->p:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 84
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onComplete"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->q:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 85
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onNoAd"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->r:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 86
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onAdStart"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->s:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 87
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onStat"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->u:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 88
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onAdClick"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->t:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 89
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    const-string/jumbo v1, "onRequestNewAds"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->v:Lcom/my/target/core/communication/js/b;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/communication/js/c;->a(Ljava/lang/String;Lcom/my/target/core/communication/js/b;)Z

    .line 90
    return-void

    .line 1269
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    const/high16 v2, 0x44200000    # 640.0f

    mul-float/2addr v2, v1

    float-to-int v2, v2

    invoke-virtual {v0, v2}, Lcom/my/target/core/ui/views/AdView;->setMaxWidth(I)V

    .line 1270
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x42480000    # 50.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-direct {v0, v4, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/my/target/core/engines/i;)Lcom/my/target/core/communication/js/c;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    return-object v0
.end method

.method static synthetic a(Lcom/my/target/core/engines/i;Lcom/my/target/core/facades/h;)Lcom/my/target/core/facades/h;
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    return-object p1
.end method

.method private a(Lcom/my/target/core/communication/js/calls/c;)V
    .locals 5

    .prologue
    .line 365
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 369
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "javascript:AdmanJS.execute("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/my/target/core/communication/js/calls/c;->b()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 370
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 371
    iget-object v1, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 378
    :cond_0
    :goto_0
    return-void

    .line 372
    :catch_0
    move-exception v0

    .line 374
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "fail to execute js call: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 375
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Internal error: fail to execute JSCall "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/my/target/core/communication/js/calls/c;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    iget-object v4, p0, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-static {v1, v2, v0, v3, v4}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/my/target/core/engines/i;Lcom/my/target/core/communication/js/calls/c;)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/communication/js/calls/c;)V

    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, -0x2

    .line 282
    if-eqz p1, :cond_2

    .line 284
    iget-object v0, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    if-nez v0, :cond_0

    .line 286
    new-instance v0, Lcom/my/target/core/ui/views/controls/AdInfoButton;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/my/target/core/ui/views/controls/AdInfoButton;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    .line 287
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0, v1, v2, v2}, Lcom/my/target/core/ui/views/AdView;->addView(Landroid/view/View;II)V

    .line 289
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/views/controls/AdInfoButton;->setUrl(Ljava/lang/String;)V

    .line 298
    :cond_1
    :goto_0
    return-void

    .line 292
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    if-eqz v0, :cond_1

    .line 294
    iget-object v0, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/controls/AdInfoButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 295
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 296
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/core/engines/i;->h:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    goto :goto_0
.end method

.method static synthetic b(Lcom/my/target/core/engines/i;)Lcom/my/target/ads/MyTargetView;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->e:Lcom/my/target/ads/MyTargetView;

    return-object v0
.end method

.method static synthetic b(Lcom/my/target/core/engines/i;Lcom/my/target/core/facades/h;)V
    .locals 2

    .prologue
    .line 45
    .line 2232
    iput-object p1, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    .line 2233
    invoke-virtual {p1}, Lcom/my/target/core/facades/h;->e()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/i;->a(Ljava/lang/String;)V

    .line 2234
    invoke-virtual {p1}, Lcom/my/target/core/facades/h;->d()Lorg/json/JSONObject;

    move-result-object v0

    .line 2235
    if-eqz v0, :cond_0

    .line 2236
    new-instance v1, Lcom/my/target/core/communication/js/calls/f;

    invoke-direct {v1, v0}, Lcom/my/target/core/communication/js/calls/f;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {p0, v1}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/communication/js/calls/c;)V

    .line 45
    :cond_0
    return-void
.end method

.method static synthetic c(Lcom/my/target/core/engines/i;)Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/my/target/core/engines/i;->i:Z

    return v0
.end method

.method static synthetic d(Lcom/my/target/core/engines/i;)Z
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/engines/i;->i:Z

    return v0
.end method

.method static synthetic e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    return-object v0
.end method

.method static synthetic f(Lcom/my/target/core/engines/i;)Lcom/my/target/core/engines/i$a;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    return-object v0
.end method

.method static synthetic g(Lcom/my/target/core/engines/i;)Lcom/my/target/core/ui/views/AdView;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    return-object v0
.end method

.method static synthetic h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    return-object v0
.end method

.method static synthetic i(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h$a;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/my/target/core/engines/i;->w:Lcom/my/target/core/facades/h$a;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 145
    invoke-super {p0}, Lcom/my/target/core/engines/a;->a()V

    .line 147
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->b()Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/my/target/core/engines/i$a;->b(Z)V

    .line 152
    new-instance v0, Lcom/my/target/core/communication/js/calls/b;

    const-string/jumbo v1, "pause"

    invoke-direct {v0, v1}, Lcom/my/target/core/communication/js/calls/b;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/communication/js/calls/c;)V

    .line 157
    :goto_0
    return-void

    .line 154
    :cond_0
    const-string/jumbo v0, "already paused"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :cond_1
    const-string/jumbo v0, "not started"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final a(Lcom/my/target/core/engines/b$a;)V
    .locals 0

    .prologue
    .line 228
    return-void
.end method

.method public final a(Lcom/my/target/core/facades/g;)V
    .locals 4

    .prologue
    .line 98
    instance-of v0, p1, Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_2

    .line 100
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->e()V

    .line 101
    check-cast p1, Lcom/my/target/core/facades/h;

    iput-object p1, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    .line 102
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 103
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/engines/i;->i:Z

    .line 104
    iget-object v0, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->c()Ljava/lang/String;

    move-result-object v0

    .line 105
    if-eqz v0, :cond_1

    .line 107
    iget-object v0, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->e()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/i;->a(Ljava/lang/String;)V

    .line 108
    const-string/jumbo v0, "load page"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    invoke-virtual {v1}, Lcom/my/target/core/facades/h;->c()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "text/html"

    const-string/jumbo v3, "utf-8"

    invoke-virtual {v0, v1, v2, v3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :cond_0
    :goto_0
    return-void

    .line 111
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/engines/i;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/i;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "No ad"

    iget-object v2, p0, Lcom/my/target/core/engines/i;->e:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    goto :goto_0

    .line 113
    :cond_2
    const-string/jumbo v0, "StandardAdEngine: incorrect ad type"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final b()V
    .locals 2

    .prologue
    .line 162
    invoke-super {p0}, Lcom/my/target/core/engines/a;->b()V

    .line 164
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/core/engines/i$a;->b(Z)V

    .line 169
    new-instance v0, Lcom/my/target/core/communication/js/calls/b;

    const-string/jumbo v1, "resume"

    invoke-direct {v0, v1}, Lcom/my/target/core/communication/js/calls/b;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/communication/js/calls/c;)V

    .line 174
    :goto_0
    return-void

    .line 171
    :cond_0
    const-string/jumbo v0, "already started"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 173
    :cond_1
    const-string/jumbo v0, "not started"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final c()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 179
    invoke-super {p0}, Lcom/my/target/core/engines/a;->c()V

    .line 181
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 183
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/engines/i$a;->b(Z)V

    .line 184
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/engines/i$a;->a(Z)V

    .line 185
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/AdView;->setVisibility(I)V

    .line 186
    iget-object v0, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0, v2}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 189
    iput-object v2, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    .line 191
    :cond_0
    new-instance v0, Lcom/my/target/core/communication/js/calls/b;

    const-string/jumbo v1, "stop"

    invoke-direct {v0, v1}, Lcom/my/target/core/communication/js/calls/b;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/communication/js/calls/c;)V

    .line 194
    :goto_0
    return-void

    .line 193
    :cond_1
    const-string/jumbo v0, "not started"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final d()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 125
    invoke-super {p0}, Lcom/my/target/core/engines/a;->d()V

    .line 127
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->c()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/i$a;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "already started"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 140
    :goto_0
    return-void

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/my/target/core/engines/i$a;->a(Z)V

    .line 133
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0, v2, v2}, Lcom/my/target/core/ui/views/AdView;->setDesiredSize(II)V

    .line 134
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0, v2}, Lcom/my/target/core/ui/views/AdView;->setVisibility(I)V

    .line 135
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/AdView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    .line 136
    new-instance v1, Lcom/my/target/core/communication/js/calls/e;

    iget-object v2, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    invoke-virtual {v2}, Lcom/my/target/core/facades/h;->a()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/my/target/core/communication/js/calls/e;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, v1}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/communication/js/calls/c;)V

    goto :goto_0

    .line 139
    :cond_1
    const-string/jumbo v0, "not ready"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final f()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 199
    invoke-super {p0}, Lcom/my/target/core/engines/a;->f()V

    .line 201
    iget-boolean v0, p0, Lcom/my/target/core/engines/i;->j:Z

    if-nez v0, :cond_1

    .line 203
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/engines/i;->j:Z

    .line 204
    iget-object v0, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    invoke-virtual {v0}, Lcom/my/target/core/communication/js/c;->a()V

    .line 205
    iput-object v2, p0, Lcom/my/target/core/engines/i;->k:Lcom/my/target/core/communication/js/c;

    .line 206
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/AdView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/AdView;->removeAllViews()V

    .line 208
    iput-object v2, p0, Lcom/my/target/core/engines/i;->f:Lcom/my/target/core/ui/views/AdView;

    .line 209
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 210
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 211
    iget-object v0, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 212
    iput-object v2, p0, Lcom/my/target/core/engines/i;->g:Landroid/webkit/WebView;

    .line 213
    iput-object v2, p0, Lcom/my/target/core/engines/i;->c:Lcom/my/target/core/facades/h;

    .line 214
    iput-object v2, p0, Lcom/my/target/core/engines/i;->e:Lcom/my/target/ads/MyTargetView;

    .line 215
    iput-object v2, p0, Lcom/my/target/core/engines/i;->l:Lcom/my/target/core/engines/i$a;

    .line 216
    iget-object v0, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_1

    .line 218
    iget-object v0, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0, v2}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 219
    iput-object v2, p0, Lcom/my/target/core/engines/i;->d:Lcom/my/target/core/facades/h;

    .line 222
    :cond_1
    return-void
.end method

.method public final g()V
    .locals 0

    .prologue
    .line 120
    return-void
.end method
