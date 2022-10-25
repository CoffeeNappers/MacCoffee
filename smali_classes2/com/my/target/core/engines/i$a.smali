.class final Lcom/my/target/core/engines/i$a;
.super Ljava/lang/Object;
.source "StandardAdEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 569
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 570
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .prologue
    .line 542
    iput-boolean p1, p0, Lcom/my/target/core/engines/i$a;->a:Z

    .line 543
    return-void
.end method

.method public final a()Z
    .locals 1

    .prologue
    .line 537
    iget-boolean v0, p0, Lcom/my/target/core/engines/i$a;->a:Z

    return v0
.end method

.method public final b(Z)V
    .locals 0

    .prologue
    .line 552
    iput-boolean p1, p0, Lcom/my/target/core/engines/i$a;->b:Z

    .line 553
    return-void
.end method

.method public final b()Z
    .locals 1

    .prologue
    .line 547
    iget-boolean v0, p0, Lcom/my/target/core/engines/i$a;->b:Z

    return v0
.end method

.method public final c()Z
    .locals 1

    .prologue
    .line 557
    iget-boolean v0, p0, Lcom/my/target/core/engines/i$a;->c:Z

    return v0
.end method

.method public final d()V
    .locals 1

    .prologue
    .line 562
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/engines/i$a;->c:Z

    .line 563
    return-void
.end method

.method public final e()V
    .locals 1

    .prologue
    .line 577
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/engines/i$a;->c:Z

    iput-boolean v0, p0, Lcom/my/target/core/engines/i$a;->b:Z

    iput-boolean v0, p0, Lcom/my/target/core/engines/i$a;->a:Z

    .line 578
    return-void
.end method
