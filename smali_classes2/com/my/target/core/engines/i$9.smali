.class final Lcom/my/target/core/engines/i$9;
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
    .line 447
    iput-object p1, p0, Lcom/my/target/core/engines/i$9;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/communication/js/events/f;)V
    .locals 5

    .prologue
    .line 451
    check-cast p1, Lcom/my/target/core/communication/js/events/d;

    .line 452
    iget-object v0, p0, Lcom/my/target/core/engines/i$9;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v1

    invoke-virtual {p1}, Lcom/my/target/core/communication/js/events/d;->b()[Ljava/lang/String;

    move-result-object v2

    .line 1126
    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    aget-object v4, v2, v0

    .line 1128
    invoke-virtual {v1, v4}, Lcom/my/target/core/facades/h;->b(Ljava/lang/String;)V

    .line 1126
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 453
    :cond_0
    return-void
.end method
