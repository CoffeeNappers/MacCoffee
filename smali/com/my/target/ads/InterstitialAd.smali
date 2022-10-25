.class public Lcom/my/target/ads/InterstitialAd;
.super Lcom/my/target/core/facades/a;
.source "InterstitialAd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;
    }
.end annotation


# instance fields
.field private ad:Lcom/my/target/core/facades/c;

.field private adDialog:Lcom/my/target/core/ui/a;

.field private final adListener:Lcom/my/target/core/facades/c$a;

.field private final dialogDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private hideStatusBarInDialog:Z

.field private listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;


# direct methods
.method public constructor <init>(ILandroid/content/Context;)V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/my/target/ads/InterstitialAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    .line 40
    return-void
.end method

.method public constructor <init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V
    .locals 2

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/my/target/core/facades/a;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/ads/InterstitialAd;->hideStatusBarInDialog:Z

    .line 179
    new-instance v0, Lcom/my/target/ads/InterstitialAd$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/InterstitialAd$1;-><init>(Lcom/my/target/ads/InterstitialAd;)V

    iput-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adListener:Lcom/my/target/core/facades/c$a;

    .line 226
    new-instance v0, Lcom/my/target/ads/InterstitialAd$2;

    invoke-direct {v0, p0}, Lcom/my/target/ads/InterstitialAd$2;-><init>(Lcom/my/target/ads/InterstitialAd;)V

    iput-object v0, p0, Lcom/my/target/ads/InterstitialAd;->dialogDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 44
    new-instance v0, Lcom/my/target/core/a;

    const-string/jumbo v1, "fullscreen"

    invoke-direct {v0, p1, v1}, Lcom/my/target/core/a;-><init>(ILjava/lang/String;)V

    .line 46
    if-eqz p3, :cond_0

    .line 47
    invoke-virtual {v0, p3}, Lcom/my/target/core/a;->a(Lcom/my/target/ads/CustomParams;)V

    .line 49
    :cond_0
    invoke-virtual {p0, v0, p2}, Lcom/my/target/ads/InterstitialAd;->init(Lcom/my/target/core/a;Landroid/content/Context;)V

    .line 50
    const-string/jumbo v0, "InterstitialAd created. Version: 4.6.4"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/my/target/ads/InterstitialAd;)Lcom/my/target/core/ui/a;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    return-object v0
.end method

.method static synthetic access$102(Lcom/my/target/ads/InterstitialAd;Lcom/my/target/core/ui/a;)Lcom/my/target/core/ui/a;
    .locals 0

    .prologue
    .line 29
    iput-object p1, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    return-object p1
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 155
    invoke-virtual {p0}, Lcom/my/target/ads/InterstitialAd;->dismiss()V

    .line 156
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0, v1}, Lcom/my/target/core/facades/c;->a(Lcom/my/target/core/facades/c$a;)V

    .line 160
    iput-object v1, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    .line 162
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 3

    .prologue
    .line 122
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 124
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->dismiss()V

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.my.target.ACTION_CLOSE_ACTIVITY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public dismissDialog()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->dismiss()V

    .line 136
    :cond_0
    return-void
.end method

.method public isHideStatusBarInDialog()Z
    .locals 1

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/my/target/ads/InterstitialAd;->hideStatusBarInDialog:Z

    return v0
.end method

.method protected onLoad(Lcom/my/target/core/models/c;)V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/my/target/core/factories/d;->a(Lcom/my/target/core/models/c;Landroid/content/Context;)Lcom/my/target/core/facades/c;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    .line 57
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    if-nez v0, :cond_1

    .line 59
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    const-string/jumbo v1, "No ad"

    invoke-interface {v0, v1, p0}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialAd;)V

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->adListener:Lcom/my/target/core/facades/c$a;

    invoke-interface {v0, v1}, Lcom/my/target/core/facades/c;->a(Lcom/my/target/core/facades/c$a;)V

    .line 64
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0}, Lcom/my/target/core/facades/c;->load()V

    goto :goto_0
.end method

.method protected onLoadError(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "No ad: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialAd;)V

    .line 72
    :cond_0
    return-void
.end method

.method public setHideStatusBarInDialog(Z)V
    .locals 0

    .prologue
    .line 150
    iput-boolean p1, p0, Lcom/my/target/ads/InterstitialAd;->hideStatusBarInDialog:Z

    .line 151
    return-void
.end method

.method public setListener(Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;)V
    .locals 0

    .prologue
    .line 140
    iput-object p1, p0, Lcom/my/target/ads/InterstitialAd;->listener:Lcom/my/target/ads/InterstitialAd$InterstitialAdListener;

    .line 141
    return-void
.end method

.method public show()V
    .locals 3

    .prologue
    .line 76
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0}, Lcom/my/target/core/facades/c;->a()Z

    move-result v0

    if-nez v0, :cond_1

    .line 78
    :cond_0
    const-string/jumbo v0, "InterstitialAd.show: No ad"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 91
    :goto_0
    return-void

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    sput-object v0, Lcom/my/target/ads/MyTargetActivity;->ad:Lcom/my/target/core/facades/g;

    .line 84
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    const-class v2, Lcom/my/target/ads/MyTargetActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 85
    const-string/jumbo v1, "com.my.target.actions.interstitial"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 86
    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-nez v1, :cond_2

    .line 88
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 90
    :cond_2
    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public showDialog()V
    .locals 4

    .prologue
    .line 95
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 97
    const-string/jumbo v0, "InterstitialAd.showDialog: dialog already showing"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 118
    :cond_0
    :goto_0
    return-void

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0}, Lcom/my/target/core/facades/c;->a()Z

    move-result v0

    if-nez v0, :cond_3

    .line 103
    :cond_2
    const-string/jumbo v0, "InterstitialAd.showDialog: No ad"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 107
    :cond_3
    new-instance v0, Lcom/my/target/core/ui/a;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    iget-boolean v2, p0, Lcom/my/target/ads/InterstitialAd;->hideStatusBarInDialog:Z

    iget-object v3, p0, Lcom/my/target/ads/InterstitialAd;->context:Landroid/content/Context;

    invoke-direct {v0, v1, v2, v3}, Lcom/my/target/core/ui/a;-><init>(Lcom/my/target/core/facades/g;ZLandroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    .line 108
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->dialogDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 109
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->show()V

    .line 111
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->ad:Lcom/my/target/core/facades/c;

    instance-of v0, v0, Lcom/my/target/core/facades/e;

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 114
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 115
    iget-object v1, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v1}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 116
    iget-object v0, p0, Lcom/my/target/ads/InterstitialAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0
.end method
