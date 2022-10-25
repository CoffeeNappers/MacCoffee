.class Lcom/vkontakte/android/ui/animation/MovieDrawable$3;
.super Ljava/lang/Object;
.source "MovieDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/animation/MovieDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$3;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$3;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$400(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$3;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->access$400(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$3;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 56
    :cond_0
    return-void
.end method
