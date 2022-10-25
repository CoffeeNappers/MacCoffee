.class public final Lcom/my/target/core/engines/g;
.super Lcom/my/target/core/engines/a;
.source "Native300x250Engine.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final c:Lcom/my/target/ads/MyTargetView;

.field private d:Lcom/my/target/core/facades/h;

.field private e:Lcom/my/target/core/net/b$a;

.field private final f:Lcom/my/target/core/ui/views/StandardNative300x250View;

.field private g:Lcom/my/target/core/models/banners/j;

.field private h:Z


# direct methods
.method public constructor <init>(Lcom/my/target/ads/MyTargetView;Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lcom/my/target/core/engines/a;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;)V

    .line 26
    new-instance v0, Lcom/my/target/core/engines/g$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/g$1;-><init>(Lcom/my/target/core/engines/g;)V

    iput-object v0, p0, Lcom/my/target/core/engines/g;->e:Lcom/my/target/core/net/b$a;

    .line 62
    iput-object p1, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    .line 63
    new-instance v0, Lcom/my/target/core/ui/views/StandardNative300x250View;

    invoke-direct {v0, p2}, Lcom/my/target/core/ui/views/StandardNative300x250View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    .line 1083
    new-instance v0, Lcom/my/target/core/utils/l;

    iget-object v1, p0, Lcom/my/target/core/engines/g;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/my/target/core/utils/l;-><init>(Landroid/content/Context;)V

    .line 1084
    const/16 v1, 0xfa

    invoke-virtual {v0, v1}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    .line 1085
    const/16 v2, 0x12c

    invoke-virtual {v0, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v0

    .line 1087
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 1088
    const/16 v0, 0xd

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 1089
    iget-object v0, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    invoke-virtual {v0, v2}, Lcom/my/target/core/ui/views/StandardNative300x250View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1091
    iget-object v0, p0, Lcom/my/target/core/engines/g;->a:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 66
    return-void
.end method

.method static synthetic a(Lcom/my/target/core/engines/g;)Lcom/my/target/core/models/banners/j;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    return-object v0
.end method

.method static synthetic b(Lcom/my/target/core/engines/g;)Lcom/my/target/ads/MyTargetView;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    return-object v0
.end method

.method static synthetic c(Lcom/my/target/core/engines/g;)V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/my/target/core/engines/g;->h()V

    return-void
.end method

.method private h()V
    .locals 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    iget-object v1, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/StandardNative300x250View;->setBanner(Lcom/my/target/core/models/banners/j;)V

    .line 155
    iget-object v0, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    iget-boolean v1, p0, Lcom/my/target/core/engines/g;->h:Z

    invoke-virtual {v0, p0, v1}, Lcom/my/target/core/ui/views/StandardNative300x250View;->setOnClickListener(Landroid/view/View$OnClickListener;Z)V

    .line 157
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onLoad(Lcom/my/target/ads/MyTargetView;)V

    .line 158
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    iget-object v1, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->b(Ljava/lang/String;)V

    .line 159
    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/engines/b$a;)V
    .locals 0

    .prologue
    .line 57
    return-void
.end method

.method public final a(Lcom/my/target/core/facades/g;)V
    .locals 6

    .prologue
    .line 97
    instance-of v0, p1, Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_7

    .line 99
    check-cast p1, Lcom/my/target/core/facades/h;

    iput-object p1, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    .line 100
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->j()Lcom/my/target/core/models/j;

    move-result-object v1

    .line 102
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->f()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->f()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 104
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->f()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/j;

    iput-object v0, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    .line 105
    iget-object v0, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    if-nez v0, :cond_1

    .line 107
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "No ad"

    iget-object v2, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    .line 144
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->h()Lcom/my/target/core/models/sections/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/sections/j;->j()Z

    move-result v0

    iput-boolean v0, p0, Lcom/my/target/core/engines/g;->h:Z

    .line 114
    iget-object v0, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    iget-object v2, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    .line 115
    invoke-virtual {v2}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v2

    .line 114
    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/StandardNative300x250View;->setViewSettings(Lcom/my/target/core/models/j;Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    .line 1163
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1164
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1165
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1166
    :cond_2
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->a()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 1167
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->a()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v0

    .line 120
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    .line 122
    const-string/jumbo v3, "StandardAdEngine: load native"

    invoke-static {v3}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 123
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v3

    iget-object v4, p0, Lcom/my/target/core/engines/g;->b:Landroid/content/Context;

    iget-object v5, p0, Lcom/my/target/core/engines/g;->e:Lcom/my/target/core/net/b$a;

    invoke-virtual {v3, v2, v4, v5}, Lcom/my/target/core/net/b;->a(Ljava/util/List;Landroid/content/Context;Lcom/my/target/core/net/b$a;)V

    .line 124
    iget-object v2, p0, Lcom/my/target/core/engines/g;->f:Lcom/my/target/core/ui/views/StandardNative300x250View;

    invoke-virtual {v2, v1, v0}, Lcom/my/target/core/ui/views/StandardNative300x250View;->setViewSettings(Lcom/my/target/core/models/j;Ljava/lang/String;)V

    goto :goto_0

    .line 128
    :cond_4
    iget-object v1, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v1}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 130
    const-string/jumbo v1, "banner"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 132
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "No banner picture"

    iget-object v2, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    .line 133
    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    goto :goto_0

    .line 136
    :cond_5
    const-string/jumbo v0, "StandardAdEngine: there are no pictures in teaser"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 137
    invoke-direct {p0}, Lcom/my/target/core/engines/g;->h()V

    goto/16 :goto_0

    .line 141
    :cond_6
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "No ad"

    iget-object v2, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    goto/16 :goto_0

    .line 143
    :cond_7
    const-string/jumbo v0, "StandardAdEngine: incorrect ad type"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public final g()V
    .locals 0

    .prologue
    .line 150
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    if-eqz v0, :cond_1

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "StandardAdEngine: banner clicked "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/my/target/core/engines/g;->d:Lcom/my/target/core/facades/h;

    iget-object v1, p0, Lcom/my/target/core/engines/g;->g:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Ljava/lang/String;)V

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 77
    iget-object v0, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/g;->c:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onClick(Lcom/my/target/ads/MyTargetView;)V

    .line 79
    :cond_1
    return-void
.end method
