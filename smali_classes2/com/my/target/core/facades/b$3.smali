.class final Lcom/my/target/core/facades/b$3;
.super Ljava/lang/Object;
.source "AbstractNativeAd.java"

# interfaces
.implements Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/facades/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/facades/b;


# direct methods
.method constructor <init>(Lcom/my/target/core/facades/b;)V
    .locals 0

    .prologue
    .line 156
    iput-object p1, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCardChange(Landroid/view/View;Lcom/my/target/nativeads/banners/NativePromoCard;)V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-static {v0}, Lcom/my/target/core/facades/b;->access$200(Lcom/my/target/core/facades/b;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-static {v0}, Lcom/my/target/core/facades/b;->access$200(Lcom/my/target/core/facades/b;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-static {v0}, Lcom/my/target/core/facades/b;->access$300(Lcom/my/target/core/facades/b;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-static {v0}, Lcom/my/target/core/facades/b;->access$200(Lcom/my/target/core/facades/b;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    check-cast p2, Lcom/my/target/core/models/banners/d;

    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v0, v0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    invoke-static {p2, v0}, Lcom/my/target/core/models/c;->c(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 186
    :cond_0
    return-void
.end method

.method public final onClick(Landroid/view/View;Lcom/my/target/nativeads/banners/NativePromoCard;)V
    .locals 3

    .prologue
    .line 160
    const-string/jumbo v0, "Click on native card received"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v0, v0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v0, v0, Lcom/my/target/core/facades/b;->adData:Lcom/my/target/core/models/c;

    if-nez v0, :cond_1

    .line 172
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-static {v0}, Lcom/my/target/core/facades/b;->access$100(Lcom/my/target/core/facades/b;)Lcom/my/target/core/facades/b$a;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 166
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-static {v0}, Lcom/my/target/core/facades/b;->access$100(Lcom/my/target/core/facades/b;)Lcom/my/target/core/facades/b$a;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    invoke-interface {v0, v1}, Lcom/my/target/core/facades/b$a;->onClick(Lcom/my/target/core/facades/b;)V

    .line 167
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v0, v0, Lcom/my/target/core/facades/b;->adData:Lcom/my/target/core/models/c;

    check-cast p2, Lcom/my/target/core/models/banners/d;

    iget-object v1, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v1, v1, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    invoke-virtual {v0, p2, v1}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 170
    iget-object v0, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v0, v0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    const-string/jumbo v1, "click"

    iget-object v2, p0, Lcom/my/target/core/facades/b$3;->a:Lcom/my/target/core/facades/b;

    iget-object v2, v2, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0
.end method
