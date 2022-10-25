.class final Lcom/my/target/core/engines/i$11;
.super Ljava/lang/Object;
.source "StandardAdEngine.java"

# interfaces
.implements Lcom/my/target/core/communication/js/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/i;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/i;)V
    .locals 0

    .prologue
    .line 469
    iput-object p1, p0, Lcom/my/target/core/engines/i$11;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/communication/js/events/f;)V
    .locals 2

    .prologue
    .line 473
    check-cast p1, Lcom/my/target/core/communication/js/events/i;

    .line 474
    invoke-virtual {p1}, Lcom/my/target/core/communication/js/events/i;->b()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/i$11;->a:Lcom/my/target/core/engines/i;

    iget-object v1, v1, Lcom/my/target/core/engines/i;->b:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/my/target/core/async/a;->a(Ljava/util/List;Landroid/content/Context;)V

    .line 475
    return-void
.end method
