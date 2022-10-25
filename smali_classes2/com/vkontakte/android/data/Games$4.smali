.class final Lcom/vkontakte/android/data/Games$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Games.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Games;->fadeDrawables(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$drawables:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 297
    iput-object p1, p0, Lcom/vkontakte/android/data/Games$4;->val$drawables:Ljava/util/ArrayList;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 307
    iget-object v1, p0, Lcom/vkontakte/android/data/Games$4;->val$drawables:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 308
    .local v0, "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;->setCanceled()V

    goto :goto_0

    .line 310
    .end local v0    # "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 300
    iget-object v1, p0, Lcom/vkontakte/android/data/Games$4;->val$drawables:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 301
    .local v0, "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;->setCanceled()V

    goto :goto_0

    .line 303
    .end local v0    # "drawable":Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    :cond_0
    return-void
.end method
