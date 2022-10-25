.class public Lcom/my/target/ads/MyTargetView;
.super Landroid/widget/RelativeLayout;
.source "MyTargetView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/ads/MyTargetView$AdSize;,
        Lcom/my/target/ads/MyTargetView$MyTargetViewListener;
    }
.end annotation


# instance fields
.field private ad:Lcom/my/target/core/facades/h;

.field private adListener:Lcom/my/target/core/facades/h$a;

.field private engine:Lcom/my/target/core/engines/b;

.field private isInitialized:Z

.field private listener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

.field private trackingEvironmentEnabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 83
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->trackingEvironmentEnabled:Z

    .line 38
    new-instance v0, Lcom/my/target/ads/MyTargetView$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/MyTargetView$1;-><init>(Lcom/my/target/ads/MyTargetView;)V

    iput-object v0, p0, Lcom/my/target/ads/MyTargetView;->adListener:Lcom/my/target/core/facades/h$a;

    .line 84
    const-string/jumbo v0, "AdView created. Version: 4.6.4"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->trackingEvironmentEnabled:Z

    .line 38
    new-instance v0, Lcom/my/target/ads/MyTargetView$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/MyTargetView$1;-><init>(Lcom/my/target/ads/MyTargetView;)V

    iput-object v0, p0, Lcom/my/target/ads/MyTargetView;->adListener:Lcom/my/target/core/facades/h$a;

    .line 90
    const-string/jumbo v0, "AdView created. Version: 4.6.4"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .prologue
    .line 95
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->trackingEvironmentEnabled:Z

    .line 38
    new-instance v0, Lcom/my/target/ads/MyTargetView$1;

    invoke-direct {v0, p0}, Lcom/my/target/ads/MyTargetView$1;-><init>(Lcom/my/target/ads/MyTargetView;)V

    iput-object v0, p0, Lcom/my/target/ads/MyTargetView;->adListener:Lcom/my/target/core/facades/h$a;

    .line 96
    const-string/jumbo v0, "AdView created. Version: 4.6.4"

    invoke-static {v0}, Lcom/my/target/Tracer;->i(Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/ads/MyTargetView;)Lcom/my/target/core/facades/h;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    return-object v0
.end method

.method static synthetic access$100(Lcom/my/target/ads/MyTargetView;)Lcom/my/target/core/engines/b;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    return-object v0
.end method

.method static synthetic access$102(Lcom/my/target/ads/MyTargetView;Lcom/my/target/core/engines/b;)Lcom/my/target/core/engines/b;
    .locals 0

    .prologue
    .line 21
    iput-object p1, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    return-object p1
.end method

.method static synthetic access$200(Lcom/my/target/ads/MyTargetView;)Lcom/my/target/ads/MyTargetView$MyTargetViewListener;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->listener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    return-object v0
.end method

.method private checkInit()Z
    .locals 1

    .prologue
    .line 151
    iget-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->isInitialized:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 153
    :goto_0
    return v0

    .line 152
    :cond_0
    const-string/jumbo v0, "AdView not initialized"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 153
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 178
    iget-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->isInitialized:Z

    if-eqz v0, :cond_1

    .line 180
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    invoke-interface {v0}, Lcom/my/target/core/engines/b;->f()V

    .line 183
    iput-object v1, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    .line 185
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->isInitialized:Z

    .line 186
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 187
    iput-object v1, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    .line 189
    :cond_1
    iput-object v1, p0, Lcom/my/target/ads/MyTargetView;->listener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    .line 190
    return-void
.end method

.method public getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->listener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    return-object v0
.end method

.method public init(I)V
    .locals 2

    .prologue
    .line 104
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/my/target/ads/MyTargetView;->init(ILcom/my/target/ads/CustomParams;Z)V

    .line 105
    return-void
.end method

.method public init(II)V
    .locals 2

    .prologue
    .line 119
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/my/target/ads/MyTargetView;->init(IILcom/my/target/ads/CustomParams;Z)V

    .line 120
    return-void
.end method

.method public init(IILcom/my/target/ads/CustomParams;)V
    .locals 1

    .prologue
    .line 124
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/my/target/ads/MyTargetView;->init(IILcom/my/target/ads/CustomParams;Z)V

    .line 125
    return-void
.end method

.method public init(IILcom/my/target/ads/CustomParams;Z)V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 129
    iget-boolean v0, p0, Lcom/my/target/ads/MyTargetView;->isInitialized:Z

    if-eqz v0, :cond_0

    .line 142
    :goto_0
    return-void

    .line 131
    :cond_0
    const-string/jumbo v2, "standard_320x50"

    .line 132
    if-ne p2, v6, :cond_1

    .line 134
    const-string/jumbo v2, "standard_300x250"

    .line 137
    :cond_1
    new-instance v0, Lcom/my/target/core/facades/h;

    invoke-virtual {p0}, Lcom/my/target/ads/MyTargetView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    move v1, p1

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/my/target/core/facades/h;-><init>(ILjava/lang/String;Landroid/content/Context;Lcom/my/target/ads/CustomParams;Ljava/lang/Boolean;)V

    iput-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    .line 138
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    iget-boolean v1, p0, Lcom/my/target/ads/MyTargetView;->trackingEvironmentEnabled:Z

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->setTrackingEnvironmentEnabled(Z)V

    .line 139
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    iget-object v1, p0, Lcom/my/target/ads/MyTargetView;->adListener:Lcom/my/target/core/facades/h$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 140
    iput-boolean v6, p0, Lcom/my/target/ads/MyTargetView;->isInitialized:Z

    .line 141
    const-string/jumbo v0, "AdView initialized"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public init(ILcom/my/target/ads/CustomParams;)V
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/my/target/ads/MyTargetView;->init(ILcom/my/target/ads/CustomParams;Z)V

    .line 110
    return-void
.end method

.method public init(ILcom/my/target/ads/CustomParams;Z)V
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/my/target/ads/MyTargetView;->init(IILcom/my/target/ads/CustomParams;Z)V

    .line 115
    return-void
.end method

.method public load()V
    .locals 1

    .prologue
    .line 146
    invoke-direct {p0}, Lcom/my/target/ads/MyTargetView;->checkInit()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->load()V

    .line 147
    :cond_0
    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    invoke-interface {v0}, Lcom/my/target/core/engines/b;->a()V

    .line 169
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    invoke-interface {v0}, Lcom/my/target/core/engines/b;->b()V

    .line 174
    :cond_0
    return-void
.end method

.method public setListener(Lcom/my/target/ads/MyTargetView$MyTargetViewListener;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/my/target/ads/MyTargetView;->listener:Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    .line 70
    return-void
.end method

.method public setTrackingEnvironmentEnabled(Z)V
    .locals 1

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/my/target/ads/MyTargetView;->trackingEvironmentEnabled:Z

    .line 75
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->ad:Lcom/my/target/core/facades/h;

    invoke-virtual {v0, p1}, Lcom/my/target/core/facades/h;->setTrackingEnvironmentEnabled(Z)V

    .line 76
    :cond_0
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    invoke-interface {v0}, Lcom/my/target/core/engines/b;->d()V

    .line 159
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/ads/MyTargetView;->engine:Lcom/my/target/core/engines/b;

    invoke-interface {v0}, Lcom/my/target/core/engines/b;->c()V

    .line 164
    :cond_0
    return-void
.end method
