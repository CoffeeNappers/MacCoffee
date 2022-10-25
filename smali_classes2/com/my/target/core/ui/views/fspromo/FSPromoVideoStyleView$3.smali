.class final Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;
.super Ljava/lang/Object;
.source "FSPromoVideoStyleView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;


# direct methods
.method constructor <init>(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)V
    .locals 0

    .prologue
    .line 125
    iput-object p1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 129
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 130
    invoke-static {}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->i()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 132
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;->a()V

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->b(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)V

    .line 155
    :cond_1
    :goto_0
    return-void

    .line 137
    :cond_2
    invoke-static {}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->j()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 139
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 141
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;->b()V

    .line 143
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->f(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)V

    goto :goto_0

    .line 144
    :cond_4
    invoke-static {}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->k()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 146
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 148
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->a()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 149
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;->c()V

    .line 153
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->b(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)V

    goto :goto_0

    .line 151
    :cond_6
    iget-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView$3;->a:Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;

    invoke-static {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;->e(Lcom/my/target/core/ui/views/fspromo/FSPromoVideoStyleView;)Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;->a()V

    goto :goto_1
.end method
