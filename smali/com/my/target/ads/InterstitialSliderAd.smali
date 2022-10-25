.class public Lcom/my/target/ads/InterstitialSliderAd;
.super Lcom/my/target/core/facades/a;
.source "InterstitialSliderAd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;
    }
.end annotation


# instance fields
.field private ad:Lcom/my/target/core/facades/c;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private adDialog:Lcom/my/target/core/ui/a;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final adListener:Lcom/my/target/core/facades/c$a;

.field private final dialogDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private hideStatusBarInDialog:Z

.field private listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILandroid/content/Context;)V
    .locals 1

    .prologue
    .line 111
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/my/target/ads/InterstitialSliderAd;-><init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V

    .line 112
    return-void
.end method

.method public constructor <init>(ILandroid/content/Context;Lcom/my/target/ads/CustomParams;)V
    .locals 2

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/my/target/core/facades/a;-><init>()V

    .line 25
    new-instance v0, Lcom/my/target/ads/InterstitialSliderAd$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/InterstitialSliderAd$1;-><init>(Lcom/my/target/ads/InterstitialSliderAd;)V

    iput-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adListener:Lcom/my/target/core/facades/c$a;

    .line 70
    new-instance v0, Lcom/my/target/ads/InterstitialSliderAd$2;

    invoke-direct {v0, p0}, Lcom/my/target/ads/InterstitialSliderAd$2;-><init>(Lcom/my/target/ads/InterstitialSliderAd;)V

    iput-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->dialogDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 88
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->hideStatusBarInDialog:Z

    .line 116
    new-instance v0, Lcom/my/target/core/a;

    const-string/jumbo v1, "fullscreenslider"

    invoke-direct {v0, p1, v1}, Lcom/my/target/core/a;-><init>(ILjava/lang/String;)V

    .line 118
    if-eqz p3, :cond_0

    .line 119
    invoke-virtual {v0, p3}, Lcom/my/target/core/a;->a(Lcom/my/target/ads/CustomParams;)V

    .line 121
    :cond_0
    invoke-virtual {p0, v0, p2}, Lcom/my/target/ads/InterstitialSliderAd;->init(Lcom/my/target/core/a;Landroid/content/Context;)V

    .line 122
    const-string/jumbo v0, "InterstitialSliderAd created. Version: 4.6.4"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/my/target/ads/InterstitialSliderAd;)Lcom/my/target/core/ui/a;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    return-object v0
.end method

.method static synthetic access$102(Lcom/my/target/ads/InterstitialSliderAd;Lcom/my/target/core/ui/a;)Lcom/my/target/core/ui/a;
    .locals 0

    .prologue
    .line 23
    iput-object p1, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    return-object p1
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 192
    invoke-virtual {p0}, Lcom/my/target/ads/InterstitialSliderAd;->dismiss()V

    .line 193
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0, v1}, Lcom/my/target/core/facades/c;->a(Lcom/my/target/core/facades/c$a;)V

    .line 197
    iput-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    .line 199
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 3

    .prologue
    .line 174
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 176
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->dismiss()V

    .line 181
    :cond_0
    :goto_0
    return-void

    .line 179
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

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
    .line 186
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->dismiss()V

    .line 188
    :cond_0
    return-void
.end method

.method public isHideStatusBarInDialog()Z
    .locals 1

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->hideStatusBarInDialog:Z

    return v0
.end method

.method protected onLoad(Lcom/my/target/core/models/c;)V
    .locals 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/my/target/core/factories/d;->a(Lcom/my/target/core/models/c;Landroid/content/Context;)Lcom/my/target/core/facades/c;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    .line 205
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    if-nez v0, :cond_1

    .line 207
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    const-string/jumbo v1, "No ad"

    invoke-interface {v0, v1, p0}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 213
    :cond_0
    :goto_0
    return-void

    .line 211
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->adListener:Lcom/my/target/core/facades/c$a;

    invoke-interface {v0, v1}, Lcom/my/target/core/facades/c;->a(Lcom/my/target/core/facades/c$a;)V

    .line 212
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0}, Lcom/my/target/core/facades/c;->load()V

    goto :goto_0
.end method

.method protected onLoadError(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 218
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "No ad: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/InterstitialSliderAd;)V

    .line 220
    :cond_0
    return-void
.end method

.method public setHideStatusBarInDialog(Z)V
    .locals 0

    .prologue
    .line 101
    iput-boolean p1, p0, Lcom/my/target/ads/InterstitialSliderAd;->hideStatusBarInDialog:Z

    .line 102
    return-void
.end method

.method public setListener(Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;)V
    .locals 0
    .param p1    # Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 106
    iput-object p1, p0, Lcom/my/target/ads/InterstitialSliderAd;->listener:Lcom/my/target/ads/InterstitialSliderAd$InterstitialSliderAdListener;

    .line 107
    return-void
.end method

.method public show()V
    .locals 3

    .prologue
    .line 127
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0}, Lcom/my/target/core/facades/c;->a()Z

    move-result v0

    if-nez v0, :cond_1

    .line 129
    :cond_0
    const-string/jumbo v0, "InterstitialSliderAd.show: No ad"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 143
    :goto_0
    return-void

    .line 133
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    sput-object v0, Lcom/my/target/ads/MyTargetActivity;->ad:Lcom/my/target/core/facades/g;

    .line 135
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

    const-class v2, Lcom/my/target/ads/MyTargetActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 136
    const-string/jumbo v1, "com.my.target.actions.interstitial"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-nez v1, :cond_2

    .line 139
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 142
    :cond_2
    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public showDialog()V
    .locals 4

    .prologue
    .line 147
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    const-string/jumbo v0, "InterstitialSliderAd.showDialog: dialog already showing"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 170
    :cond_0
    :goto_0
    return-void

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    invoke-interface {v0}, Lcom/my/target/core/facades/c;->a()Z

    move-result v0

    if-nez v0, :cond_3

    .line 155
    :cond_2
    const-string/jumbo v0, "InterstitialSliderAd.showDialog: No ad"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 159
    :cond_3
    new-instance v0, Lcom/my/target/core/ui/a;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    iget-boolean v2, p0, Lcom/my/target/ads/InterstitialSliderAd;->hideStatusBarInDialog:Z

    iget-object v3, p0, Lcom/my/target/ads/InterstitialSliderAd;->context:Landroid/content/Context;

    invoke-direct {v0, v1, v2, v3}, Lcom/my/target/core/ui/a;-><init>(Lcom/my/target/core/facades/g;ZLandroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    .line 160
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->dialogDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 161
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->show()V

    .line 163
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->ad:Lcom/my/target/core/facades/c;

    instance-of v0, v0, Lcom/my/target/core/facades/e;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 166
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 167
    iget-object v1, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v1}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 168
    iget-object v0, p0, Lcom/my/target/ads/InterstitialSliderAd;->adDialog:Lcom/my/target/core/ui/a;

    invoke-virtual {v0}, Lcom/my/target/core/ui/a;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0
.end method
