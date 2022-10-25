.class Lcom/vkontakte/android/ui/animation/MovieDrawable$2;
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
    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$2;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable$2;->this$0:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->invalidateSelf()V

    .line 47
    return-void
.end method
