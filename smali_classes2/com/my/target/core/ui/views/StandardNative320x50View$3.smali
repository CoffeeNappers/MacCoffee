.class final Lcom/my/target/core/ui/views/StandardNative320x50View$3;
.super Ljava/lang/Object;
.source "StandardNative320x50View.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/ui/views/StandardNative320x50View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/ui/views/StandardNative320x50View;


# direct methods
.method constructor <init>(Lcom/my/target/core/ui/views/StandardNative320x50View;)V
    .locals 0

    .prologue
    .line 92
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$3;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$3;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->g(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/engines/h;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$3;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->g(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/engines/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$3;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->h(Lcom/my/target/core/ui/views/StandardNative320x50View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/engines/h;->a(Ljava/lang/String;)V

    .line 100
    :cond_0
    return-void
.end method
